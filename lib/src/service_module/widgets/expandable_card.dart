// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/service_module/widgets/golden_visa_points.dart';
import 'package:kanoony/src/service_module/widgets/points_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class ExpandableCards extends StatelessWidget {
  String name;
  bool isSix;
  bool isSeven;
  bool isThree;
  String point1;
  String point2;
  String point3;
  String point4;
  String point5;
  String point6;
  String point7;
  String point8;
  String point9;
  String point10;
  String pointExtra1;
  String pointExtra2;
  String pointExtra3;
  String pointExtra4;
  String price;
  bool isWill;
  String isWillTitle;
  bool isVisa;
  bool isEight;
  bool isPadding;
  ExpandableCards(
      {super.key,
      required this.isSix,
      required this.name,
      this.isEight = false,
      this.isPadding = false,
      this.point10 = '',
      this.pointExtra1 = '',
      this.pointExtra2 = '',
      this.pointExtra3 = '',
      this.pointExtra4 = '',
      this.point8 = '',
      this.point9 = '',
      required this.isSeven,
      this.isVisa = false,
      this.isWillTitle = '',
      required this.isThree,
      required this.point1,
      required this.point2,
      required this.point3,
      required this.point4,
      required this.point5,
      required this.point6,
      required this.price,
      this.isWill = false,
      required this.point7});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 20.h),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: isPadding ? 0 : 16.h,
                  right: isPadding ? 0 : 16.h,
                  top: 15.h,
                  bottom: 5.h),
              decoration: BoxDecoration(
                color: context.onPrimaryColor,
                border: Border.all(color: context.onPrimaryColor, width: 1.w),
                borderRadius: kBorderRadius6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isEight) ...[
                    Html(
                      style: {
                        "span": context.htmlTitleStyle,
                        "body": context.htmlTitleStyle,
                      },
                      data: name.capitalizeFirstLetter(),
                    ),
                  ] else ...[
                    Text(
                      name.capitalizeFirstLetter(),
                      style: context.labelLarge,
                      textAlign: TextAlign.start,
                    )
                  ],
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    thickness: 1.w,
                    height: 1.h,
                    color: appTheme.dividerColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (isVisa) ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: Text(
                        isWillTitle.capitalizeFirstLetter(),
                        style: context.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (point1.isNotEmpty) ...[
                      Padding(
                        padding: kBottomPadding5,
                        child: Text(
                          point1.capitalizeFirstLetter(),
                          style: context.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(
                        point2.capitalizeFirstLetter(),
                        style: context.titleMedium
                            ?.copyWith(color: appTheme.errorColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: kBottomPadding5,
                      child: Text(
                        point3.capitalizeFirstLetter(),
                        style: context.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GoldenVisaPoints(title: point4),
                    GoldenVisaPoints(title: point5),
                    GoldenVisaPoints(title: point6),
                    if (pointExtra3.isNotEmpty) ...[
                      GoldenVisaPoints(title: pointExtra3),
                    ],
                    if (pointExtra4.isNotEmpty) ...[
                      GoldenVisaPoints(title: pointExtra4),
                    ],
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                      child: Text(
                        point7.capitalizeFirstLetter(),
                        style: context.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (price.isNotEmpty) ...[
                      GoldenVisaPoints(title: price),
                    ],
                    if (pointExtra1.isNotEmpty) ...[
                      GoldenVisaPoints(title: pointExtra1),
                    ],
                    if (pointExtra2.isNotEmpty) ...[
                      GoldenVisaPoints(title: pointExtra2),
                    ],
                    if (point8.isNotEmpty &&
                        point10.isNotEmpty &&
                        point9.isNotEmpty) ...[
                      GoldenVisaPoints(title: point8),
                      GoldenVisaPoints(title: point9),
                      GoldenVisaPoints(title: point10),
                    ],
                  ],
                  if (isEight) ...[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                      child: Text(
                        isWillTitle.capitalizeFirstLetter(),
                        style: context.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    PointsWidget(point: point1),
                    PointsWidget(point: point2),
                    PointsWidget(point: point3),
                    PointsWidget(point: point4),
                    if (point5.isNotEmpty) ...[
                      PointsWidget(point: point5),
                    ],
                    if (point6.isNotEmpty) ...[
                      PointsWidget(point: point6),
                    ],
                    if (point7.isNotEmpty) ...[
                      PointsWidget(point: point7),
                    ],
                    if (point8.isNotEmpty) ...[
                      PointsWidget(point: point8),
                    ],
                  ],
                  if (isSix) ...[
                    PointsWidget(point: point1),
                    PointsWidget(point: point2),
                    PointsWidget(point: point3),
                    PointsWidget(point: point4),
                    PointsWidget(point: point5),
                    PointsWidget(point: point6),
                  ] else if (isSeven) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      child: Text(
                        price.capitalizeFirstLetter(),
                        style: context.displayMedium
                            ?.copyWith(color: appTheme.errorColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    if (isWill) ...[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.h,
                        ),
                        child: Text(
                          isWillTitle.capitalizeFirstLetter(),
                          style: context.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                    PointsWidget(point: point1),
                    PointsWidget(point: point2),
                    PointsWidget(point: point3),
                    PointsWidget(point: point4),
                    PointsWidget(point: point5),
                    if (isWill) ...[
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        child: Divider(
                          thickness: 1.w,
                          height: 1.h,
                          color: appTheme.dividerColor,
                        ),
                      ),
                      Padding(
                        padding: kBottomPadding5,
                        child: Text(
                          point6.capitalizeFirstLetter(),
                          style: context.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: kBottomPadding5,
                        child: Text(
                          point7.capitalizeFirstLetter(),
                          style: context.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ] else ...[
                      PointsWidget(point: point6),
                      PointsWidget(point: point7),
                    ],
                  ] else if (isThree) ...[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                      child: Text(
                        price.capitalizeFirstLetter(),
                        style: context.displayMedium
                            ?.copyWith(color: appTheme.errorColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    PointsWidget(point: point1),
                    PointsWidget(point: point2),
                    PointsWidget(point: point3),
                  ],
                ],
              ),
            ))
      ],
    );
  }
}
