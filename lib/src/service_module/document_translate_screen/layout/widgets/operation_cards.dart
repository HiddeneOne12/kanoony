// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';

class OperationCards extends StatelessWidget {
  String num;
  String title;
  OperationCards({super.key, required this.num, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kBottomPadding9,
      child: Container(
        decoration: BoxDecoration(
            color: context.onSurfaceColor,
            border: Border.all(color: appTheme.textFieldColor, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: kLeftRightPadding16,
              child: Text(
                num,
                style: context.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Text(
                title,
                style: context.bodyLarge?.copyWith(
                    color: appTheme.lightTextColor,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
