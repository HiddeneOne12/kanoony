// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class BusinessMainLandServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  void Function()? onTap;

  BusinessMainLandServiceCard(
      {required this.icon, required this.text, required this.onTap});

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
              padding: EdgeInsets.all(16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 36.h,
                    width: 36.h,
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CommonTextWidget(
                      color: allColors.blackColor,
                      size: 14.sp,
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
