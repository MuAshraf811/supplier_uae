import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController confirmPasswordRegisterController =
      TextEditingController();
  TextEditingController companyNameRegisterController = TextEditingController();
  TextEditingController bankNameRegisterController = TextEditingController();
  TextEditingController ipanNumberController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailLogInController = TextEditingController();
  TextEditingController passwordLogInController = TextEditingController();

  String citySelection = "Dubai";
  final stepOneFormKey = GlobalKey<FormState>();
  final stepTwoFormKey = GlobalKey<FormState>(); 
    final logInFormKey = GlobalKey<FormState>();

  File? imageFile;

  logInSupplier() async { 

    try { 
      emit(LogingInState());
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailLogInController.text,
      password: passwordLogInController.text,
    ); 
    emit(LogingInSuccessState());
    } catch (e) { 
      emit(LogingInErrorState(error: e.toString()));
    }
   
  }

  registerUserData() async {
    try {
      emit(UploadingUserState());
      final imageName =
          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().second}.jpg";

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailRegisterController.text,
          password: passwordRegisterController.text);
      await RemoteDataBase.createSupaBaseBucket();
      await RemoteDataBase.insertImageIntoBacket(
          imageFile: imageFile!, imagePath: imageName);

      final supplierData = SupplierUserModel(
        email: emailRegisterController.text,
        imagePath: RemoteDataBase.getImageUrl(path: imageName) ?? "",
        mobile: mobileNumberController.text,
        city: citySelection,
        companyName: companyNameRegisterController.text,
        taxNumber: taxNumberController.text,
        bankName: bankNameRegisterController.text,
        ipanNumber: ipanNumberController.text,
      );
     final  supllierId= await FirebaseFirestore.instance
          .collection("Suppliers")
          .add(supplierData.toMap()); 
        await  SharedPreferencesManager.storeStringValue(
            key: StorageConstants.userDataId,
            value: supllierId.id
        );
      emit(UploadingUserStateSuccessState());
    } catch (e) {  
      log(e.toString());
      UploadingUserStateErrorState(error: e.toString());
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
}
