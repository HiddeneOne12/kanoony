// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 7.h,
            color: allColors.errorColor,
          ),
          SizedBox(
            width: 10.h,
          ),
          Flexible(
            child: CommonTextWidget(
                color: allColors.textColor,
                size: 16,
                align: TextAlign.justify,
                text: point.capitalizeFirstLetter() ?? "",
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
