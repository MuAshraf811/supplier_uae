import 'package:supplier/core/utils/constants/app_const.dart';
import 'package:supplier/core/utils/constants/assets_constants.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/app_button.dart';
import 'package:supplier/core/utils/widgets/app_text_field.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/core/utils/widgets/svg_handler.dart';
import 'package:supplier/features/client/chat/presentation/widgets/chat_app_bar.dart';
import 'package:supplier/features/client/home/presentatoin/widgets/show_order_dialog_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class OtherDetailedScreen extends StatefulWidget {
  const OtherDetailedScreen({super.key, required this.data});
  final Map data;

  @override
  State<OtherDetailedScreen> createState() => _OtherDetailedScreenState();
}

class _OtherDetailedScreenState extends State<OtherDetailedScreen> { 
  TextEditingController detailsController = TextEditingController(); 
    TextEditingController extradetailsController = TextEditingController(); 
    final key = GlobalKey<FormState>(); 
    

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: ColorConsatnts.white, 
            resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Form( 
            key: key,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(space: 16),
                  CustomAppbar(title: S.of(context).order_view),
                  const VerticalSpacer(space: 18),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          widget.data["image"],
                          width: 120.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const HorizontalSpacer(space: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             widget.data["cat name"],
                             style:const  TextStyle( color: Colors.black, fontSize: 17),

                          ),
                          const VerticalSpacer(space: 8),
                            Text(
                             widget.data["item name"],
                             style:const  TextStyle( color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),

                          ),
                        ],
                      )
                    ],
                  ),
                  const VerticalSpacer(space: 36),
                  Text(
                    S.of(context).write_order_details,
                    style: applyMediumStyle(
                      fontSize: 16,
                      fontColor: ColorConsatnts.red,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                  Text(
                    S.of(context).note_order_details,
                    style: applyMediumStyle(
                      fontSize: 14,
                      fontColor: ColorConsatnts.primary,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                  AppTextField(
                    label: S.of(context).order_details,
                    controller: detailsController,
                    suffixIcon: Icons.edit,
                    minLines: 5,
                    maxLines: 10,
                    validator: (val) {
                      if(val==null || val.isEmpty){
                        return "This Field should not be empty";
                      }return null ;
                    },
                    suffixSvg: Transform.scale(
                      scale: 0.6,
                      child: const SvgHandler(
                          imagePath: AssetsConstants.description,
                          height: 12,
                          width: 12),
                    ),
                  ),
                  const VerticalSpacer(space: 18),
                  Text(
                    S.of(context).extra_details,
                    style: applyMediumStyle(
                      fontSize: 16,
                      fontColor: ColorConsatnts.red,
                    ),
                  ),
                  const VerticalSpacer(space: 8),
                  AppTextField(
                    label: S.of(context).extra_details,
                    controller: extradetailsController,
                    suffixIcon: Icons.edit,
                    minLines: 3,
                    maxLines: 10,
                    suffixSvg: Transform.scale(
                      scale: 0.6,
                      child: const SvgHandler(
                          imagePath: AssetsConstants.description,
                          height: 12,
                          width: 12),
                    ),
                  ),
                  const VerticalSpacer(space: 24),
                  AppButton(
                    text: S.of(context).add_order,
                    onTap: () {
                      if(key.currentState!.validate()){
                         showOrderConfirmation(
                        context: context,
                        orderCategory: widget.data["cat name"],
                        orderType: widget.data['item name'],
                        orderDate: AppConst.getDate(),
                        details: detailsController.text,
                        extraDetails: extradetailsController.text,
                      );
                      }

                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
