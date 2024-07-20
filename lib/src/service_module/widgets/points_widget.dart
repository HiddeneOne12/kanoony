// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../../core/constants/values.dart';

class PointsWidget extends StatelessWidget {
  String point;
  PointsWidget({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: kBottomPadding9,
            child: Icon(
              Icons.circle,
              size: 5.h,
              color: appTheme.blackColor,
            ),
          ),
          SizedBox(
            width: 10.h,
          ),
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(
                right: isArabic ? 0 : 20.h,
                bottom: 0.h,
                left: isArabic ? 20.h : 0),
            child: Text(
              point.capitalizeFirstLetter(),
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
            ),
          )),
        ],
      ),
    );
  }
}
