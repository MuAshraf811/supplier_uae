import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/spacers.dart';
import '../../../../../core/utils/widgets/svg_handler.dart';
import '../cubit/chat_cubit.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.w, top: 10.h, right: 16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorConsatnts.grey.shade400,
            width: 0.85.h,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                context: context,
                useSafeArea: true,
                builder: (_) => Container(
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.h, bottom: 36.h),
                  padding: EdgeInsets.only(right: 10.w, top: 14.h, left: 10.w),
                  decoration: BoxDecoration(
                      color: ColorConsatnts.white,
                      borderRadius: BorderRadius.circular(14.r)),
                  height: 160.h,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<SupplierChatCubit>(context)
                              .pickImage(isFromCamera: true);

                          BlocProvider.of<SupplierChatCubit>(context)
                                  .messageController
                                  .text =
                              context.read<SupplierChatCubit>().imagepath ??
                                  "No Path Found";
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt_outlined,
                              color: ColorConsatnts.primary,
                            ),
                            const HorizontalSpacer(space: 18),
                            Text(
                              "Camera",
                              style: applyBoldStyle(
                                  fontSize: 16,
                                  fontColor: ColorConsatnts.black),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 26.h,
                        endIndent: 32.w,
                        indent: 32.w,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<SupplierChatCubit>(context)
                              .pickImage(isFromCamera: false);
                          BlocProvider.of<SupplierChatCubit>(context)
                                  .messageController
                                  .text =
                              context.read<SupplierChatCubit>().imagepath ??
                                  "No Path Found";
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wallpaper_outlined,
                              color: ColorConsatnts.primary,
                            ),
                            const HorizontalSpacer(space: 18),
                            Text(
                              "Gallery",
                              style: applyBoldStyle(
                                  fontSize: 16,
                                  fontColor: ColorConsatnts.black),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 26.h,
                        endIndent: 32.w,
                        indent: 32.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SvgHandler(
                              imagePath: AssetsConstants.wrongIcon,
                              height: 16,
                              width: 16,
                              color: Colors.red,
                            ),
                            const HorizontalSpacer(space: 18),
                            Text(
                              "Cancel",
                              style: applyBoldStyle(
                                  fontSize: 16,
                                  fontColor: ColorConsatnts.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.camera_alt_outlined,
              color: ColorConsatnts.grey,
            ),
          ),
          const HorizontalSpacer(space: 20),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: SizedBox(
              width: 215.w,
              child: Form(
                key: context.read<SupplierChatCubit>().chatTextFieldKey,
                child: AppTextField(
                  label: "write message .....",
                  controller: context.read<SupplierChatCubit>().messageController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Write your Message please";
                    }
                    return null;
                  },
                  suffixIcon: Icons.border_color_outlined,
                  maxHeight: 44,
                  suffixSize: 16,
                  maxLines: 4, 
                  minLines: 1,
                  suffixColor: ColorConsatnts.grey.shade400,
                ),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (context
                  .read<SupplierChatCubit>()
                  .chatTextFieldKey
                  .currentState!
                  .validate()) {
                context.read<SupplierChatCubit>().sendAMessage();
                context.read<SupplierChatCubit>().messageController.clear();
                FocusScope.of(context).unfocus();
              }
            },
            child: const SvgHandler(
              imagePath: "assets/svgs/send.svg",
              height: 26,
              width: 26,
              color: ColorConsatnts.primary
            ),
          ),
        ],
      ),
    );
  }
}
