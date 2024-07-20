// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class BusinessOffshoreLandServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  void Function()? onTap;

  BusinessOffshoreLandServiceCard(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: context.onPrimaryColor,
          surfaceTintColor: context.onPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius10,
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
                  SizedBox(height: 10.h),
                  Text(
                    text.capitalizeFirstLetter() ,
                    style: context.titleSmall
                        ?.copyWith(color: allColors.blackColor),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
