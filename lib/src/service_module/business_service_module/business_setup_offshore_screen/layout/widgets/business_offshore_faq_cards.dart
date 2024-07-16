// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

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
            padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                border: Border.all(color: context.onSurfaceColor, width: 1.w),
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
                                color: allColors.textColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.r))),
                            height: 26.h,
                            width: 26.w,
                            child: Icon(
                              Icons.business,
                              size: 15.h,
                              color: allColors.canvasColor,
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
                            name.capitalizeFirstLetter() ?? "",
                            style: context.labelLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic ? 0 : 20.h,
                        right: isArabic ? 20.h : 0,
                        bottom: 5.h),
                    child: Text(
                      description.capitalizeFirstLetter() ?? "",
                      style: context.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
