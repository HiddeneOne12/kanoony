// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class BluePrintCardListing extends StatelessWidget {
  String title;
  String description;
  BluePrintCardListing(
      {super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.capitalizeFirstLetter(),
          style: context.titleMedium,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          description.capitalizeFirstLetter(),
          style: context.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.onSurfaceColor,
              letterSpacing: 0.1,
              height: 1.4.sp),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
