// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
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
        padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
          decoration: BoxDecoration(
            border: Border.all(color: allColors.borderColor, width: 1.w),
            borderRadius: kBorderRadius6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Container(
                        decoration: BoxDecoration(
                            color: context.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r))),
                        height: 26.h,
                        width: 26.w,
                        child: Icon(
                          Icons.business,
                          size: 15.h,
                          color: context.onPrimaryColor,
                        )),
                  ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: isArabic ? 0 : 10.h,
                        right: isArabic ? 10.h : 0,
                      ),
                      child: Text(
                        title.capitalizeFirstLetter() ?? "",
                        style: context.labelLarge?.copyWith(color: context.onPrimaryColor,),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: isArabic ? 0 : 20.h,
                    right: isArabic ? 20.h : 0,
                    bottom: 5.h),
                child: Text(
                  description.capitalizeFirstLetter() ?? "",
                  style: context.bodyLarge?.copyWith(color: context.onPrimaryColor,),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ));
  }
}
