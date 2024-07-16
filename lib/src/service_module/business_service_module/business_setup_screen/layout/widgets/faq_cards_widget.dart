// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class FaqItems extends StatelessWidget {
  String name;
  String description;
  String number;
  bool isTrade;
  bool isHtml;
  FaqItems(
      {super.key,
      required this.description,
      this.isTrade = false,
      this.isHtml = false,
      required this.name,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: kBottomPadding9,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: context.onPrimaryColor,
                borderRadius: kBorderRadius6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isTrade) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                  if (isHtml) ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: Html(
                        style: {
                          "span": Style(
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              textAlign: TextAlign.start,
                              color: allColors.textColor,
                              fontSize: FontSize(17.sp),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Tajawal'),
                          "body": Style(
                              color: allColors.textColor,
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              textAlign: TextAlign.start,
                              fontSize: FontSize(17.sp),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Tajawal'),
                        },
                        data: name.capitalizeFirstLetter(),
                      ),
                    ),
                  ] else if (isTrade) ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: Text(
                        name.capitalizeFirstLetter() ?? "",
                        style: context.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ] else ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: Text(
                        name.capitalizeFirstLetter() ?? "",
                        style: context.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                  if (isTrade) ...[
                    Divider(
                      thickness: 1.w,
                      color: allColors.dividerColor,
                    ),
                  ],
                  Padding(
                    padding: EdgeInsets.only(
                        top: isTrade ? 5.h : 0,
                        bottom: 5.h,
                        right: isArabic ? 0 : 20.h,
                        left: isArabic ? 20.h : 0.h),
                    child: Text(
                      description.capitalizeFirstLetter() ?? "",
                      style: isTrade
                          ? context.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400)
                          : context.labelSmall,
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
