// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';

import '../../../../../../core/constants/static_constants/static_constants.dart';

class FaqItems extends StatefulWidget {
  String name;
  String description;
  String number;
  FaqItems(
      {super.key,
      required this.description,
      required this.name,
      required this.number});

  @override
  State<FaqItems> createState() => _FaqItemsState();
}

class _FaqItemsState extends State<FaqItems> {
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
                        selectedItem = !selectedItem;
                      });
                    },
                    child: Expanded(
                        flex: 10,
                        child: CommonTextWidget(
                            color: allColors.textColor,
                            size:16,
                            align: TextAlign.start,
                            text: widget.name.capitalizeFirstLetter()??"",
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(top: 0.h))),
                  ),
                  
                    SizedBox(
                      height: 5.h,
                    ),
                    CommonTextWidget(
                        color: allColors.textColor,
                        size: 16,
                        align: TextAlign.justify,
                        text: widget.description.capitalizeFirstLetter()??"",
                        weight: FontWeight.w400,
                        padding: EdgeInsets.only(
                            bottom: 5.h,
                            right: isArabic ? 0 : 20.h,
                            left: isArabic ? 20.h : 0.h))
                 
                ],
              ),
            ))
      ],
    );
  }
}
