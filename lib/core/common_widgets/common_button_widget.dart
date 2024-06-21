// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final String? subText;
  final TextStyle? style;
  final double _height;
  Color? backgroundColor = allColors.textColor;
  final BorderSide? borderSides;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loadingNotifier;
  final ValueNotifier<bool> _isEnabledNotifier;
  final EdgeInsets _padding;
  final double radius;
  bool isGoogle;

  CommonButton(
      {Key? key,
      required this.text,
      this.isGoogle = false,
      this.style,
      this.backgroundColor,
      this.borderSides,
      required this.onPressed,
      this.loadingNotifier,
      this.radius = 8,
      ValueNotifier<bool>? isEnabledNotifier,
      EdgeInsets? padding,
      double? height,
      this.subText})
      : _isEnabledNotifier = isEnabledNotifier ?? ValueNotifier(true),
        _padding = padding ?? EdgeInsets.zero,
        _height = height ?? 50.h,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loadingNotifier == null) {
      return Container(
        height: _height,
        padding: _padding,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor,
              side: borderSides,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius.r)),
              )),
          child: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              text,
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: _padding,
      height: _height,
      child: ValueListenableBuilder<bool>(
          valueListenable: _isEnabledNotifier,
          builder: (context, isEnabled, child) {
            return ValueListenableBuilder<bool>(
                valueListenable: loadingNotifier!,
                builder: (context, isLoading, child) {
                  return ElevatedButton(
                    onPressed: shouldButtonBeEnabled(isEnabled, isLoading)
                        ? onPressed
                        : () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: backgroundColor,
                        side: borderSides),
                    child: (isLoading)
                        ? CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).scaffoldBackgroundColor))
                        : Text(
                            text,
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(height: 1.5),
                          ),
                  );
                });
          }),
    );
  }

  bool shouldButtonBeEnabled(bool isEnabled, bool isLoading) =>
      isEnabled && !isLoading;
}
