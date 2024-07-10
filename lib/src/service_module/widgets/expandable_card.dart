// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/service_module/widgets/golden_visa_points.dart';
import 'package:kanoony/src/service_module/widgets/points_widget.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';

class ExpandableCards extends StatefulWidget {
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
  ExpandableCards(
      {super.key,
      required this.isSix,
      required this.name,
      this.isEight = false,
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
  State<ExpandableCards> createState() => _ExpandableCardsState();
}

class _ExpandableCardsState extends State<ExpandableCards> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
                decoration: BoxDecoration(
                  color: allColors.canvasColor,
                  border: Border.all(color: allColors.canvasColor, width: 1.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = !selectedItem;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget.isEight) ...[
                            Expanded(
                              flex: 10,
                              child: Html(
                                style: {
                                  "span": Style(
                                      margin: Margins.zero,
                                      padding: HtmlPaddings.zero,
                                      color: allColors.textColor,
                                      fontSize: FontSize(17),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal'),
                                  "body": Style(
                                      color: allColors.textColor,
                                      margin: Margins.zero,
                                      padding: HtmlPaddings.zero,
                                      fontSize: FontSize(17),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal'),
                                },
                                data: widget.name.capitalizeFirstLetter(),
                              ),
                            ),
                          ] else ...[
                            Expanded(
                                flex: 10,
                                child: CommonTextWidget(
                                    color: allColors.textColor,
                                    size: 16,
                                    align: TextAlign.start,
                                    text: widget.name,
                                    weight: FontWeight.w500,
                                    padding: noPadding)),
                          ],
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Container(
                              height: 22.h,
                              width: 22.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.r))),
                              child: Icon(
                                selectedItem
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: allColors.textColor,
                                size: 19.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (selectedItem) ...[
                      Divider(
                        thickness: 1.w,
                        height: 1.h,
                        color: allColors.dividerColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (widget.isVisa) ...[
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.isWillTitle.capitalizeFirstLetter() ?? "",
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(bottom: 5.h)),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.point1,
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(bottom: 5.h)),
                        CommonTextWidget(
                            color: allColors.errorColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.point2,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(bottom: 10.h)),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.point3,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(bottom: 5.h)),
                        GoldenVisaPoints(title: widget.point4),
                        GoldenVisaPoints(title: widget.point5),
                        GoldenVisaPoints(title: widget.point6),
                        if (widget.pointExtra3.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.pointExtra3),
                        ],
                        if (widget.pointExtra4.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.pointExtra4),
                        ],
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.point7,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(bottom: 5.h, top: 5.h)),
                        if (widget.price.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.price),
                        ],
                        if (widget.pointExtra1.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.pointExtra1),
                        ],
                        if (widget.pointExtra2.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.pointExtra2),
                        ],
                        if (widget.point8.isNotEmpty &&
                            widget.point10.isNotEmpty &&
                            widget.point9.isNotEmpty) ...[
                          GoldenVisaPoints(title: widget.point8),
                          GoldenVisaPoints(title: widget.point9),
                          GoldenVisaPoints(title: widget.point10),
                        ],
                      ],
                      if (widget.isEight) ...[
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.isWillTitle.capitalizeFirstLetter() ?? "",
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(bottom: 5.h, top: 5.h)),
                        PointsWidget(point: widget.point1),
                        PointsWidget(point: widget.point2),
                        PointsWidget(point: widget.point3),
                        PointsWidget(point: widget.point4),
                        if (widget.point5.isNotEmpty) ...[
                          PointsWidget(point: widget.point5),
                        ],
                        if (widget.point6.isNotEmpty) ...[
                          PointsWidget(point: widget.point6),
                        ],
                        if (widget.point7.isNotEmpty) ...[
                          PointsWidget(point: widget.point7),
                        ],
                        if (widget.point8.isNotEmpty) ...[
                          PointsWidget(point: widget.point8),
                        ],
                      ],
                      if (widget.isSix) ...[
                        PointsWidget(point: widget.point1),
                        PointsWidget(point: widget.point2),
                        PointsWidget(point: widget.point3),
                        PointsWidget(point: widget.point4),
                        PointsWidget(point: widget.point5),
                        PointsWidget(point: widget.point6),
                      ] else if (widget.isSeven) ...[
                        CommonTextWidget(
                            color: allColors.errorColor,
                            size: 25.sp,
                            align: TextAlign.start,
                            text: widget.price,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5.h,
                                left: isArabic ? 0 : 0.h,
                                right: isArabic ? 0.h : 0)),
                        if (widget.isWill) ...[
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 18.sp,
                              align: TextAlign.start,
                              text: widget.isWillTitle.capitalizeFirstLetter() ?? "",
                              weight: FontWeight.w500,
                              padding: EdgeInsets.only(
                                  bottom: 10.h,
                                  left: isArabic ? 0 : 0.h,
                                  right: isArabic ? 0.h : 0)),
                        ],
                        PointsWidget(point: widget.point1),
                        PointsWidget(point: widget.point2),
                        PointsWidget(point: widget.point3),
                        PointsWidget(point: widget.point4),
                        PointsWidget(point: widget.point5),
                        if (widget.isWill) ...[
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: Divider(
                              thickness: 1.w,
                              height: 1.h,
                              color: allColors.dividerColor,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 15,
                              align: TextAlign.start,
                              text: widget.point6,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(
                                  bottom: 5.h,
                                  left: isArabic ? 0 : 0.h,
                                  right: isArabic ? 0.h : 0)),
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 15,
                              align: TextAlign.start,
                              text: widget.point7,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(
                                  bottom: 5.h,
                                  left: isArabic ? 0 : 0.h,
                                  right: isArabic ? 0.h : 0)),
                        ] else ...[
                          PointsWidget(point: widget.point6),
                          PointsWidget(point: widget.point7),
                        ],
                      ] else if (widget.isThree) ...[
                        CommonTextWidget(
                            color: allColors.errorColor,
                            size: 25.sp,
                            align: TextAlign.start,
                            text: widget.price,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5.h,
                                left: isArabic ? 0 : 0.h,
                                right: isArabic ? 0.h : 0)),
                        PointsWidget(point: widget.point1),
                        PointsWidget(point: widget.point2),
                        PointsWidget(point: widget.point3),
                      ],
                    ],
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
