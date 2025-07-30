import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/constants/packaging_constants.dart';
import 'package:supplier_app/core/utils/constants/route_constants.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/features/client/chat/presentation/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class DetailedPackagingView extends StatelessWidget {
  const DetailedPackagingView({
    super.key,
    required this.packageItemIndex,
    required this.itemTitle,
    required this.innerIndex,
  });
  final int packageItemIndex;
  final String itemTitle;
  final int innerIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
            resizeToAvoidBottomInset: false,

      body: SafeArea( 
        
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(space: 16),
              CustomAppbar(title: S.of(context).packaging_view),
              const VerticalSpacer(space: 12),
              Text(
                itemTitle,
                style:
                    applyBoldStyle(fontSize: 16, fontColor: ColorConsatnts.red),
              ),
              const VerticalSpacer(space: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: packageItemIndex <= 3
                      ? PackagingConstants.showPackagingItems(
                              loopIndex: 1,
                              innerIndex: innerIndex)[packageItemIndex]
                          .length
                      : PackagingConstants.showPackagingItems(
                                  loopIndex: 1,
                                  innerIndex: innerIndex)[packageItemIndex]
                              [innerIndex]
                          .length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1.w / 1.4.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context, loopIndex) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteConstants.otherDetailedView,
                        arguments: {
                          "image": packageItemIndex <= 3
                              ? PackagingConstants.showPackagingItems(
                                          loopIndex: loopIndex + 1,
                                          innerIndex:
                                              innerIndex)[packageItemIndex]
                                      [loopIndex]
                                  .image
                              : PackagingConstants.showPackagingItems(
                                          loopIndex: loopIndex + 1,
                                          innerIndex:
                                              innerIndex)[packageItemIndex]
                                      [innerIndex][loopIndex]
                                  .image,
                          "cat name": "${S.of(context).packaging}\n$itemTitle",
                          "item name": packageItemIndex <= 3
                              ? PackagingConstants.showPackagingItems(
                                          loopIndex: loopIndex + 1,
                                          innerIndex:
                                              innerIndex)[packageItemIndex]
                                      [loopIndex]
                                  .title
                              : PackagingConstants.showPackagingItems(
                                          loopIndex: loopIndex + 1,
                                          innerIndex:
                                              innerIndex)[packageItemIndex]
                                      [innerIndex][loopIndex]
                                  .title
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConsatnts.white,
                        border: Border.all(
                            color: ColorConsatnts.grey, width: 0.5.h),
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConsatnts.grey.withOpacity(0.5),
                              blurRadius: 2.w,
                              spreadRadius: 2,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(1.5.w, 2.5.h)),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 130.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(packageItemIndex <= 3
                                    ? PackagingConstants.showPackagingItems(
                                                loopIndex: loopIndex + 1,
                                                innerIndex: innerIndex)[
                                            packageItemIndex][loopIndex]
                                        .image
                                    : PackagingConstants.showPackagingItems(
                                                    loopIndex: loopIndex + 1,
                                                    innerIndex: innerIndex)[
                                                packageItemIndex][innerIndex]
                                            [loopIndex]
                                        .image),
                              ),
                            ),
                          ),
                          const VerticalSpacer(space: 26),
                          Text(
                            packageItemIndex <= 3
                                ? PackagingConstants.showPackagingItems(
                                            loopIndex: loopIndex + 1,
                                            innerIndex:
                                                innerIndex)[packageItemIndex]
                                        [loopIndex]
                                    .title
                                : PackagingConstants.showPackagingItems(
                                            loopIndex: loopIndex + 1,
                                            innerIndex:
                                                innerIndex)[packageItemIndex]
                                        [innerIndex][loopIndex]
                                    .title,
                            textAlign: TextAlign.center,
                            style: applySemiBoldStyle(
                                fontSize: 16, fontColor: ColorConsatnts.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
