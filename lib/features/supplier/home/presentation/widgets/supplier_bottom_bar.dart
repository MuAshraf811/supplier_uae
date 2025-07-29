import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/supplier/home/presentation/cubit/supplier_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplierBottomBar extends StatelessWidget {
  const SupplierBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: ColorConsatnts.primary, width: 2.5.w)),
      child: BlocBuilder<SupplierNavBarCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: context.read<SupplierNavBarCubit>().state,
            onTap: (value) {
              context.read<SupplierNavBarCubit>().changeNavBarPages(value);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConsatnts.primary,
            unselectedItemColor: ColorConsatnts.white,
            selectedItemColor: ColorConsatnts.white,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 32.w,
                      margin: EdgeInsets.only(bottom: 4.h),
                      height: 4.h,
                      color: state == 0
                          ? ColorConsatnts.white
                          : ColorConsatnts.primary,
                    ),
                    const SvgHandler(
                      imagePath: "assets/svgs/order-nav.svg",
                      height: 20,
                      width: 20,
                      color: ColorConsatnts.white,
                    ),
                  ],
                ),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 32.w,
                      height: 4.h,
                      margin: EdgeInsets.only(bottom: 4.h),
                      color: state == 1
                          ? ColorConsatnts.white
                          : ColorConsatnts.primary,
                    ),
                    const SvgHandler(
                      imagePath:
                          "assets/svgs/offer-hot-product-fire-svgrepo-com.svg",
                      height: 20,
                      width: 20,
                      color: ColorConsatnts.white,
                    ),
                  ],
                ),
                label: "Offers",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 32.w,
                      margin: EdgeInsets.only(bottom: 4.h),
                      height: 4.h,
                      color: state == 2
                          ? ColorConsatnts.white
                          : ColorConsatnts.primary,
                    ),
                    const SvgHandler(
                      imagePath: AssetsConstants.mailIcon,
                      height: 20,
                      width: 20,
                      color: ColorConsatnts.white,
                    ),
                  ],
                ),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 32.w,
                      margin: EdgeInsets.only(bottom: 4.h),
                      height: 4.h,
                      color: state == 3
                          ? ColorConsatnts.white
                          : ColorConsatnts.primary,
                    ),
                    const SvgHandler(
                      imagePath: AssetsConstants.profileIcon,
                      height: 22,
                      width: 22,
                      color: ColorConsatnts.white,
                    ),
                  ],
                ),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
