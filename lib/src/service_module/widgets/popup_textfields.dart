// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';

class PopUpTextField extends StatefulWidget {
  String hintText;
  void Function()? onTap = () {};
  final FormFieldValidator<String>? validator;
  TextEditingController controller;
  int maxLines;
  TextInputType type;
  IconData icons;
  PopUpTextField(
      {super.key,
      required this.controller,
      required this.type,
      required this.hintText,
      required this.icons,
      this.onTap,
      this.maxLines = 1,
      this.validator = null});

  @override
  State<PopUpTextField> createState() => _PopUpTextFieldState();
}

class _PopUpTextFieldState extends State<PopUpTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      controller: widget.controller,
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: allColors.popUpTextFieldTextColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
      cursorColor: Theme.of(context).primaryColor,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: widget.type,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(
              right: isArabic ? 0 : 10.h, left: isArabic ? 10.h : 0),
          child: Icon(
            widget.icons,
            color: allColors.textColor,
            size: 12.h,
          ),
        ),
        isDense: true,
        hintText: widget.hintText,
        fillColor: allColors.popUpTextFieldFillColor,
        filled: true,
        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: allColors.popUpTextFieldTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        counterText: '',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1.w, color: allColors.popUpTextFieldBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          borderSide: BorderSide(
              width: 2.w, color: allColors.popUpTextFieldBorderColor),
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 25.h),
        errorStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: allColors.errorColor,
              fontSize: 8.sp,
              fontWeight: FontWeight.w300,
            ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 3,
      ),
      validator: widget.validator,
    );
  }
}
