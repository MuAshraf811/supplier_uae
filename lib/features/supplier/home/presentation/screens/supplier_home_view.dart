import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/supplier/notifications/presentation/notifications_screen.dart';
import 'package:supplier/features/client/orders/presentation/cubit/orders_cubit.dart';
import 'package:supplier/features/client/orders/presentation/widget/order_shimmer.dart';
import 'package:supplier/features/client/settings/presentation/views/profile_view.dart';
import 'package:supplier/features/supplier/Authentication/presentation/cubit/supplier_auth_cubit.dart';
import 'package:supplier/features/supplier/home/presentation/cubit/offer/offers_cubit.dart';
import 'package:supplier/features/supplier/home/presentation/cubit/quotation/quotation_cubit.dart';
import 'package:supplier/features/supplier/home/presentation/screens/offers_view.dart';
import 'package:supplier/features/supplier/home/presentation/widgets/quotation_dialog.dart';
import 'package:supplier/features/supplier/home/presentation/widgets/supplier_bottom_bar.dart';
import 'package:supplier/features/supplier/home/presentation/widgets/supplier_home_app_bar.dart';
import 'package:supplier/features/supplier/home/presentation/widgets/supplier_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/cubit/app_config_cubit.dart';
import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';
import '../../../../client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import '../../../../client/settings/presentation/controller/cubit/settings_cubit.dart';
import '../cubit/supplier_nav_bar_cubit.dart';

class SupplierHomeView extends StatefulWidget {
  const SupplierHomeView({super.key});
  static final _view = [
    MultiBlocProvider(
      providers: [
        BlocProvider<OrdersCubit>(
          create: (context) => OrdersCubit()..fetchSupplierAvailableOrders(),
        ),
        BlocProvider<QuotationCubit>(
          create: (context) => QuotationCubit(),
        ),
      ],
      child: const SupplierOrdersView(),
    ),
    BlocProvider<OffersCubit>(
      create: (context) => OffersCubit()..fetchSupplierAvailableOffers(),
      child: const OffersView(),
    ),
    const NotificationsScreen(),
    MultiBlocProvider(
      providers: [
        // BlocProvider<AuthenticationCubit>(
        //   create: (context) =>
        //       // AuthenticationCubit()..getUserData(),
        //   AuthenticationCubit()..getUserData(),
        // ),
        BlocProvider(
          create: (context) => ServiceLocator.getIt.get<SettingsCubit>(),
        ),
      ],
      child: const ProfileView(),
    )
  ];

  @override
  State<SupplierHomeView> createState() => _SupplierHomeViewState();
}

class _SupplierHomeViewState extends State<SupplierHomeView> {


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
    // ServiceLocator.getIt<SupplierAuthCubit>().getUserData().then((value) {
    // // print(AuthenticationCubit.userPersonalData.toString());
    //
    // },);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: ColorConsatnts.primary,
        child: const SvgHandler(
          imagePath: "assets/svgs/chat-round-line-svgrepo-com.svg",
          height: 22,
          color: ColorConsatnts.white,
          width: 22,
        ),
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.chatSupplierView);
        },
      ),
      bottomNavigationBar: const SupplierBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<SupplierNavBarCubit, int>(
            builder: (context, state) {
              return SupplierHomeView._view[state];
            },
          ),
        ),
      ),
    );
  }
}

class SupplierOrdersView extends StatelessWidget {
  const SupplierOrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const VerticalSpacer(space: 16),
        // const SupplierHomePageAppBar(),
        const VerticalSpacer(space: 12),
        BlocBuilder<OrdersCubit, OrdersState>(
          buildWhen: (previous, current) =>
              current is FetchingOrderState ||
              current is FetchingOrderErrorState ||
              current is FetchingOrderSuccessState,
          builder: (context, state) {
            if (state is FetchingOrderSuccessState) {
              final res = context.read<OrdersCubit>().supplierOrders;
              return Expanded(
                child: ListView.builder(
                  itemCount: context.read<OrdersCubit>().supplierOrders.length,
                  itemBuilder: (context, index) => SupplierOrderItem(
                    index: index + 1,
                    orderName: res[index].orderName,
                    orderId: res[index].orderId,
                    category: res[index].category,
                    orderDetails: res[index].orderDetails,
                    orderDescription: res[index].orderDescription,
                    orderDate: res[index].orderDate,
                    clientId: res[index].userId,
                    onTap: () {
                      context.read<QuotationCubit>().orderNumber =
                          res[index].orderId;
                      showQuotationDialog(
                        context,
                        BlocProvider.of<QuotationCubit>(context),
                      );
                    },
                  ),
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => const ShimmerOrderItem(),
              ),
            );
          },
        ),
      ],
    );
  }
}
