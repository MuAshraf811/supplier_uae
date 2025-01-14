import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/client/Authentication/model/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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



  Future<void>  addUserToDataBase() async {
    try {
      emit(AddingUserDataState());
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailRegisterController.text,
        password: passwordRegisterController.text,);
      try {
        await SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId, value: user.user!.uid );
      } on Exception catch (e) {
        log(e.toString());
        AddingUserDataErrorState(error: e.toString());
      }
      final fcmToken = SharedPreferencesManager.getStringValue(key: StorageConstants.fcmToken);

      final instance = FirebaseFirestore.instance.collection("Users");
      final obj = await instance.add({
        "first_name": firstNameRegisterController.text,
        "last_name": lastNameRegisterController.text,
        "email": emailRegisterController.text,
        "password": passwordRegisterController.text,
        "role": "client",
        "mobile_number": mobileNumberRegisterController.text,
        "city": citySelection,
        "uuid": user.user!.uid,
        "fcmToken": fcmToken,
        "notificationHistory":""
      });
      log("******* addUserToDataBase *******");
      log(obj.path);
      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataIdKey, value: obj.id);
      emit(AddingUserDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBase ********");
      log(e.toString());
      AddingUserDataErrorState(error: e.toString());
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
      emit(AddingUserDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBaseWithOtherMethods Failure ********");
      log(e.toString());
      AddingUserDataErrorState(error: e.toString());
    }
  }

  void changePassword() async {}
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

  Future<void> registerWithEmail() async {
    try {
      emit(LoadingAuthenticationWithEmailState());
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailRegisterController.text,
              password: passwordRegisterController.text);

      log(response.user!.email.toString());
      emit(SuccessAuthenticationWithEmailState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorAuthenticationWithEmailState(error: e.message.toString()));
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

      print('signed in with email and password');


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
      final provider = AppleAuthProvider();

      final UserCredential res =
      await FirebaseAuth.instance.signInWithProvider(provider);
      log(res.additionalUserInfo!.isNewUser.toString());
      log(res.additionalUserInfo!.toString());

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final userRes = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('email', isEqualTo: res.user!.email!).get();

      if (res.additionalUserInfo?.isNewUser == true) {
        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId, value: res.user!.uid);
        if(res.user?.email != null){
          emailRegisterController.text = res.user!.email!;
        }else{
          emailRegisterController.text = "Couldn't get the email";
        }
        emit(NewUserState());
      }
      if (res.credential == null) {
        emit(ErrorLogInWithAppleState(
            error: "Something went wrong , Please try again later"));
      } else if (res.additionalUserInfo?.isNewUser == false) {
        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId,
            value: userRes.docs.first['uuid']);

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
}
