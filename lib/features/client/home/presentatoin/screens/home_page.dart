
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../../core/cubit/nav_bar_cubit.dart';
import '../../../../../core/utils/constants/app_const.dart';
import '../../../../../core/utils/constants/assets_constants.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';
import '../../../../supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import '../../../Authentication/presentation/controllers/auth/authentication_cubit.dart';
import '../../../../supplier/notifications/presentation/notifications_screen.dart';
import '../../../orders/presentation/cubit/orders_cubit.dart';
import '../../../orders/presentation/screens/orders_view.dart';
import '../../../settings/presentation/controller/cubit/settings_cubit.dart';
import '../../../settings/presentation/views/profile_view.dart';
import '../cubit/main_home_cubit.dart';
import '../widgets/bottm_nav_bar.dart';
import '../widgets/category_section.dart';
import '../widgets/floating_button.dart';
import '../widgets/home_carousel.dart';
import '../widgets/section_grid_item.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  static final List<Widget> _views = [
    const MainView(),
    BlocProvider<OrdersCubit>(
      create: (context) => OrdersCubit()..fetchClientOrders(),
      child: const OrdersView(),
    ),
    const NotificationsScreen(),
    MultiBlocProvider(
      providers: [
        // BlocProvider<AuthenticationCubit>(
        //   create: (context) =>
        //   ServiceLocator.getIt<AuthenticationCubit>(),
        // ),
        BlocProvider(
          create: (context) => ServiceLocator.getIt.get<SettingsCubit>(),
        ),
      ],
      child: const ProfileView(),
    )
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white, 
            resizeToAvoidBottomInset: false,

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: const FloatingButton(),
      bottomNavigationBar: const AppBottomBar(),
      body: SafeArea(
        child: BlocBuilder<NavBarCubit, int>(
          builder: (context, state) {
            return _views[state];
          },
        ),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    if(AppConfigCubit.isSupplier) {
      ServiceLocator.getIt<SupplierAuthCubit>().getUserData();
    }else{
      ServiceLocator.getIt<AuthenticationCubit>().getUserData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const UpperAppBar(),
        const CustomCarousel(),
        const VerticalSpacer(space: 14),
        const CategorySection(),
        const VerticalSpacer(space: 8),
        Expanded(
          child: BlocBuilder<MainHomeCubit, int>(
            builder: (context, state) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.w / 1.32.h,
                ),
                itemCount: AppConst.categoryModel(context)[state].length,
                itemBuilder: (context, index) => SectionGridItem(
                  onTap: () {
                    if (state == 0) {
                      Navigator.pushNamed(
                        context,
                        RouteConstants.detailedItemCategoryView,
                        arguments: AppConst.categoryModel(context)[
                                context.read<MainHomeCubit>().state][index]
                            .index,
                      );
                    } else if (state == 2) {
                      if (index > 3) {
                        Navigator.pushNamed(
                          context,
                          RouteConstants.detailedItemPackagingView,
                          arguments: {
                            "packageOrderIndex":
                                AppConst.categoryModel(context)[state][index]
                                    .index,
                            "title": AppConst.categoryModel(context)[state]
                                    [index]
                                .title,
                          },
                        );
                      } else {
                        Navigator.pushNamed(
                            context, RouteConstants.detailedPackagingView,
                            arguments: {
                              "innerIndex": 0,
                              "packageItemIndex":
                                  AppConst.categoryModel(context)[state][index]
                                      .index,
                              "title": AppConst.categoryModel(context)[state]
                                      [index]
                                  .title,
                            });
                      }
                    } else {
                      Navigator.pushNamed(
                          context, RouteConstants.otherDetailedView,
                          arguments: {
                            "image": AppConst.categoryModel(context)[state]
                                    [index]
                                .image,
                            "cat name":
                                AppConst.homeCategoryStrings(context)[state],
                            "item name": AppConst.categoryModel(context)[state]
                                    [index]
                                .title,
                          });
                    }
                  },
                  imagePath:
                      AppConst.categoryModel(context)[state][index].image,
                  title: AppConst.categoryModel(context)[state][index].title,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UpperAppBar extends StatelessWidget {
  const UpperAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 260.w,
          height: 40.h,
          margin: EdgeInsets.only(bottom: 4.h, right: 18.w, left: 26.w, top: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: ColorConsatnts.white,
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/upper_adverse.jpeg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteConstants.chatView);
          },
          child: Container(
            width: 32.w,
            height: 32.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 6.h, right: 12.w, top: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: ColorConsatnts.white,
            ),
            child: const SvgHandler(
              imagePath: AssetsConstants.chatIcon,
              height: 32,
              width: 32,
              color: ColorConsatnts.primary,
            ),
          ),
        ),
      ],
    );
  }
}
