// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

class BusinessMainLandFaqItems extends StatefulWidget {
  String title;
  String description;
  BusinessMainLandFaqItems(
      {super.key, required this.description, required this.title});

  @override
  State<BusinessMainLandFaqItems> createState() =>
      _BusinessMainLandFaqItemsState();
}

class _BusinessMainLandFaqItemsState extends State<BusinessMainLandFaqItems> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
          decoration: BoxDecoration(
            border: Border.all(color: allColors.borderColor, width: 1.w),
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
                              color: allColors.primaryColor,
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
                            color: allColors.canvasColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.title.capitalizeFirstLetter() ?? "",
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
                          color: allColors.canvasColor,
                          size: 20.h,
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
                    color: allColors.canvasColor,
                    size: 16,
                    text: widget.description.capitalizeFirstLetter() ?? "",
                    weight: FontWeight.w400,
                    padding: EdgeInsets.only(
                        right: isArabic ? 0 : 20.h,
                        left: isArabic ? 20.h : 0,
                        bottom: 5.h))
              ],
            ],
          ),
        ));
  }
}
