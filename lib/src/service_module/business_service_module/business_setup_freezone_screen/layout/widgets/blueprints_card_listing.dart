// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class BluePrintCardListing extends StatelessWidget {
  String title;
  String description;
  BluePrintCardListing(
      {super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title.capitalizeFirstLetter() ?? '',
              style: context.labelLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h, bottom: 5.h),
              child: Text(
                description.capitalizeFirstLetter() ?? "",
                style: context.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ));
  }
}
