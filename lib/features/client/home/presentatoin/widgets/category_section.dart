import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/app_const.dart';
import '../cubit/main_home_cubit.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w),
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppConst.homeCategoryStrings(context).length,
          itemBuilder: (context, index) => CategoryItem(
            index: index,
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<MainHomeCubit>().changeCategoryIndex(index);
          },
          child: Container(
            height: 36.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            margin: EdgeInsets.only(right: 6.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: index == state
                  ? ColorConsatnts.primary
                  : ColorConsatnts.grey.withOpacity(0.15),
            ),
            child: Text(
              AppConst.homeCategoryStrings(context)[index],
              style: applySemiBoldStyle(
                fontColor: index == state
                    ? ColorConsatnts.white
                    : ColorConsatnts.black,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
