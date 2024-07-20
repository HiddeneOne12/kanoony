// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';

class BusinessFreeZoneServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  void Function()? onTap;

  BusinessFreeZoneServiceCard(
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
            borderRadius: kBorderRadius6,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 5.h, bottom: 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 26.h,
                    decoration: BoxDecoration(
                        color: appTheme.lightBlueColor,
                        borderRadius: kBorderRadius6),
                    alignment: Alignment.center,
                    child: Text(
                      text.capitalizeFirstLetter(),
                      style: context.bodyMedium,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
