import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/snack_bar.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier/features/client/orders/presentation/cubit/orders_cubit.dart';
import 'package:supplier/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../Authentication/presentation/controllers/auth/authentication_cubit.dart';

showOrderConfirmation(
    {required BuildContext context,
    required String orderCategory,
    required String orderType,
    required String orderDate,
    required String details,
    required String extraDetails}) {
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
    builder: (context) => Scaffold(
      backgroundColor: Colors.black12,
      body: BlocProvider<OrdersCubit>(
        create: (context) => OrdersCubit(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
          // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: ColorConsatnts.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        color: ColorConsatnts.white,
                        border: Border.all(color: ColorConsatnts.primary),
                        borderRadius: BorderRadius.circular(28.r)),
                    child: Text(
                      S.of(context).order_summary,
                      style: applyBoldStyle(
                          fontSize: 16, fontColor: ColorConsatnts.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorConsatnts.red.withOpacity(0.15),
                      radius: 10.w,
                      child: const SvgHandler(
                        imagePath: AssetsConstants.wrongIcon,
                        height: 8,
                        width: 8,
                        color: ColorConsatnts.red,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                margin: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: ColorConsatnts.white,
                  border:
                      Border.all(color: ColorConsatnts.primary, width: 0.5.h),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithValueText(
                        title: S.of(context).category_name,
                        value: orderCategory),
                    const CustomDivider(),
                    TitleWithValueText(
                        title: S.of(context).order_name, value: orderType),
                    const CustomDivider(),
                    TitleWithValueText(
                      title: S.of(context).order_date,
                      value: orderDate,
                      valueColor: ColorConsatnts.grey,
                    ),
                    const CustomDivider(),
                    Text(
                      S.of(context).order_details,
                      style: applyBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.primary,
                      ),
                    ),
                    const VerticalSpacer(space: 8),
                    Text(
                      details,
                      style: applyMediumStyle(
                        fontSize: 15,
                        fontColor: ColorConsatnts.black,
                      ),
                    ),
                    const CustomDivider(),
                    Text(
                      S.of(context).extra_details,
                      style: applyBoldStyle(
                        fontSize: 16,
                        fontColor: ColorConsatnts.primary,
                      ),
                    ),
                    const VerticalSpacer(space: 8),
                    Text(
                      extraDetails,
                      style: applyMediumStyle(
                        fontSize: 15,
                        fontColor: ColorConsatnts.black,
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<OrdersCubit, OrdersState>(
                buildWhen: (previous, current) =>
                    current is AddingOrderSuccessState ||
                    current is AddingOrderErrorState ||
                    current is AddingOrderState,
                listenWhen: (previous, current) =>
                    current is AddingOrderSuccessState ||
                    current is AddingOrderErrorState,
                listener: (context, state) {
                  if (state is AddingOrderErrorState) {
                    showCustomSnackBar(
                        context, state.error, ColorConsatnts.red);
                  }
                  if (state is AddingOrderSuccessState) {
                    showCustomSnackBar(context, "Orders added successfully",
                        ColorConsatnts.primary);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is AddingOrderState) {
                    return Container(
                      width: double.infinity,
                      height: 46.h,
                      decoration: BoxDecoration(
                          color: ColorConsatnts.primary,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Transform.scale(
                          scale: 0.95,
                          child: const CircularProgressIndicator.adaptive(
                            backgroundColor: ColorConsatnts.white,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is AddingOrderErrorState) {
                    return AppButton(
                        text: S.of(context).confirm, onTap: () {});
                  }
                  return BlocBuilder<AuthenticationCubit,
                      AuthenticationState>(
                    buildWhen: (previous, current) =>
                        current is FetchingUserDataState ||
                        current is FetchingUserDataSuccessState,
                    builder: (context, state) {
                      if (state is FetchingUserDataState) {
                        return Container(
                          width: double.infinity,
                          height: 46.h,
                          decoration: BoxDecoration(
                              color: ColorConsatnts.primary,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Center(
                            child: Transform.scale(
                              scale: 0.95,
                              child: const CircularProgressIndicator.adaptive(
                                backgroundColor: ColorConsatnts.white,
                              ),
                            ),
                          ),
                        );
                      }
                      return AppButton(
                        text: S.of(context).confirm,
                        onTap: () {
                          context.read<OrdersCubit>().storeOrder(
                              date: orderDate,
                              orderType: orderType,
                              category: orderCategory,
                              details: details,
                              extra: extraDetails,
                              email: AuthenticationCubit
                                  .userPersonalData
                                  .email,
                              mobile: AuthenticationCubit
                                  .userPersonalData
                                  .mobileNumber,
                              address: AuthenticationCubit
                                  .userPersonalData
                                  .city,
                              name:
                                  "${AuthenticationCubit.userPersonalData.firstName} ${AuthenticationCubit.userPersonalData.lastName}");
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class TitleWithValueText extends StatelessWidget {
  const TitleWithValueText(
      {super.key, required this.title, required this.value, this.valueColor});
  final String title;
  final String value;
  final Color? valueColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 2,
          style:
              applySemiBoldStyle(fontSize: 16, fontColor: ColorConsatnts.black),
        ),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: applySemiBoldStyle(
              fontSize: 16, fontColor: valueColor ?? ColorConsatnts.black),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 24.w,
      indent: 24.w,
      thickness: 0.5.h,
      color: ColorConsatnts.grey,
      height: 28.h,
    );
  }
}
