import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';
import '../../../../../core/utils/constants/route_constants.dart';
import '../../../../../core/utils/styles/text_styles.dart';

class RegisterQuestion extends StatelessWidget {
  const RegisterQuestion({
    super.key, required this.isSupplier,
  });
 final bool isSupplier;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "Don't have an account? ",
            style: applySemiBoldStyle(
                fontSize: 15, fontColor: ColorConsatnts.black),
          ),
          InkWell(
            onTap: () {
            isSupplier?   Navigator.pushNamed(context, RouteConstants.supplierRegistererView) :Navigator.pushNamed(context, RouteConstants.registerView);
            },
            child: Text("Create account",
                style: applySemiBoldStyle(
                    fontSize: 15, fontColor: ColorConsatnts.primary)),
          )
        ],
      ),
    );
  }
}
