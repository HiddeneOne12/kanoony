// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'common_text_widget.dart';

class CommonImgButtonWidget extends StatefulWidget {
  EdgeInsetsGeometry padding;
  double height;
  void Function()? onTap;
  Color backgroundColor;
  Color borderColor;
  double radius;
  ValueNotifier<bool>? isLoading;
  FontWeight weight;
  Widget icon;
  String text;
  double fontSize;
  Color fontColor;
  CommonImgButtonWidget(
      {super.key,
      required this.padding,
      this.weight = FontWeight.w700,
      this.fontSize = 14,
      required this.fontColor,
      required this.height,
      required this.onTap,
      required this.backgroundColor,
      required this.borderColor,
      required this.radius,
      required this.icon,
      required this.text,
      required this.isLoading});

  @override
  State<CommonImgButtonWidget> createState() => _CommonImgButtonWidgetState();
}

class _CommonImgButtonWidgetState extends State<CommonImgButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: widget.height.h,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(color: widget.borderColor, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius.r))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading!.value) ...[
                SizedBox(
                  height: 15.h,
                  width: 15.h,
                  child: CircularProgressIndicator(
                    backgroundColor: context.onSurfaceColor,
                    color: context.onPrimaryColor,
                    strokeWidth: 2.w,
                  ),
                )
              ] else ...[
                widget.icon,
                SizedBox(
                  width: 5.w,
                ),
                CommonTextWidget(
                  color: widget.fontColor,
                  size: widget.fontSize.sp,
                  text: widget.text,
                  weight: widget.weight,
                  align: TextAlign.start,
                  padding: EdgeInsets.only(top: 5.h),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
