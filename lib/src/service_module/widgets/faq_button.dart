// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../core/constants/object_constants/object_constants.dart';


class FaqButton extends ConsumerStatefulWidget {
  bool isCallIcon;
  Color backgroundColor;
  void Function() onTap;
  FaqButton(
      {super.key,
      required this.backgroundColor,
      required this.isCallIcon,
      required this.onTap});

  @override
  ConsumerState<FaqButton> createState() => _FaqButtonState();
}

class _FaqButtonState extends ConsumerState<FaqButton> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
                color: widget.backgroundColor, borderRadius: kBorderRadius8),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Container(
                      height: 17.h,
                      width: 17.h,
                      decoration: BoxDecoration(
                          color: allColors.canvasColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.r))),
                      child: Icon(
                        Icons.question_mark_outlined,
                        size: 14.h,
                        color: context.onSurfaceColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    variables.staticData?.frequentlyAskedQuestions
                            .capitalizeFirstLetter() ??
                        '',
                    style: context.labelLarge
                        ?.copyWith(color: context.onPrimaryColor),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.isCallIcon) ...[
          Padding(
            padding: EdgeInsets.only(left: 0.83.sw),
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                height: 63.h,
                width: 63.h,
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                    color: allColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(100.r))),
                child: Container(
                  decoration: BoxDecoration(
                      color: allColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.r))),
                  child: Icon(
                    Icons.phone,
                    color: allColors.textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
