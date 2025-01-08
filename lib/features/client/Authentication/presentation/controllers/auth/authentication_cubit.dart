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
  TextEditingController passwordConfirmationRegisterController =
      TextEditingController();
  TextEditingController firstNameRegisterController = TextEditingController();
  TextEditingController mobileNumberRegisterController =
      TextEditingController();
  TextEditingController lastNameRegisterController = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  final logInFormKey = GlobalKey<FormState>();
  final forgetPasswordViewFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();
  static late UserDataModel userPersonalData;
  String citySelection = "Dubai";
  String profileCitySelection = "Dubai";
  bool isTextSecure = true;
  void addUserToDataBaseWithOtherMethods() async {
    try {
      emit(AddingUserDataState());
      final instance = FirebaseFirestore.instance.collection("Users");
      final obj = await instance.add({
        "first_name": firstNameRegisterController.text,
        "last_name": lastNameRegisterController.text,
        "email": "Registered With Third Party Account",
        "password": "Registered With Third Party Account",
        "role": "client",
        "mobile_number": mobileNumberRegisterController.text,
        "city": citySelection,
      });
      log("******* addUserToDataBaseWithOtherMethods Function *******");
      log(obj.path);
      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataId, value: obj.id);
      emit(AddingUserDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBaseWithOtherMethods Function ********");
      log(e.toString());
      AddingUserDataErrorState(error: e.toString());
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
      if (res.additionalUserInfo?.isNewUser == true) {
        emit(NewUserStata());
      }
      if (res.credential == null) {
        emit(ErrorLogInWithAppleState(
            error: "Something went wrong , Please try again later"));
      } else if (res.additionalUserInfo?.isNewUser == false) {
        emit(SuccessLogInWithAppleState());
      }
    } catch (e) {
      log(e.toString());
      emit(ErrorLogInWithAppleState(error: e.toString()));
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
      final instance = FirebaseFirestore.instance.collection("Users");
      await instance
          .doc(SharedPreferencesManager.getStringValue(
              key: StorageConstants.userDataId))
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

  void addUserToDataBase() async {
    try {
      emit(AddingUserDataState());
      final instance = FirebaseFirestore.instance.collection("Users");
      final obj = await instance.add({
        "first_name": firstNameRegisterController.text,
        "last_name": lastNameRegisterController.text,
        "email": emailRegisterController.text,
        "password": passwordRegisterController.text,
        "role": "client",
        "mobile_number": mobileNumberRegisterController.text,
        "city": citySelection,
      });
      log("******* addUserToDataBase *******");
      log(obj.path);
      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataId, value: obj.id);
      emit(AddingUserDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBase ********");
      log(e.toString());
      AddingUserDataErrorState(error: e.toString());
    }
  }

  Future<void> getUserData() async {
    try {
      emit(FetchingUserDataState());
      final userId = SharedPreferencesManager.getStringValue(
          key: StorageConstants.userDataId);
      if (userId.isEmpty) {
        log(userId);
        log('User id not cached');
        emit(FetchUserDataErrorState(error: "User Data fetch failed"));
        return;
      }

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final instance = FirebaseFirestore.instance.collection(collectionName);
      DocumentSnapshot<Map<String, dynamic>> res =
          await instance.doc(userId).get();
      print(SharedPreferencesManager.getStringValue(
          key: StorageConstants.userDataId));
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
    } catch (e) {
      log("---------------");
      log(e.toString());
      emit(FetchUserDataErrorState(error: e.toString()));
    }
  }

  registerWithEmail() async {
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

  logInWithEmail() async {
    // normal login
    try {
      emit(LoadingLogInWithEmailState());
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailLogInController.text,
          password: passwordLogInController.text);
      await SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userId, value: response.user?.uid ?? "");

      print('checking the response user id while login in with email');
      print(response.user?.uid);
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

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(SuccessLogInWithGoogleState());
    } on FirebaseAuthException catch (e) {
      emit(ErrorLogInWithGoogleState(error: "Firebase Error: ${e.message}"));
    } on Exception catch (e) {
      emit(ErrorLogInWithGoogleState(
          error: "An error occurred: ${e.toString()}"));
    }
  }
}
