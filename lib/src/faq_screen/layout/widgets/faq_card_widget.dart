// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            color: allColors.canvasColor,
            borderRadius: BorderRadius.circular(6.r),
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
                        child: CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.questions,
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(top: 0.h))),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            color: allColors.darkGreyColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                        child: Icon(
                          isSelected
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: allColors.textColor,
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
                    "p": Style(
                        padding: HtmlPaddings.only(left: 0, right: 0),
                        color: allColors.textColor,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Tajawal'),
                  },
                  data: widget.answer,
                ),
              ],
            ],
          ),
        ));
  }
}
