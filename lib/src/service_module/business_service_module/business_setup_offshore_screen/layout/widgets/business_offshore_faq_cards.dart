// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class BusinessOffShoreFaqCards extends StatefulWidget {
  String name;
  String description;
  BusinessOffShoreFaqCards(
      {super.key, required this.description, required this.name});

  @override
  State<BusinessOffShoreFaqCards> createState() =>
      _BusinessOffShoreFaqCardsState();
}

class _BusinessOffShoreFaqCardsState extends State<BusinessOffShoreFaqCards> {
  bool selectedItem = false;
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
                border: Border.all(color: allColors.textColor, width: 1.w),
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
                            child: CommonTextWidget(
                                color: allColors.textColor,
                                size: 14.sp,
                                align: TextAlign.start,
                                text: widget.name,
                                weight: FontWeight.w500,
                                padding: EdgeInsets.only(
                                    left: isArabic ? 0 : 10.h,
                                    right: isArabic ? 10.h : 0))),
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
                              size: 13.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selectedItem) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                    CommonTextWidget(
                        color: allColors.textColor,
                        size: 11.sp,
                        align: TextAlign.justify,
                        text: widget.description,
                        weight: FontWeight.w400,
                        padding: EdgeInsets.only(
                            right: isArabic ? 0 : 20.h,
                            bottom: 5.h,
                            left: isArabic ? 20.h : 0))
                  ],
                ],
              ),
            ))
      ],
    );
  }
}
