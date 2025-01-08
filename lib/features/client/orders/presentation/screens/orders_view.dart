import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/orders/model/client_order_model.dart';
import 'package:supplier/features/client/orders/presentation/cubit/orders_cubit.dart';
import 'package:supplier/features/client/orders/presentation/widget/order_item.dart';
import 'package:supplier/features/client/orders/presentation/widget/order_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

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
              "Your Order Summary ",
              style:
                  applyBoldStyle(fontSize: 17, fontColor: ColorConsatnts.black),
            ),
          ),
          const VerticalSpacer(space: 20),
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (previous, current) =>
                current is FetchingOrderErrorState ||
                current is FetchingOrderState ||
                current is FetchingOrderSuccessState,
            builder: (context, state) {
              if (state is FetchingOrderSuccessState) {
                if (context.read<OrdersCubit>().clientOrders.isEmpty) {
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
                          "There is no orders ",
                          style: applyMediumStyle(
                              fontSize: 18, fontColor: ColorConsatnts.black),
                        )
                      ],
                    ),
                  );
                }
                final List<ClientOrderModel> res =
                    context.read<OrdersCubit>().clientOrders;
                return Expanded(
                  child: ListView.builder(
                    itemCount: context.read<OrdersCubit>().clientOrders.length,
                    itemBuilder: (context, index) => OrderItem(  
                      onDelete: () {
                        context.read<OrdersCubit>().deleteOrder(orderId: res[index].orderId);
                      },
                      index: index + 1,
                      orderName: res[index].orderName,
                      orderDetails: res[index].orderDetails,
                      orderDescription: res[index].orderDescription,
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

