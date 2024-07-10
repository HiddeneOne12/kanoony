// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';

class BluePrintCardListing extends StatefulWidget {
  String title;
  String description;
  BluePrintCardListing(
      {super.key, required this.description, required this.title});

  @override
  State<BluePrintCardListing> createState() => _BluePrintCardListingState();
}

class _BluePrintCardListingState extends State<BluePrintCardListing> {
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
                    Expanded(
                        flex: 10,
                        child: CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.start,
                            text: widget.title.capitalizeFirstLetter() ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(left: 0.h))),
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
                    color: allColors.textColor,
                    size: 16,
                    align: TextAlign.justify,
                    text: widget.description.capitalizeFirstLetter() ?? "",
                    weight: FontWeight.w400,
                    padding: EdgeInsets.only(
                        right: isArabic ? 0 : 20.h,
                        left: isArabic ? 20.h : 0,
                        bottom: 5.h)),
              ],
            ],
          ),
        ));
  }
}
