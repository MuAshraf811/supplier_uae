import 'dart:developer';

import 'package:supplier_app/core/utils/constants/assets_constants.dart';
import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:supplier_app/core/utils/widgets/svg_handler.dart';
import 'package:supplier_app/features/client/chat/presentation/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/constants/packaging_constants.dart';
import '../../../../../core/utils/constants/route_constants.dart';
import '../../../../../generated/l10n.dart';

class DetailedItemPackaging extends StatelessWidget {
  const DetailedItemPackaging({
    super.key,
    required this.packageOrderIndex,
    required this.title,
  });
  final int packageOrderIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(space: 16),
              CustomAppbar(title: title),
              const VerticalSpacer(space: 12),
               Text(
                S.of(context).select_section,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              const VerticalSpacer(space: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: (packageOrderIndex - 4 >= 0 &&
                          packageOrderIndex - 4 <
                              PackagingConstants.innerTitles(context).length)
                      ? PackagingConstants
                          .innerTitles(context)[packageOrderIndex - 4].length
                      : 0,
                  itemBuilder: (context, index) => Container(
                    height: 64.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: ColorConsatnts.white,
                      border:
                          Border.all(color: ColorConsatnts.grey, width: 0.5.h),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            color: ColorConsatnts.grey.withOpacity(0.5),
                            blurRadius: 2.w,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(1.5.w, 2.5.h)),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        try {
                          Navigator.pushNamed(
                              context, RouteConstants.detailedPackagingView,
                              arguments: {
                                "innerIndex":index,
                                "title": title,
                                "packageItemIndex": packageOrderIndex,
                              });
                        } catch (e) {
                          log(e.toString());
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          const HorizontalSpacer(space: 12),
                          Text(
                            PackagingConstants
                                .innerTitles(context)[packageOrderIndex - 4][index],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Transform.rotate(
                            angle: 3.1417,
                            child: const SvgHandler(
                              imagePath: AssetsConstants.arrowLeftIcon,
                              height: 18,
                              width: 18,
                            ),
                          )
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
