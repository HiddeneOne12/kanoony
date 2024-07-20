// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';

class FaqCard extends StatefulWidget {
  String answer;
  String questions;
  String number;
  bool isNumber;
  FaqCard(
      {super.key,
      required this.isNumber,
      required this.answer,
      required this.questions,
      required this.number});

  @override
  State<FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
          decoration: BoxDecoration(
            color: context.onPrimaryColor,
            borderRadius: kBorderRadius6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.isNumber) ...[
                      Expanded(
                        flex: 1,
                        child: CommonTextWidget(
                            color: allColors.primaryColor,
                            size: 14.sp,
                            text: widget.number,
                            align: TextAlign.start,
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(top: 0.h)),
                      ),
                    ],
                    Expanded(
                        flex: 10,
                        child: Text(
                          widget.questions,
                          style: context.titleMedium,
                          textAlign: TextAlign.start,
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: kBottomPadding5,
                      child: Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            color: appTheme.darkGreyColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                        child: Icon(
                          isSelected
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: context.onSurfaceColor,
                          size: 13.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected) ...[
                Html(
                  style: {
                    "p": context.htmlParagraphStyle,
                    //   "body": context.htmlParagraphStyle,
                  },
                  data: widget.answer,
                ),
              ],
            ],
          ),
        ));
  }
}
