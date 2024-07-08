// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  void Function()? onTap;
  double padding;
  bool isIcon;
  Color? color = allColors.textColor;
  FontWeight? weight = FontWeight.w500;
 final  bool? isProfileDrawer;
  DrawerItem(
      {super.key, required this.text,
      required this.onTap,
      this.color,
      this.weight,
      required this.padding,
      this.isIcon = false, this.isProfileDrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left:  isArabic ? 16.h : isProfileDrawer == true ? padding.sw : isIcon? padding.sw : 3,
          right: isArabic ? padding.sw : isProfileDrawer == true ? padding.sw : isIcon  ? 16.h : 3),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: CommonTextWidget(
                      height: 1,
                    color: color ?? allColors.textColor,
                    size: 18.sp,
                    align: TextAlign.start,
                    text: text,
                    weight: weight ?? FontWeight.w500,
                    padding: noPadding),
              ),
            ),
            if (isIcon) ...[
              Padding(
                padding: EdgeInsets.only(right: 16.h),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: color ?? allColors.textColor,
                  size: 24.h,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
