import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/native/image_picker.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/supplier/Authentication/data/remote_data_base.dart';
import 'package:supplier/features/supplier/Authentication/model/supplier_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_auth_state.dart';

class SupplierAuthCubit extends Cubit<SupplierAuthState> {
  SupplierAuthCubit() : super(SupplierAuthInitial());
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController confirmPasswordRegisterController = TextEditingController();
  TextEditingController companyNameRegisterController = TextEditingController();
  TextEditingController bankNameRegisterController = TextEditingController();
  TextEditingController bankNameProfileController = TextEditingController();
  TextEditingController ipanNumberController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  // TextEditingController mobileNumberController = TextEditingController();
  PhoneController thePhoneController = PhoneController(initialValue: PhoneNumber.parse("+971"));
  TextEditingController cityController = TextEditingController();
  TextEditingController emailLogInController = TextEditingController();
  TextEditingController passwordLogInController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController companyNameProfileController = TextEditingController();
  TextEditingController ipanNumberProfileController = TextEditingController();
  TextEditingController mobileProfileController = TextEditingController();

  String citySelection = "Dubai";
  // final stepOneFormKey = GlobalKey<FormState>();
  // final stepTwoFormKey = GlobalKey<FormState>();
    // final logInFormKey = GlobalKey<FormState>();
  // final profileFormKey = GlobalKey<FormState>();

  // TextEditingController firstNameProfileController = TextEditingController();
  File? imageFile;

  String profileCitySelection = "Dubai";

  static late SupplierUserModel supplierPersonalData;

  void updateUserInfo() async {
    try {
      emit(UpdatingSupplierDataState());
      final instance =
      FirebaseFirestore.instance.collection("Suppliers");
      await instance
          .doc(SharedPreferencesManager.getStringValue(
          key: StorageConstants.userDataIdKey))
          .update(
        {
          "companyName": companyNameProfileController.text,
          "bankName": bankNameProfileController.text,
          "email": emailProfileController.text,
          "ipanNumber": ipanNumberProfileController.text,
          "mobile": mobileProfileController.text,
          "city": citySelection,
        },
      );
      emit(UpdatingSupplierDataSuccessState());
    } catch (e) {
      log("********************");
      log(e.toString());
      emit(UpdateSupplierDataErrorState(error: e.toString()));
    }
  }

  logInSupplier() async { 

    try { 
      emit(LogingInState());

      final isApproved = await checkSupplierApproved(email: emailLogInController.text);
      if(! isApproved){
        emit(LogingInErrorState(error: "Pending admin approval."));
        return;
      }

      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailLogInController.text,
      password: passwordLogInController.text,
    );
      await SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userId, value: response.user?.uid ?? "");
      print('current logged supplier id..not data id');
      print(response.user?.uid);

      final instance =
      FirebaseFirestore.instance.collection('Suppliers');

      final  res = await instance
          .where("uuid",isEqualTo: response.user?.uid).get();

      supplierPersonalData = SupplierUserModel.fromJson(res.docs.first.data());
      profileCitySelection == supplierPersonalData.city;
      emailProfileController.text = supplierPersonalData.email;
      mobileProfileController.text = supplierPersonalData.mobile;
      bankNameProfileController.text = supplierPersonalData.bankName;
      companyNameProfileController.text = supplierPersonalData.companyName;
      ipanNumberProfileController.text = supplierPersonalData.ipanNumber;

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

