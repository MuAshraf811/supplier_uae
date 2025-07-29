import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/category_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_text_field.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/client/home/presentatoin/cubit/cubit/home_page_cubit.dart';
import 'package:supplier_app/features/client/home/presentatoin/widgets/custom_drop_down.dart';
import 'package:supplier_app/features/client/home/presentatoin/widgets/custom_radio_button.dart';
import 'package:supplier_app/features/client/home/presentatoin/widgets/detailed_screen_order_button.dart';
import 'package:supplier_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedCategoryItemView extends StatelessWidget {
  const DetailedCategoryItemView({super.key, required this.categoryItemIndex});
  final int categoryItemIndex;
  @override
  Widget build(BuildContext context) {
    context.read<HomePageCubit>().initGroupVal(categoryItemIndex, context);
    return Scaffold( 
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            top: 16.h,
          ),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SvgHandler(
                    imagePath: AssetsConstants.arrowLeftIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              const VerticalSpacer(space: 18),
              Text(
                    CategoryConstants.getPrintingCategories(context)[categoryItemIndex].title,
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.primary,
                ),
              ),
              const VerticalSpacer(space: 12),
              ItemRadioButtons(categoryItemIndex: categoryItemIndex),
              const VerticalSpacer(space: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  buildWhen: (previous, current) =>
                      current is RadioCurrentChoice,
                  builder: (context, state) {
                    return Text(
                    CategoryConstants.getPrintingCategories(context)[categoryItemIndex]
                        .details[context.read<HomePageCubit>().indexFromChoice]
                    ["title"],
                    style: applySemiBoldStyle(
                      fontSize: 16,
                      fontColor: ColorConsatnts.primary,
                    ),
                  );
                  },
                ),
              ),
              const VerticalSpacer(space: 12),
              ItemRequiredDropDowns(categoryItemIndex: categoryItemIndex),
              const VerticalSpacer(space: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).extra_details,
                  style: applySemiBoldStyle(
                    fontSize: 16,
                    fontColor: ColorConsatnts.primary,
                  ),
                ),
              ),
              const VerticalSpacer(space: 12),
              AdditionalDropDowns(categoryItemIndex: categoryItemIndex),
              const VerticalSpacer(space: 12),
              ItemTextField(categoryItemIndex: categoryItemIndex),
              const VerticalSpacer(space: 12),
              const DetailedScreenOrderButton(),
              const VerticalSpacer(space: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemRadioButtons extends StatelessWidget {
  const ItemRadioButtons({
    super.key,
    required this.categoryItemIndex,
  });

  final int categoryItemIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) => current is RadioCurrentChoice,
      builder: (context, state) => IntrinsicHeight(
        child: Column(
          children: CategoryConstants.getPrintingCategories(context)[categoryItemIndex].radioOptions
              .map((val) => CustomRadioButton(
                  text: val,
                  value: val,
                  groupValue:
                      context.read<HomePageCubit>().radioButtonGroupValue,
                  onChanged: (value) {
                    context.read<HomePageCubit>().rebuildRadioOnChooseing(
                        value!,
                        CategoryConstants
                            .getPrintingCategories(context)[categoryItemIndex].radioOptions
                            .indexOf(value));
                  }))
              .toList(),
        ),
      ),
    );
  }
}

class ItemRequiredDropDowns extends StatelessWidget {
  const ItemRequiredDropDowns({
    super.key,
    required this.categoryItemIndex,
  });

  final int categoryItemIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) => current is RadioCurrentChoice,
      builder: (context, state) {
        final radioDropDowns = CategoryConstants.getPrintingCategories(context)[categoryItemIndex]
                .details[context.read<HomePageCubit>().indexFromChoice]
            ["details"] as Map<String, dynamic>;
        for (var e in radioDropDowns.entries) {
          final defaultValue = (e.value as List<dynamic>).first;
          context.read<HomePageCubit>().orderDetails[e.key] ??=
              "$defaultValue\n";
        }
        return SizedBox(
          height: 220.h,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.w,
              mainAxisSpacing: 10.w,
              childAspectRatio: 2 / 0.7,
            ),
            children: radioDropDowns.entries
                .map((e) => CustomDropDown(
                      text: e.key,
                      entries: e.value,
                      onSelected: (val) {
                        context.read<HomePageCubit>().orderDetails[e.key] =
                            "$val\n";
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
    required this.categoryItemIndex,
  });

  final int categoryItemIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        final bool isRequird = CategoryConstants.getPrintingCategories(context)[categoryItemIndex]
                .details[context.read<HomePageCubit>().indexFromChoice]
            ["isRequired"];
        return Form(
          key: context.read<HomePageCubit>().formKey,
          child: AppTextField(
            controller:
                context.read<HomePageCubit>().orderExtraDetailsController,
            label: isRequird
                ? S.of(context).this_field_is_required
                : S.of(context).this_field_is_optional,
            suffixIcon: Icons.edit,
            maxLines: 6,
            minLines: 4,
            validator: (value) {
              if (isRequird && value == null && value!.isEmpty) {
                showCustomSnackBar(context, "This Field Shouldn't be empty",
                    ColorConsatnts.red);
                return "This Field Shouldn't be null";
              }
              return null;
            },
          ),
        );
      },
    );
  }
}

class AdditionalDropDowns extends StatelessWidget {
  const AdditionalDropDowns({
    super.key,
    required this.categoryItemIndex,
  });

  final int categoryItemIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) => current is RadioCurrentChoice,
      builder: (context, state) {
        final radioDropDowns = CategoryConstants.getPrintingCategories(context)[categoryItemIndex]
                .details[context.read<HomePageCubit>().indexFromChoice]["other"]
            as Map<String, dynamic>;
        for (var e in radioDropDowns.entries) {
          final defaultValue = (e.value as List<dynamic>).first;
          context.read<HomePageCubit>().orderDetails[e.key] ??=
              "$defaultValue\n";
        }
        return SizedBox(
          height: 50.h,
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.w,
              mainAxisSpacing: 10.w,
              childAspectRatio: 2 / 0.7,
            ),
            children: radioDropDowns.entries
                .map(
                  (e) => CustomDropDown(
                    text: e.key,
                    entries: e.value,
                    onSelected: (val) {
                      context.read<HomePageCubit>().orderDetails[e.key] =
                          "$val\n";
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
