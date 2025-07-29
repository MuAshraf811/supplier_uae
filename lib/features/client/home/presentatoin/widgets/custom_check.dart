import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:supplier_app/core/utils/widgets/spacers.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class CustomCheck extends StatefulWidget {
  const CustomCheck({super.key, this.title});
  final String? title;
  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.85,
          child: Checkbox(
              value: value,
              activeColor: ColorConsatnts.primary,
              onChanged: (val) {
                setState(() {
                  value = val!;
                });
              }),
        ),
        const HorizontalSpacer(space: 6),
        Text(
          widget.title ?? S.of(context).agree_terms,
          style:
              applyMediumStyle(fontSize: 14, fontColor: ColorConsatnts.black),
        )
      ],
    );
  }
}