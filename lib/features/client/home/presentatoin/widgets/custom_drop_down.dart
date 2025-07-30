import 'package:supplier_app/core/utils/constants/color_consatnts.dart';
import 'package:supplier_app/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.text,
    this.width = 58,
    required this.entries, required this.onSelected,
  });
  final String text;
  final double? width;
  final List entries;
  final void Function(dynamic)? onSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width,
          child: Text(
            text,
            style:
                applyBoldStyle(fontSize: 10, fontColor: ColorConsatnts.black),
          ),
        ),
        Transform.scale(
          scaleY: 0.6,
          child: DropdownMenu(
            width: width! * 1.4,
            onSelected:onSelected,
            trailingIcon: const Icon(
              Icons.arrow_drop_down,
              size: 20,
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.only(left: 4.w),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6.r)),
            ),
            menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(ColorConsatnts.white)),
            initialSelection: entries[0],
            dropdownMenuEntries: entries
                .map(
                  (e) => DropdownMenuEntry(
                    value: e,
                    label: "$e",
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}



