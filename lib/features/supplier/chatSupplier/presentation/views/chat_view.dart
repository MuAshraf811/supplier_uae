import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/storage_const.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/client/chat/model/message_prod_model.dart';
import 'package:supplier/features/client/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier/features/supplier/chatSupplier/presentation/cubit/chat_cubit.dart';
import '../../../../../core/utils/storage/shared_preferences.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_bottom_bar.dart';
import '../widgets/message_item.dart';

class SupplierChatView extends StatelessWidget {
  const SupplierChatView({super.key});
  @override
  Widget build(BuildContext context) { 
    context.read<SupplierChatCubit>().fetchMessages();
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              const VerticalSpacer(space: 18),
              const CustomAppbar(
                title: "SUPPLIER ADMIN",
              ),
              // Expanded(
              //   child: BlocConsumer<ChatCubit, ChatState>(
              //     listenWhen: (previous, current) => current is FetchingMessagesErrorState,
              //     buildWhen: (previous, current) => current is FetchingMessagesErrorState|| current is FetchingMessagesState|| current is FetchingMessagesSuccessState,
              //     listener: (context, state) {
              //       if(state is FetchingMessagesErrorState){
              //       showCustomSnackBar(context, state.error, ColorConsatnts.red);

              //       }
              //     },
              //     builder: (context, state) {
              //       if (state is FetchingMessagesSuccessState){
              //          return ListView.builder(
              //           reverse: false,
              //         padding: EdgeInsets.only(top: 12.h),
              //         itemCount: context.read<ChatCubit>().allChatMessages!.length,
              //         controller:
              //             context.read<ChatCubit>().chatScrollController,
              //         itemBuilder: (context, index) => MessageItem(
              //           isSender: context
              //               .read<ChatCubit>()
              //               .allChatMessages![index]
              //               .userId==SharedPreferencesManager.getStringValue(key: StorageConstants.userDataId),
              //           message: context
              //               .read<ChatCubit>()
              //               .allChatMessages![index]
              //               .message,
              //           time: context.read<ChatCubit>().allChatMessages![index].time,
              //         ),
              //       );

              //       }
              //      return Center(
              //           child: Transform.scale( scale: 0.8 , child: const CircularProgressIndicator.adaptive()),
              //         );
              //     },
              //   ),
              // ),
              Expanded(
                child: StreamBuilder<List<MessageprodModel>>(
                  stream: context.read<SupplierChatCubit>().getMessagesStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No messages yet.'),
                      );
                    }

                    final messages = snapshot.data!;
                    return ListView.builder(
                      reverse:
                          true, // Optional: Display newest messages at the bottom.
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return MessageItem(
                          isSender: message.userId ==
                              SharedPreferencesManager.getStringValue(
                                  key: StorageConstants.userDataIdKey),
                          message: message.message,
                          time: message.time,
                        );
                      },
                    );
                  },
                ),
              ),

              BlocProvider<SupplierChatCubit>.value(
                value: BlocProvider.of<SupplierChatCubit>(context),
                child: const ChatBottomBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
