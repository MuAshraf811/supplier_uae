import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/client/Authentication/model/user_data_model.dart';
=======
import 'package:supplier_app/core/cubit/app_config_cubit.dart';
import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/features/client/Authentication/model/user_data_model.dart';
>>>>>>> 057b281301ca97393404df537bfcf6817dae9f82
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../../core/utils/notification_service.dart';
import '../../../../../../core/utils/service_locator.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  bool isMoreThan8 = false;
  bool isUpperCase = false;
  bool isSpecial = false;
  bool isNumber = false;
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController firstNameProfileController = TextEditingController();
  TextEditingController lastNameProfileController = TextEditingController();
  TextEditingController mobileProfileController = TextEditingController();
  TextEditingController emailResetController = TextEditingController();
  TextEditingController emailLogInController = TextEditingController();
  TextEditingController passwordLogInController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController passwordConfirmationRegisterController = TextEditingController();
  TextEditingController firstNameRegisterController = TextEditingController();
  TextEditingController mobileNumberRegisterController =   TextEditingController();
  TextEditingController lastNameRegisterController = TextEditingController();


  // final registerFormKey = GlobalKey<FormState>();
  // final logInFormKey = GlobalKey<FormState>();
  // final forgetPasswordViewFormKey = GlobalKey<FormState>();
  // final profileFormKey = GlobalKey<FormState>();
  static late UserDataModel userPersonalData;
  String citySelection = "Dubai";
  String profileCitySelection = "Dubai";
  bool isTextSecure = true;



  Future<bool> addUserToDataBase() async {
    try {
      emit(AddingUserDataState());
      
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) throw Exception("User not authenticated");

      // Check for duplicate again right before adding to database
      bool isDuplicate = await checkEmailOrPhoneDuplication(
        emailRegisterController.text, 
        mobileNumberRegisterController.text
      );

      if (isDuplicate) {
        emit(AddingUserDataErrorState(error: "Email or Phone number already exists"));
        return false;
      }

      final fcmToken = SharedPreferencesManager.getStringValue(
        key: StorageConstants.fcmToken
      );

      final userData = {
        "first_name": firstNameRegisterController.text,
        "last_name": lastNameRegisterController.text,
        "email": emailRegisterController.text,
        "password": passwordRegisterController.text,
        "role": "client",
        "mobile_number": mobileNumberRegisterController.text,
        "city": citySelection,
        "uuid": currentUser.uid,
        "fcmToken": fcmToken,
        "notificationHistory": ""
      };

      final docRef = await FirebaseFirestore.instance
          .collection("Users")
          .add(userData);

      // Store document ID
      await SharedPreferencesManager.storeStringValue(
        key: StorageConstants.userDataIdKey, 
        value: docRef.id
      );

      // Send notification to admin
      await ServiceLocator.getIt<NotificationService>().createNotification(
        title: "New client registered",
        body: "Client email: ${emailRegisterController.text}",
        recipientId: 'admin',
      );

      emit(AddingUserDataSuccessState());
      return true;
      
    } catch (e, stack) {
      log("Database addition error: $e");
      log("Stack trace: $stack");
      emit(AddingUserDataErrorState(error: "Failed to add user data"));
      return false;
    }
  }


  void addUserToDataBaseWithOtherMethods() async {
    try {
      emit(AddingUserDataState());
      // final user = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //   email: emailRegisterController.text,
      //   password: passwordRegisterController.text,);
      String currentUUID = SharedPreferencesManager.getStringValue(
          key: StorageConstants.userId,);

      final fcmToken = SharedPreferencesManager.getStringValue(key: StorageConstants.fcmToken);

      final instance =
        FirebaseFirestore.instance.collection("Users");
      
      bool isDuplicate = await checkEmailOrPhoneDuplication(emailRegisterController.text, mobileNumberRegisterController.text);

      if(isDuplicate){
        emit(AddingUserDataErrorState(error: "Email or Phone number already exists"));
        return;
      }
      final obj = await instance.add({
        "first_name": firstNameRegisterController.text,
        "last_name": lastNameRegisterController.text,
        "email": emailRegisterController.text,
        "password": "Registered With Third Party Account",
        "role": "client",
        "mobile_number": mobileNumberRegisterController.text,
        "city": citySelection,
        "uuid": currentUUID,
        "fcmToken": fcmToken,
      });
      log("******* addUserToDataBaseWithOtherMethods Success *******");
      log(obj.path);
      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataIdKey, value: obj.id);
      ServiceLocator.getIt<NotificationService>().createNotification(
        title: "New client registered",
        body: "Client email: ${emailRegisterController.text}",
        recipientId: 'admin',
      );
      emit(AddingUserDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBaseWithOtherMethods Failure ********");
      log(e.toString());
      AddingUserDataErrorState(error: e.toString());
    }
  }

  void changePassword() async {
    
  }
  void deleteAccount() async {
    try {} catch (e) {
      log(e.toString());
    }
  }

  void forgetPassword() async {
    emit(SendingPasswordResetEmailState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailResetController.text,
      );

      emit(SendingPasswordResetEmailSuccessState());
    } catch (e) {
      log(e.toString());
      emit(SendingPasswordResetEmailErrorState(error: e.toString()));
    }
  }

  void updateUserInfo() async {
    try {
      emit(UpdatingUserDataState());
      final instance =
        FirebaseFirestore.instance.collection("Users");
      await instance
          .doc(SharedPreferencesManager.getStringValue(
              key: StorageConstants.userDataIdKey))
          .update(
        {
          "first_name": firstNameProfileController.text,
          "last_name": lastNameProfileController.text,
          "mobile_number": mobileProfileController.text,
          "city": profileCitySelection,
        },
      );
      emit(UpdatingUserDataSuccessState());
    } catch (e) {
      log("********************");
      log(e.toString());
      emit(UpdateUserDataErrorState(error: e.toString()));
    }
  }

  Future<void> getUserData() async {
    try {
      emit(FetchingUserDataState());
      final userDataId = SharedPreferencesManager.getStringValue(
          key: StorageConstants.userDataIdKey);
      if (userDataId.isEmpty) {
        log(userDataId);
        log('User id not cached');
        emit(FetchUserDataErrorState(error: "User Data fetch failed"));
        return;
      }

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final instance =
      FirebaseFirestore.instance.collection(collectionName);
      DocumentSnapshot<Map<String, dynamic>> res =
          await instance.doc(userDataId).get();
      if (res.data() != null) {
        userPersonalData = UserDataModel.fromJson(res.data()!);
        emit(FetchingUserDataSuccessState());
        profileCitySelection == userPersonalData.city;
        emailProfileController.text = userPersonalData.email;
        firstNameProfileController.text = userPersonalData.firstName;
        lastNameProfileController.text = userPersonalData.lastName;
        mobileProfileController.text = userPersonalData.mobileNumber;
      } else {
        log(res.data().toString());
        emit(FetchUserDataErrorState(error: "Couldn't fetch your data"));
      }
    } catch (e,stack) {
      log("---------------");
      log(e.toString());
      print(stack);
      emit(FetchUserDataErrorState(error: e.toString()));
    }
  }

