// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';

class ExpandableItems extends StatefulWidget {
  String title;
  String description;
  bool isDoc;
  String p2;
  String p3;
  bool isVisa;
  ExpandableItems(
      {super.key,
      required this.description,
      this.isVisa = false,
      this.p2 = '',
      this.p3 = '',
      required this.title,
      this.isDoc = false});

  @override
  State<ExpandableItems> createState() => _ExpandableItemsState();
}

class _ExpandableItemsState extends State<ExpandableItems> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 12.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
                color:
                    widget.isVisa ? allColors.textColor : allColors.canvasColor,
                width: 1.w),
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
                    if (!widget.isDoc) ...[
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: SizedBox(
                            height: 26.h,
                            width: 26.w,
                            child: Icon(
                              Icons.business,
                              size: 25.h,
                              color: allColors.canvasColor,
                            )),
                      ),
                    ],
                    Expanded(
                        flex: 10,
                        child: CommonTextWidget(
                            color: widget.isVisa
                                ? allColors.textColor
                                : allColors.canvasColor,
                            size: 16,
                            align: TextAlign.start,
                            text: capitalizeFirst(widget.title),
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: isArabic
                                    ? 0
                                    : widget.isDoc
                                        ? 0
                                        : 10.h,
                                right: isArabic
                                    ? widget.isDoc
                                        ? 0
                                        : 10.h
                                    : 0))),
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
                          color: widget.isVisa
                              ? allColors.textColor
                              : allColors.canvasColor,
                          size: 19.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedItem) ...[
                if (widget.isDoc) ...[
                  Divider(
                    height: 1.h,
                    thickness: 1.w,
                    color: allColors.borderColor,
                  )
                ],
                SizedBox(
                  height: widget.isDoc ? 10.h : 5.h,
                ),
                if (widget.isDoc) ...[
                  CommonTextWidget(
                      color: widget.isVisa
                          ? allColors.textColor
                          : allColors.scaffoldColor,
                      size: 16,
                      align: TextAlign.justify,
                      text: widget.description,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(
                          right: isArabic ? 0 : 20.h,
                          left: isArabic ? 20.h : 0,
                          bottom: 5.h)),
                  if (!widget.isVisa) ...[
                    CommonTextWidget(
                        color: allColors.scaffoldColor,
                        size: 16,
                        align: TextAlign.justify,
                        text: widget.p2,
                        weight: FontWeight.w400,
                        padding: EdgeInsets.only(
                            right: isArabic ? 0 : 20.h,
                            left: isArabic ? 20.h : 0,
                            bottom: 5.h)),
                    CommonTextWidget(
                        color: allColors.scaffoldColor,
                        size: 16,
                        align: TextAlign.justify,
                        text: widget.p3,
                        weight: FontWeight.w400,
                        padding: EdgeInsets.only(
                            right: isArabic ? 0 : 20.h,
                            left: isArabic ? 20.h : 0,
                            bottom: 5.h))
                  ]
                ] else ...[
                  CommonTextWidget(
                      color: allColors.scaffoldColor,
                      size: 16,
                      align: TextAlign.justify,
                      text: widget.description,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(
                          right: isArabic ? 0 : 20.h,
                          left: isArabic ? 20.h : 0,
                          bottom: 5.h))
                ],
              ],
            ],
          ),
        ));
  }
}
