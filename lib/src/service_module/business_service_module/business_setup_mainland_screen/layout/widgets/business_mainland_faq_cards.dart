// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class BusinessMainLandFaqItems extends StatelessWidget {
  String title;
  String description;
  BusinessMainLandFaqItems(
      {super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: kLeftRightPadding16,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title.capitalizeFirstLetter(),
                style: context.titleMedium?.copyWith(
                  color: context.onPrimaryColor,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                description.capitalizeFirstLetter(),
                style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.onPrimaryColor,
                    letterSpacing: 0.1,
                    height: 1.4.sp),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ));
  }
}