Future<bool> registerWithEmail() async {
    try {
      emit(LoadingAuthenticationWithEmailState());
      
      // Check for duplicate email/phone before attempting registration
      bool isDuplicate = await checkEmailOrPhoneDuplication(
        emailRegisterController.text, 
        mobileNumberRegisterController.text
      );

      if (isDuplicate) {
        emit(ErrorAuthenticationWithEmailState(
          error: "Email or Phone number already exists"
        ));
        return false;
      }

      // Create user with email and password
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailRegisterController.text,
            password: passwordRegisterController.text);

      // Store user ID
      await SharedPreferencesManager.storeStringValue(
        key: StorageConstants.userId, 
        value: response.user!.uid
      );

      emit(SuccessAuthenticationWithEmailState());
      return true;
      
    } on FirebaseAuthException catch (e) {
      emit(ErrorAuthenticationWithEmailState(error: e.message.toString()));
      return false;
    } catch (e) {
      emit(ErrorAuthenticationWithEmailState(error: "An unexpected error occurred"));
      return false;
    }
  }


  Future<void> logInWithEmail() async {
    // normal login
    try {
      emit(LoadingLogInWithEmailState());
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailLogInController.text,
          password: passwordLogInController.text);

      await SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userId, value: response.user?.uid ?? "");
      print('current logged user id..not data id?');
      print(response.user?.uid);

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';

      final instance =
      FirebaseFirestore.instance.collection(collectionName);

      final  res = await instance
          .where("uuid",isEqualTo: response.user?.uid).get();

      userPersonalData = UserDataModel.fromJson(res.docs.first.data());
      profileCitySelection == userPersonalData.city;
      emailProfileController.text = userPersonalData.email;
      firstNameProfileController.text = userPersonalData.firstName;
      lastNameProfileController.text = userPersonalData.lastName;
      mobileProfileController.text = userPersonalData.mobileNumber;


      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userId,
          value: response.user!.uid);

      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataIdKey,
          value: res.docs.first.id);

      final fcmToken = SharedPreferencesManager.getStringValue(key: StorageConstants.fcmToken);
      instance.doc(res.docs.first.id).update(
        {
          "fcmToken": fcmToken,
        },
      );
      print('current logged user data id');
      print(res.docs.first.id);
      emit(SuccessLogInWithEmailState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorLogInWithEmailState(error: e.message.toString()));
    }
  }

  registerWithGoogle() async {
    try {
      emit(LoadingLogInWithGoogleState());

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(ErrorLogInWithGoogleState(error: "Sign-in process was aborted."));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCred = await FirebaseAuth.instance.signInWithCredential(credential);

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final res = await FirebaseFirestore.instance
          .collection(collectionName)
      .where('email', isEqualTo: googleUser.email).get();

      if(res.docs.isNotEmpty){

        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId,
            value: res.docs.first['uuid']);

        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userDataIdKey,
            value: res.docs.first.id);

        emit(SuccessLogInWithGoogleState());
      }
      else{
        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId, value: userCred.user!.uid);
        emailRegisterController.text = googleUser.email;

        emit(NewUserState());
      }
    } on FirebaseAuthException catch (e) {
      emit(ErrorLogInWithGoogleState(error: "Firebase Error: ${e.message}"));
    } on Exception catch (e) {
      emit(ErrorLogInWithGoogleState(
          error: "An error occurred: ${e.toString()}"));
    }
  }

  logInWithApple() async {
    try {
      emit(LoadingLogInWithAppleState());
      final provider = AppleAuthProvider()
        ..addScope('email')
        ..addScope('fullName')
        ..setCustomParameters({
          'prompt': 'consent', 
          'access_type': 'offline'
        });

      final UserCredential res = await FirebaseAuth.instance
                          .signInWithProvider(provider);
      
      
      final additionalInfo = res.additionalUserInfo?.profile;
      if (additionalInfo != null) {
        String? firstName = additionalInfo['given_name'];
        String? lastName = additionalInfo['family_name'];
        String? email = additionalInfo['email'];
      
        firstNameRegisterController.text = firstName??"N/A";
        lastNameRegisterController.text = lastName??"N/A";
        emailRegisterController.text = email??"N/A";
      }
      
      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final userRes = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('uuid', isEqualTo: res.user!.uid).get();

      if (userRes.docs.isEmpty) {
        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId, value: res.user!.uid);
        emit(NewUserState());
      }
      if (res.credential == null) {
        emit(ErrorLogInWithAppleState(
            error: "Something went wrong , Please try again later"));
      } else if (userRes.docs.isNotEmpty) {
        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId,
            value: res.user!.uid);

        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userDataIdKey,
            value: userRes.docs.first.id);

        emit(SuccessLogInWithAppleState());
      }
    } catch (e) {
      log(e.toString());
      emit(ErrorLogInWithAppleState(error: e.toString()));
    }
  }

  void clearControllers() {
    emailProfileController.clear();
    firstNameProfileController.clear();
    lastNameProfileController.clear();
    mobileProfileController.clear();
    emailResetController.clear();
    emailLogInController.clear();
    passwordLogInController.clear();
    emailRegisterController.clear();
    passwordRegisterController.clear();
    passwordConfirmationRegisterController.clear();
    firstNameRegisterController.clear();
    mobileNumberRegisterController.clear();
    lastNameRegisterController.clear();
  }


  Future<bool> checkEmailOrPhoneDuplication(String email, String phone)async {
    
    var res = await FirebaseFirestore.instance
          .collection('Suppliers')
          .where('email', isEqualTo: email).get();
    if(res.docs.isNotEmpty){
      return true;
    }
   

    res = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email).get();
    if(res.docs.isNotEmpty){
      return true;
    }
   
    return false;
  }

  void passwordChangeNotifier() {
    emit(PassFieldChangedState());
  }


