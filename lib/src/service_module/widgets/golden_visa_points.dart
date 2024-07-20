// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class GoldenVisaPoints extends StatelessWidget {
  String title;
  GoldenVisaPoints({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
          width: 5.h,
        ),
        Flexible(
            child: Padding(
          padding: EdgeInsets.only(
            bottom: 2.h,
          ),
          child: Text(
            title.capitalizeFirstLetter(),
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
        )),
      ],
    );
  }
}
