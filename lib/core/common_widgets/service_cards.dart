// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

class ServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  final bool isPng;
  final bool isBold;
  void Function()? onTap;

  ServiceCard(
      {required this.icon,
      required this.text,
      required this.onTap,
      this.isBold = false,
      this.isPng = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: allColors.canvasColor,
          surfaceTintColor: allColors.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(7.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: isBold ? 40.h : 35.h,
                    width: isBold ? 33.h : 35.h,
                    child: isPng
                        ? Image.asset(icon)
                        : SvgPicture.asset(
                            icon,
                          ),
                  ),
                  SizedBox(height: 10.h),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: isBold ? 14.sp : 10.sp,
                      text: text,
                      weight: FontWeight.w500,
                      padding: noPadding)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
