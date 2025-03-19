import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/storage/shared_preferences.dart';
import 'package:supplier/features/supplier/Authentication/model/supplier_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/notification_service.dart';
import '../../../../../../core/utils/service_locator.dart';
part 'quotation_state.dart';

class QuotationCubit extends Cubit<QuotationState> {
  QuotationCubit() : super(QuotationInitial()){ 
     quotationQuantityController.addListener(_updateCalculations);
    quotationRateController.addListener(_updateCalculations);
  }
final quotationFormKey = GlobalKey<FormState>();
String orderNumber = "";
  TextEditingController quotationDescriptionController =
      TextEditingController();
  TextEditingController quotationQuantityController = TextEditingController();
  TextEditingController quotationRateController = TextEditingController();
  TextEditingController quotationAmountController = TextEditingController();
  TextEditingController quotationVatController = TextEditingController();
  TextEditingController quotationTotalController = TextEditingController(); 
    TextEditingController deliverDateController = TextEditingController();

   void clearControllers(){ 
    quotationAmountController.clear(); 
    quotationDescriptionController.clear(); 
    quotationQuantityController.clear(); 
    quotationRateController.clear(); 
    quotationTotalController.clear(); 
    quotationVatController.clear();
   } 
fetchOffers()async{ 
    try { 
      emit(AddingQuotationState());
       final instance= FirebaseFirestore.instance.collection("quotations"); 
    await instance.get();
   
   emit(AddingQuotationSuccessState());
   AddingQuotationSuccessState();
    } catch (e) { 
      log("**************"); 
      log(e.toString());
      emit(AddingQuotationErrorState(error: e.toString()));
    }
}

    void _updateCalculations() {
    final quantity = int.tryParse(quotationQuantityController.text) ?? 0;
    final rate = double.tryParse(quotationRateController.text) ?? 0.0;

    // Calculate values
    final amount = quantity * rate;
    final vat = amount * 0.05;
    final total = amount + vat;

    // Update the text controllers
    quotationAmountController.text = amount.toStringAsFixed(2);
    quotationVatController.text = vat.toStringAsFixed(2);
    quotationTotalController.text = total.toStringAsFixed(2);
  }
  void addquotationOffer({ required String supplierId, required String supplierName}) async{  
    try { 
      emit(AddingQuotationState());
       final instance= FirebaseFirestore.instance.collection("quotations");  
              final DocumentSnapshot user= await FirebaseFirestore.instance
                  .collection("Suppliers")
                  .doc(SharedPreferencesManager
                  .getStringValue(key: StorageConstants.userDataIdKey)).get();

           final userData =    SupplierUserModel.fromJson(user.data() as Map<String , dynamic>);
          log(userData.toString());
          final response = await instance.add(
          {
            "quotationDescription" : quotationDescriptionController.text,
            "quantity" : quotationQuantityController.text,
            "rate" : quotationRateController.text,
            "amount":quotationAmountController.text,
            "vat" : quotationVatController.text,
            "total": quotationTotalController.text,
            "orderNumber" : orderNumber,
            "quotationDate": AppConst.getDate(),
            "supplierId": supplierId,
            "supplierName":userData.companyName ,
            "email": userData.email,
            "mobile": userData.mobile,
            "city": userData.mobile,
            "deliverDate": deliverDateController.text
          }
         );
      ServiceLocator.getIt<NotificationService>().createNotification(
        title: "New Offer Created !!",
        body: "Offer Id: ${response.id}",
        recipientId: 'admin',
      );
     emit(AddingQuotationSuccessState());
     AddingQuotationSuccessState();
    } catch (e) { 
      log("**************"); 
      log(e.toString());
      emit(AddingQuotationErrorState(error: e.toString()));
    }
  
  } 
   @override
  Future<void> close() {
    quotationQuantityController.removeListener(_updateCalculations);
    quotationRateController.removeListener(_updateCalculations);
    
    return super.close();
  }
}
