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
        padding: const EdgeInsets.all( 12),
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
                 
                ],
              ),
            ),
            
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
        ));
  }
}