        print('current logged supplier data id');
        print(res.docs.first.id);
        emit(LogingInSuccessState());

    } catch (e) {
      if(e.toString() == 'Bad state: No element'){
        emit(LogingInErrorState(error: "You need to be a supplier first"));
      }
      emit(LogingInErrorState(error: e.toString()));
    }
   
  }

  Future<void> getUserData() async {
    try {
      emit(FetchingSupplierDataState());
      final userDataId = SharedPreferencesManager.getStringValue(
          key: StorageConstants.userDataIdKey);
      if (userDataId.isEmpty) {
        log(userDataId);
        log('User id not cached');
        emit(FetchSupplierDataErrorState(error: "No user data found"));
        return;
      }

      String collectionName = AppConfigCubit.isSupplier ? 'Suppliers' : 'Users';
      final instance =
      FirebaseFirestore.instance.collection(collectionName);
      DocumentSnapshot<Map<String, dynamic>> res =
      await instance.doc(userDataId).get();
      if (res.data() != null) {
        supplierPersonalData = SupplierUserModel.fromJson(res.data()!);
        profileCitySelection == supplierPersonalData.city;
        emailProfileController.text = supplierPersonalData.email;
        mobileProfileController.text = supplierPersonalData.mobile;
        bankNameProfileController.text = supplierPersonalData.bankName;
        companyNameProfileController.text = supplierPersonalData.companyName;
        ipanNumberProfileController.text = supplierPersonalData.ipanNumber;

      } else {
        log(res.data().toString());
        emit(FetchSupplierDataErrorState(error: "Couldn't fetch your data"));
      }
    } catch (e) {
      log("---------------");
      log(e.toString());
      emit(FetchSupplierDataErrorState(error: e.toString()));
    }
  }

  registerSupplierData() async {
    try {
      emit(UploadingUserState());
      bool isDuplicate = await checkEmailOrPhoneDuplication(emailRegisterController.text,"+${thePhoneController.value.countryCode}${thePhoneController.value.nsn}");
      if(isDuplicate){
        emit(UploadingUserStateErrorState(error: "Email or Phone number already exists"));
        return;
      }
      final imageName =
          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().second}.jpg";

      final userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailRegisterController.text,
          password: passwordRegisterController.text).timeout(const Duration(seconds: 5));
      try {
        await SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId, value: userCred.user!.uid );
      } on Exception catch (e) {
        log(e.toString());
        UploadingUserStateErrorState(error: e.toString());
        return;
      }
      await RemoteDataBase.createSupaBaseBucket();
      await RemoteDataBase.insertImageIntoBacket(
          imageFile: imageFile!, imagePath: imageName);

      final supplierData = SupplierUserModel(
        email: emailRegisterController.text,
        imagePath: RemoteDataBase.getImageUrl(path: imageName) ?? "",
        mobile:"+${thePhoneController.value.countryCode}${thePhoneController.value.nsn}",
        city: citySelection,
        companyName: companyNameRegisterController.text,
        taxNumber: taxNumberController.text,
        bankName: bankNameRegisterController.text,
        ipanNumber: ipanNumberController.text,
        uuid: userCred.user!.uid,
        approved: "FALSE"
      );
      final fcmToken = SharedPreferencesManager.getStringValue(key: StorageConstants.fcmToken);


    if(isDuplicate){
      emit(UploadingUserStateErrorState(error: "Email or Phone number already exists"));
      return;
    }else{
      final  supplierDataId =
     await FirebaseFirestore.instance
          .collection("Suppliers")
          .add(supplierData.toMap(fcmToken,""));
    
    AppConfigCubit.currentUserDataId = supplierDataId.id;
        await  SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userDataIdKey,
            value: supplierDataId.id
        );
      emit(UploadingUserStateSuccessState());
      return;
    }

    } catch (e) {  
      log(e.toString());
      UploadingUserStateErrorState(error: e.toString());
      return;
    }
  }

  getTradeLisence() async {
    try {
      final image = await ImagePickerHelper.pick(false);
      if (image != null) {
        imageFile = File(image.path);
        emit(FetchingTradeLisenceSuccessState());
      } else {
        emit(FetchingTradeLisenceErrorState(error: "Can not pick image"));
      }
    } catch (e) {
      log(e.toString());
      emit(FetchingTradeLisenceErrorState(error: e.toString()));
    }
  }

  uploadTradeLisence() async {
    final imageName =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().second}.jpg";
    try {
      emit(UploadingTradeLisenceState());
      await RemoteDataBase.createSupaBaseBucket();
      await RemoteDataBase.insertImageIntoBacket(
          imageFile: imageFile ?? File(""), imagePath: imageName);
      emit(UploadingTradeLisenceSuccessState());
    } catch (e) {
      emit(UploadingTradeLisenceErrorState(error: e.toString()));
    }
  }

  void clearControllers() {

    companyNameProfileController.text = '';
    companyNameRegisterController.text = '';
    confirmPasswordRegisterController.text = '';
    bankNameProfileController.text = '';
    bankNameRegisterController.text = '';
    cityController.text = '';
    ipanNumberProfileController.text = '';
    mobileProfileController.text = '';
    thePhoneController.value = PhoneNumber.parse("+971");
    taxNumberController.text = '';
    emailLogInController.text = '';
    emailProfileController.text = '';
    emailRegisterController.text = '';
    passwordRegisterController.text = '';
    passwordLogInController.text = '';

    companyNameProfileController.clear();
    companyNameRegisterController.clear();
    confirmPasswordRegisterController.clear();
    bankNameProfileController.clear();
    bankNameRegisterController.clear();
    cityController.clear();
    ipanNumberProfileController.clear();
    mobileProfileController.clear();
    taxNumberController.clear();
    emailLogInController.clear();
    emailProfileController.clear();
    emailRegisterController.clear();
    passwordRegisterController.clear();
    passwordLogInController.clear();

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

      final UserCredential res =
      await FirebaseAuth.instance.signInWithProvider(provider);
      
      
      final additionalInfo = res.additionalUserInfo?.profile;
      if (additionalInfo != null) {
        String? email = additionalInfo['email'];
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
        bool isApproved = await checkSupplierApproved(email: userRes.docs.first['email']);
        if(! isApproved){
          emit(LogingInErrorState(error: "Registered and pending admin approval."));
          return;
        }

        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userId,
            value: res.user!.uid);

        SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userDataIdKey,
            value: userRes.docs.first.id);

        emit(SuccessLogInWithAppleState());
        }
      }
      catch (e) {
      log(e.toString());
      emit(ErrorLogInWithAppleState(error: e.toString()));
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
        bool isApproved = await checkSupplierApproved(email: res.docs.first['email']);
        if(! isApproved){
          emit(LogingInErrorState(error: "Registered and pending admin approval."));
          return;
        }
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

  easyAddSupplier() async {
    try {
      emit(AddingSupplierDataState());
      // final user = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(
      //   email: emailRegisterController.text,
      //   password: passwordRegisterController.text,);
      String currentUUID = SharedPreferencesManager.getStringValue(
        key: StorageConstants.userId,);

      final fcmToken = SharedPreferencesManager.getStringValue(key: StorageConstants.fcmToken);

      final instance =
      FirebaseFirestore.instance.collection("Suppliers");
      final supplierData = SupplierUserModel(
        email: emailRegisterController.text,
        imagePath: RemoteDataBase.getImageUrl(path: 'imageName') ?? "",
        mobile: "+${thePhoneController.value.countryCode}${thePhoneController.value.nsn}",
        city: citySelection,
        companyName: companyNameRegisterController.text,
        taxNumber: taxNumberController.text,
        bankName: bankNameRegisterController.text,
        ipanNumber: ipanNumberController.text,
        uuid: currentUUID,
        approved: "FALSE"
      );

      final  supplierDataId =
          await FirebaseFirestore.instance
          .collection("Suppliers")
          .add(supplierData.toMap(fcmToken,""));
      print('Registered supplier with data id:');
      print(supplierDataId.id);
      AppConfigCubit.currentUserDataId = supplierDataId.id;
      await  SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataIdKey,
          value: supplierDataId.id
      );
      log("******* addUserToDataBaseWithOtherMethods Success *******");
      log(supplierDataId.path);
      SharedPreferencesManager.storeStringValue(
          key: StorageConstants.userDataIdKey, value: supplierDataId.id);
      emit(AddingSupplierDataSuccessState());
    } catch (e) {
      log("******** addUserToDataBaseWithOtherMethods Failure ********");
      log(e.toString());
      AddingSupplierDataErrorState(error: e.toString());
    }
  }
  
  Future<bool> checkEmailOrPhoneDuplication(String email, String phone)async {
    
    var res = await FirebaseFirestore.instance
          .collection('Suppliers')
          .where('email', isEqualTo: email).get();
    if(res.docs.isNotEmpty){
      return true;
    }
    res = await FirebaseFirestore.instance
          .collection('Suppliers')
          .where('mobile', isEqualTo: phone).get();
    if(res.docs.isNotEmpty){
      return true;
    }

    res = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email).get();
    if(res.docs.isNotEmpty){
      return true;
    }
    res = await FirebaseFirestore.instance
          .collection('Users')
          .where('mobile_number', isEqualTo: phone).get();
    if(res.docs.isNotEmpty){
      return true;
    }



    return false;
  }

  Future<bool> checkSupplierApproved({
    required String email
  }) async {
    var res = await FirebaseFirestore.instance
        .collection('Suppliers')
        .where('email', isEqualTo: email).get();
    if(res.docs.isNotEmpty){
      SupplierUserModel supplier = SupplierUserModel.fromJson(res.docs.first.data());
      if(supplier.approved == "FALSE"){
        return false;
      }else{
        return true;
      }
    }
    return true;
  }
}
