// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class FaqItems extends StatefulWidget {
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
  State<FaqItems> createState() => _FaqItemsState();
}

class _FaqItemsState extends State<FaqItems> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: kBottomPadding9,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h,
                  right: 16.h,
                  top: widget.isTrade ? 16.h : 14.h,
                  bottom: 10.h),
              decoration: BoxDecoration(
                color: context.onPrimaryColor,
                borderRadius: kBorderRadius6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.isTrade) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                  if (widget.isHtml) ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Html(
                                style: {
                                  "span": context.htmlTitleStyle,
                                  "body": context.htmlTitleStyle,
                                },
                                data: widget.name.capitalizeFirstLetter(),
                              ),
                            ),
                            Icon(
                              isSelected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: context.onSurfaceColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ] else if (widget.isTrade) ...[
                    Padding(
                      padding: kBottomPadding5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.name.capitalizeFirstLetter(),
                                style: context.titleMedium,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Icon(
                              isSelected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: context.onSurfaceColor,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    Text(
                      widget.name.capitalizeFirstLetter(),
                      style: context.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                  if (widget.isTrade && isSelected) ...[
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      height: 1.h,
                      color: appTheme.dividerColor,
                      thickness: 1.h,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 5.h,
                          right: isArabic ? 0 : 20.h,
                          left: isArabic ? 20.h : 0.h),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: widget.description.capitalizeFirstLetter(),
                          style: context.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400, height: 1.4.sp),
                        ),
                      ),
                    ),
                  ] else if (!widget.isTrade) ...[
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 5.h,
                          right: isArabic ? 0 : 20.h,
                          left: isArabic ? 20.h : 0.h),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: widget.description.capitalizeFirstLetter(),
                          style: context.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400, height: 1.4.sp),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ))
      ],
    );
  }
}
