// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.h, right: 16.h, bottom: 12.h, top: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              capitalizeFirst(widget.title),
              style: context.titleMedium?.copyWith(
                  color: widget.isVisa
                      ? context.onSurfaceColor
                      : allColors.scaffoldColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10.h,
            ),
            if (widget.isDoc) ...[
              Padding(
                padding: EdgeInsets.only(
                    right: isArabic ? 0 : 20.h,
                    left: isArabic ? 20.h : 0,
                    bottom: 5.h),
                child: Text(
                  capitalizeFirst(widget.description),
                  style: context.bodyMedium?.copyWith(
                      color: widget.isVisa
                          ? context.onSurfaceColor
                          : allColors.scaffoldColor,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
              if (!widget.isVisa) ...[
                Padding(
                  padding: EdgeInsets.only(
                      right: isArabic ? 0 : 20.h,
                      left: isArabic ? 20.h : 0,
                      bottom: 5.h),
                  child: Text(
                    capitalizeFirst(widget.p2),
                    style: context.bodyMedium?.copyWith(
                        color: allColors.scaffoldColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: isArabic ? 0 : 20.h,
                      left: isArabic ? 20.h : 0,
                      bottom: 5.h),
                  child: Text(
                    capitalizeFirst(widget.p3),
                    style: context.bodyMedium?.copyWith(
                        color: allColors.scaffoldColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
              ]
            ] else ...[
              Text(
                capitalizeFirst(widget.description),
                style: context.bodyMedium?.copyWith(
                    color: allColors.scaffoldColor,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ],
          ],
        ));
  }
}
