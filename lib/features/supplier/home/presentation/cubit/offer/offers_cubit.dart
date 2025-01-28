
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplier/features/supplier/home/model/quotation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/storage_const.dart';
import '../../../../../../core/utils/storage/shared_preferences.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial()); 
 late List<QuotationModel> supplierOffers ; 


  void fetchSupplierAvailableOffers() async {
    try { 
       final String userId = SharedPreferencesManager.getStringValue(
        key: StorageConstants.userDataIdKey,
      );
      emit(FetchingOfferState());

      // Query Firestore to fetch only documents matching the userId
      final QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection("accepted_offers").where("supplierId", isEqualTo: userId).get();

      // Map the documents to  model
      supplierOffers = response.docs
          .map((e) => QuotationModel.fromJson({
                'id': e.id, // Add the document ID
                ...e.data(), // Spread the document data
              }))
          .toList();

      emit(FetchingOfferSuccessState());
    } catch (error) {
      log("Error fetching orders: $error");
      emit(FetchingOfferErrorState(error: error.toString()));
    }
  }

  Future<void> deleteMyOffer(BuildContext context, int index) async {

    emit(OffersInitial());
    final currentOffer = await FirebaseFirestore.instance
        .collection('accepted_offers')
        .where(
        'orderNumber',
        isEqualTo: context.read<OffersCubit>().supplierOffers[index].orderNumber
    ).get();

    FirebaseFirestore.instance.collection('accepted_offers')
        .doc(currentOffer.docs.first.id).delete();

    fetchSupplierAvailableOffers();

    // emit(FetchingOfferSuccessState());
  }



}