Future<String> approveOffer(String? offerId,String? orderId,String? supplierId,) async {
  try {
    final  supplierDataId =
    await FirebaseFirestore.instance.collection('Suppliers')
        .doc(supplierId).get();

    await FirebaseFirestore.instance
        .collection("client_approvals")
        .add({
          "offerId":offerId??"",
          "orderId":orderId??"",
          "supplierId":supplierId??"",
          "clientEmail":userPersonalData.email,
          "supplierName":supplierDataId.data()!['companyName']??"",
          "offerDate":"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} at: ${DateTime.now().hour}:${DateTime.now().minute}"
        });
    return "Congrats! Now, wait for admin to contact you";
  } on Exception catch (e) {
    return e.toString();
  }
}

  //
  // Future<void> reportAdmin(String? title,String? body,String? userId,) async {
  //   // String reportDate = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} at: ${DateTime.now().hour}:${DateTime.now().minute}";
  //
  //   String collectionName = 'admin_notifications';
  //   final instance = FirebaseFirestore.instance.collection(collectionName);
  //   final res = await instance.get();
  //   String responseHistory= res.docs.first.data()['notifications_history'];
  //   List<NotificationModel> adminNotifications = [];
  //
  //     // convert history into a list
  //     if (responseHistory.isNotEmpty) {
  //       final dynamic jsonData = jsonDecode(responseHistory);
  //       // print(jsonData.toString());
  //       // Handle single notification case
  //       if (jsonData is Map<String, dynamic>) {
  //         // If it's a single notification
  //         adminNotifications = [NotificationModel.fromJson(jsonData)];
  //       } else if (jsonData is List) {
  //         // If it's a list of notifications
  //         adminNotifications = jsonData
  //             .map((item) =>
  //             NotificationModel.fromJson(item as Map<String, dynamic>))
  //             .toList();
  //       }
  //     } else {
  //       adminNotifications = [];
  //     }
  //   // add new notification to the list
  //   adminNotifications.add(NotificationModel(
  //       id: '0',
  //       title: title??"",
  //       body: body??"",
  //       date: DateTime.now(),
  //       userId: AppConfigCubit.currentUserDataId
  //   ));
  //
  //   // convert list back to json encodded string
  //   final List<Map<String, dynamic>> notificationsJson =
  //   adminNotifications.map((notification) => notification.toJson()).toList();
  //
  //   await instance
  //       .doc(res.docs.first.id)
  //       .update({'notification_history': jsonEncode(notificationsJson)});
  // }

}
