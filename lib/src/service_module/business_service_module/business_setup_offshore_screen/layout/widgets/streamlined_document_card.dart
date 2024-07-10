// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

import '../../../../../../core/constants/object_constants/object_constants.dart';

class StreamLinedCard extends StatelessWidget {
  String step;
  String num;
  String img;
  String title;
  String description;
  StreamLinedCard(
      {super.key,
      required this.description,
      required this.img,
      required this.num,
      required this.step,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Padding(
        padding: EdgeInsets.only(right: 10.h),
        child: InkWell(
          onTap: () async {},
          child: Container(
            height: 240.h,
            width: 220.h,
            decoration: BoxDecoration(
              color: allColors.canvasColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 34.h,
                        width: 34.h,
                        child: Image.asset(
                          img,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            step,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: allColors.textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            num,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: allColors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    title.capitalizeFirstLetter() ?? "",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: allColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                   ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    description.capitalizeFirstLetter() ?? "",
                    maxLines: 4,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: allColors.textColor,
                        fontWeight: FontWeight.w400,
                        
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
