// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../../core/constants/values.dart';

class BenefitItem extends StatelessWidget {
  final String icon;
  final String text;
  bool isSteps;

  BenefitItem({required this.icon, required this.text, this.isSteps = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isSteps) ...[
            Padding(
              padding: EdgeInsets.only(
                  bottom: 5.h,
                  left: isArabic ? 0 : 10.h,
                  top: 5.h,
                  right: isArabic ? 10.h : 0.h),
              child: Image.asset(
                icon,
                color: context.primaryColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: kBenefitCardPadding,
                child: Text(
                  text.capitalizeFirstLetter(),
                  style:
                      context.bodyLarge?.copyWith(color: appTheme.blackColor),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ] else ...[
            Padding(
              padding: EdgeInsets.only(
                  bottom: 5.h,
                  left: isArabic ? 0 : 10.h,
                  top: 5.h,
                  right: isArabic ? 10.h : 0.h),
              child: SvgPicture.asset(
                icon,
                height: 30.h,
                width: 26.h,
                color: context.primaryColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: kBenefitCardPadding,
                child: Text(
                  text.capitalizeFirstLetter(),
                  style:
                      context.bodyLarge?.copyWith(color: appTheme.blackColor),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
