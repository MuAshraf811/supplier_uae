import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.text,
    required this.entries, required this.onSelected,
  });
  final String text;
  final List entries; 
  final void Function(dynamic)? onSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 58.w,
          child: Text(
            text,
            style:
                applyBoldStyle(fontSize: 12, fontColor: ColorConsatnts.black),
          ),
        ),
        Transform.scale(
          scaleY: 0.6,
          child: DropdownMenu(
            width: 90.w,  
            
            onSelected:onSelected,
            trailingIcon: const Icon(
              Icons.arrow_drop_down,
              size: 24,
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



