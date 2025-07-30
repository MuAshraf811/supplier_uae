import 'package:supplier_app/core/utils/constants/app_const.dart';
import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/storage_const.dart';
import 'package:supplier_app/core/utils/storage/shared_preferences.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_button.dart';
import 'package:supplier_app/core/utils/widgets/app_text_field.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/client/orders/presentation/cubit/orders_cubit.dart';
import 'package:supplier_app/features/supplier/home/presentation/cubit/quotation/quotation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

showQuotationDialog(BuildContext context, QuotationCubit cubit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    barrierColor: Colors.black12,
    backgroundColor: Colors.black12,
    isDismissible: false,
    useRootNavigator: true,
    constraints: BoxConstraints(
      maxHeight: 700.h,
    ),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: BlocProvider<OrdersCubit>(
          create: (context) => OrdersCubit(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: ColorConsatnts.white,
              borderRadius: BorderRadius.circular(
                4.r,
              ),
            ),
            child: Form(
              key: context.read<QuotationCubit>().quotationFormKey,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quotation ",
                        style: applySemiBoldStyle(
                            fontSize: 14, fontColor: ColorConsatnts.red),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                ColorConsatnts.red.withOpacity(0.2),
                            radius: 11.w,
                            child: const SvgHandler(
                              imagePath: AssetsConstants.wrongIcon,
                              height: 8,
                              width: 8,
                              color: ColorConsatnts.red,
                            ),
                          ))
                    ],
                  ),
                  const VerticalSpacer(space: 18),
                  Text(
                    "Please Fill This Fields",
                    style: applyMediumStyle(
                        fontSize: 14, fontColor: ColorConsatnts.black),
                  ),
                  const VerticalSpacer(space: 12),
                  AppTextField(
                    label: " Order Description",
                    suffixIcon: Icons.article,
                    minLines: 3,
                    controller: context
                        .read<QuotationCubit>()
                        .quotationDescriptionController,
                    maxLines: 8,
                    suffixColor: ColorConsatnts.grey,
                    suffixSize: 16,
                  ),
                  const VerticalSpacer(space: 10),
                  FittedBox(
                    child: TextWithTextField(
                      text: "Quantity",
                      label: "Quantity",
                      conroller: context
                          .read<QuotationCubit>()
                          .quotationQuantityController,
                      svg: AssetsConstants.count,
                      icon: Icons.attach_money_outlined,
                    ),
                  ),
                  const VerticalSpacer(space: 10),
                  TextWithTextField(
                    text: "Rate",
                    label: "Rate",
                    conroller:
                        context.read<QuotationCubit>().quotationRateController,
                    svg: AssetsConstants.money,
                    icon: Icons.production_quantity_limits,
                  ),
                  const VerticalSpacer(space: 10),
                  TextWithTextField(
                    text: "Amount",
                    label: "Amount",
                    conroller: context
                        .read<QuotationCubit>()
                        .quotationAmountController,
                    svg: AssetsConstants.money,
                    icon: Icons.monetization_on,
                  ),
                  const VerticalSpacer(space: 10),
                  TextWithTextField(
                    text: "vat 5%",
                    label: "vat 5%",
                    conroller:
                        context.read<QuotationCubit>().quotationVatController,
                    svg: AssetsConstants.amount,
                    icon: Icons.percent_outlined,
                  ),
                  const VerticalSpacer(space: 10),
                  TextWithTextField(
                    text: "Total",
                    label: "Total ",
                    conroller:
                        context.read<QuotationCubit>().quotationTotalController,
                    svg: AssetsConstants.sum,
                    icon: Icons.money,
                  ),
                  const VerticalSpacer(space: 10), 
                   TextWithTextField(
                    text: "Deliver Date ",
                    label: "Deliver date from this offer date ",
                    conroller:
                        context.read<QuotationCubit>().deliverDateController,
                    svg: AssetsConstants.editIcon,
                    icon: Icons.date_range,
                  ),
                  // const VerticalSpacer(space: 10),
                  // const QuotationTermsAndCondition(),
                  const VerticalSpacer(space: 8),
                  BlocConsumer<QuotationCubit, QuotationState>(
                    buildWhen: (previous, current) =>
                        current is AddingQuotationErrorState ||
                        current is AddingQuotationState ||
                        current is AddingQuotationSuccessState,
                    listenWhen: (previous, current) =>
                        current is AddingQuotationErrorState ||
                        current is AddingQuotationState ||
                        current is AddingQuotationSuccessState,
                    listener: (context, state) {
                      if (state is AddingQuotationErrorState) {
                        showCustomSnackBar(
                            context, state.error, ColorConsatnts.red);
                      }
                      if (state is AddingQuotationSuccessState) {
                        Navigator.pop(context);
                        showCustomSnackBar(context,
                            "Quotation Sent Successfully", Colors.green);
                        context.read<QuotationCubit>().clearControllers();
                      }
                    },
                    builder: (context, state) {
                      if (state is AddingQuotationState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: ColorConsatnts.primary,
                          ),
                        );
                      }
                      return AppButton(
                        text: "Add Quote",
                        onTap: () {
                          if (context
                              .read<QuotationCubit>()
                              .quotationFormKey
                              .currentState!
                              .validate()) {
                            context.read<QuotationCubit>().addquotationOffer(
                                  supplierId: SharedPreferencesManager.getStringValue(key: StorageConstants.userDataIdKey),
                                  supplierName: "Muhammed Ashraf",
                                );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class TextWithTextField extends StatelessWidget {
  const TextWithTextField({
    super.key,
    required this.text,
    required this.label,
    required this.icon,
    this.conroller,
    this.svg,
  });
  final String text;
  final String label;
  final IconData icon;
  final String? svg;
  final TextEditingController? conroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              applySemiBoldStyle(fontSize: 15, fontColor: ColorConsatnts.black),
        ),
        SizedBox(
          width: 220.w,
          child: AppTextField(
            label: label,
            suffixIcon: icon,
            controller: conroller,
            suffixSize: 22,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "This Field should not be empty";
              }
              return null;
            },
            suffixSvg: Transform.scale(
                scale: 0.6,
                child: SvgHandler(imagePath: svg ?? "", height: 12, width: 12)),
            suffixColor: ColorConsatnts.grey,
          ),
        ),
      ],
    );
  }
}

class QuotationTermsAndCondition extends StatelessWidget {
  const QuotationTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).terms_and_conditions,
            style: applyBoldStyle(fontSize: 18, fontColor: ColorConsatnts.red)),
        const VerticalSpacer(space: 4),
        Text(S.of(context).validity,
            style:
                applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black)),
        Text(
            S.of(context).note_payment,
            style:
                applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black)),
        Text(
            S.of(context).order_variation,
            style: applyMediumStyle(
                fontSize: 15, fontColor: ColorConsatnts.black)),
        const VerticalSpacer(space: 4),
        Text(S.of(context).quotes_terms,
            style: applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.red)),
        const VerticalSpacer(space: 4),
        for (var i = 1; i <= 7; i++)
          Text('$i- ${AppConst.getQuotationConditionText(context,i)}',
              style: applySemiBoldStyle(
                  fontSize: 15, fontColor: ColorConsatnts.black)),
      ],
    );
  }
}
