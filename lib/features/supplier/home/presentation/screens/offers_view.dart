import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/orders/presentation/widget/order_shimmer.dart';
import 'package:supplier/features/supplier/home/model/quotation_model.dart';
import 'package:supplier/features/supplier/home/presentation/cubit/offer/offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../client/orders/presentation/widget/divider_with_text.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacer(space: 16),
          Align( 
            alignment: Alignment.topCenter,
            child: Text(
              "Your Offers Summary ",
              style:
                  applyBoldStyle(fontSize: 17, fontColor: ColorConsatnts.black),
            ),
          ),
          const VerticalSpacer(space: 20),
          BlocBuilder<OffersCubit, OffersState>(
            buildWhen: (previous, current) =>
                current is FetchingOfferErrorState ||
                current is FetchingOfferState ||
                current is FetchingOfferSuccessState,
            builder: (context, state) {
              if (state is FetchingOfferSuccessState) {
                if (context.read<OffersCubit>().supplierOffers.isEmpty) {
                  return IntrinsicHeight(
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgHandler(
                            imagePath: AssetsConstants.noData,
                            height: 300,
                            width: 54),
                        const VerticalSpacer(space: 28),
                        Text(
                          "There is no Offers , Yet ",
                          style: applyMediumStyle(
                              fontSize: 18, fontColor: ColorConsatnts.black),
                        )
                      ],
                    ),
                  );
                }
                final List<QuotationModel> res =
                    context.read<OffersCubit>().supplierOffers;
                return Expanded(
                  child: ListView.builder(
                    itemCount: context.read<OffersCubit>().supplierOffers.length,
                    itemBuilder: (context, index) => OfferItem(  
                      onDelete: () async {

                        context.read<OffersCubit>().deleteMyOffer(context, index);

                      },
                      index: index + 1,
                      offerDetails: res[index].quotationDescription,
                      offerDescription: "${res[index].amount} || ${res[index].rate} || ${res[index].total}",
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) => const ShimmerOrderItem()),
              );
            },
          ),
          const VerticalSpacer(space: 12),
        ],
      ),
    );
  }

}

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.index,
    required this.offerDetails,
    required this.offerDescription, 
    required this.onDelete,
  });
  final int index;
  final String offerDetails;
  final String offerDescription; 
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 16.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConsatnts.grey),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 24.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: ColorConsatnts.primary,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(12.r))),
            child: Text(
              index.toString(),
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.white,
              ),
            ),
          ),
         
          const VerticalSpacer(space: 8),
          const DividerWithText(text: "Offer Details"),
          const VerticalSpacer(space: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              offerDetails,
              textAlign: TextAlign.center,
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
          ),
          const VerticalSpacer(space: 8),
          const DividerWithText(text: "Offer Description"),
          const VerticalSpacer(space: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              offerDescription,
              textAlign: TextAlign.center,
              style: applyMediumStyle(
                fontSize: 14,
                fontColor: ColorConsatnts.black,
              ),
            ),
          ),
          Align( 
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 24.w, top: 16.h),
              child:    InkWell( 
                    onTap: onDelete,
                    child: const SvgHandler(
                      imagePath: AssetsConstants.deleteIcon,
                      height: 24,
                      width: 24,
                      color: Colors.red,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

