// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? labelText;
  final String? helperText;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enabled;
  final bool? isHidden;
  Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? textFieldMaxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapSuffix;
  final VoidCallback? onTap;
  final TextCapitalization? textCapitalization;
  String? errorText;
  final TextAlign _textAlign;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? appInputFormatters;
  final int? textFieldMaxLines;
  final EdgeInsetsGeometry? textFieldPadding;
  final Widget icon;
  final bool isProfile;
  bool readOnly;
  final FormFieldValidator<String>? validator;
  EdgeInsets padding;

  CommonTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.validator = null,
      this.readOnly = false,
      this.helperText,
      this.isProfile = false,
      this.isHidden,
      this.enabled,
      this.onChanged,
      this.onTapSuffix,
      this.padding = const EdgeInsets.only(left: 16, right: 16),
      this.icon = const SizedBox(),
      this.onTap,
      required this.focusNode,
      this.textCapitalization,
      this.textFieldMaxLength,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.autofocus,
      this.errorText,
      this.inputType,
      this.inputAction,
      this.appInputFormatters,
      this.textFieldMaxLines,
      this.textFieldPadding,
      TextAlign? textAlign})
      : _textAlign = textAlign ?? TextAlign.start,
        super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  //

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: InkWell(
        onTap: () {
          widget.focusNode!.requestFocus();
        },
        child: Container(
          padding: EdgeInsets.only(
              top: widget.isProfile ? 5.h : 10.h,
              bottom: widget.isProfile ? 5.h : 10.h),
          decoration: BoxDecoration(
              color: widget.isProfile
                  ? allColors.canvasColor
                  : allColors.textFieldColor,
              border: Border.all(
                  color: widget.isProfile
                      ? allColors.buttonBorderColor
                      : allColors.textFieldColor),
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.isProfile ? 4.r : 6.r))),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                        color: allColors.textColor,
                        size: 10.sp,
                        text: widget.labelText!,
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(
                            left: 16.h,
                            right: 16.h,
                            top: widget.isProfile ? 5.h : 10.h,
                            bottom: 5.h)),
                    TextFormField(
                      readOnly: widget.readOnly,
                      textAlign: widget._textAlign,
                      enabled: widget.enabled,
                      enableSuggestions: false,
                      focusNode: widget.focusNode!,
                      controller: widget.textEditingController,
                      maxLength: widget.textFieldMaxLength,
                      maxLines: widget.textFieldMaxLines ?? 1,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: allColors.textColor,
                            fontSize: widget.isProfile ? 13.sp : 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                      cursorColor: Theme.of(context).primaryColor,
                      scrollPadding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 20.h),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      textCapitalization:
                          widget.textCapitalization ?? TextCapitalization.none,
                      textInputAction:
                          widget.inputAction ?? TextInputAction.done,
                      autovalidateMode: AutovalidateMode.disabled,
                      keyboardType: widget.inputType,
                      inputFormatters: widget.appInputFormatters ??
                          [
                            // FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                      autofocus:
                          widget.autofocus == null ? false : widget.autofocus!,
                      onChanged: (text) {
                        widget.onChanged?.call(text);

                        setState(() {});
                      },
                      onTap: widget.onTap,
                      obscureText:
                          widget.isHidden != null ? widget.isHidden! : false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: widget.hintText,
                        fillColor: widget.isProfile
                            ? allColors.canvasColor
                            : allColors.textFieldColor,
                        filled: true,
                        hintStyle:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: allColors.greyTextColor,
                                  fontSize: widget.isProfile ? 13.sp : 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 0.h),
                        counterText: '',
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        errorStyle:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: allColors.errorColor,
                                  fontSize: widget.isProfile ? 10.sp : 8.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        suffixIconConstraints: BoxConstraints(maxHeight: 25.h),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide.none,
                        ),
                        errorMaxLines: 3,
                      ),
                      validator: widget.validator,
                    ),
                  ],
                ),
              ),
              if (!widget.isProfile) ...[
                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 16.h),
                  child: Container(
                      decoration: BoxDecoration(
                          color: allColors.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r))),
                      height: 32.h,
                      width: 32.w,
                      child: widget.icon),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool shouldShowBlueColor() =>
      isFocused || widget.textEditingController.text.isNotEmpty;

  bool shouldShowLabel() => widget.textEditingController.text.isNotEmpty;
}
