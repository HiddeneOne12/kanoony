// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';

class PointsWidget extends StatelessWidget {
  String point;
  PointsWidget({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Container(
              height: 11.h,
              width: 11.h,
              decoration: BoxDecoration(
                  border: Border.all(color: allColors.errorColor),
                  borderRadius: BorderRadius.all(Radius.circular(30.r))),
              child: Icon(
                Icons.circle,
                size: 7.h,
                color: allColors.errorColor,
              ),
            ),
          ),
          SizedBox(
            width: 10.h,
          ),
          Flexible(
            child: CommonTextWidget(
                color: allColors.textColor,
                size: 14.sp,
                align: TextAlign.justify,
                text: point,
                weight: FontWeight.w400,
                padding: EdgeInsets.only(
                    right: isArabic ? 0 : 20.h,
                    bottom: 0.h,
                    left: isArabic ? 20.h : 0)),
          ),
        ],
      ),
    );
  }
}
