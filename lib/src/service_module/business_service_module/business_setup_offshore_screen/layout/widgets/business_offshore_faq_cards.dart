// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class BusinessOffShoreFaqCards extends StatelessWidget {
  String name;
  String description;
  BusinessOffShoreFaqCards(
      {super.key, required this.description, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: kLeftRightPadding16,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name.capitalizeFirstLetter(),
                    style: context.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    description.capitalizeFirstLetter() ,
                    style: context.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1,
                        height: 1.4.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
