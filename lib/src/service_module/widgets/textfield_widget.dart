// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class TextFieldWidget extends StatefulWidget {
  String label;
  TextEditingController controller;
  IconData icon;
  int maxLines;
  TextInputType type;
  FocusNode focusNode;
  final height;
  bool readOnly;
  void Function()? onTap = () {};
  final FormFieldValidator<String>? validator;
  TextFieldWidget(
      {super.key,
      required this.controller,
      this.height = null,
      this.readOnly = false,
      this.onTap,
      required this.focusNode,
      required this.type,
      this.validator = null,
      required this.maxLines,
      required this.icon,
      required this.label});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 10.h),
      child: InkWell(
        onTap: () {
          widget.focusNode.requestFocus();
        },
        child: Container(
          alignment: Alignment.topCenter,
          height: widget.height,
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
              color: allColors.canvasColor,
              border: Border.all(color: allColors.canvasColor),
              borderRadius: BorderRadius.all(Radius.circular(6.r))),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                        color: allColors.blackColor,
                        size: 13.sp,
                        text: widget.label,
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 5.h, bottom: 3.h)),
                    TextFormField(
                      controller: widget.controller,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: allColors.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                      cursorColor: Theme.of(context).primaryColor,
                      onTap: widget.onTap,
                      readOnly: widget.readOnly,
                      scrollPadding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 20.h),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.disabled,
                      keyboardType: widget.type,
                      focusNode: widget.focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: '',
                        fillColor: allColors.canvasColor,
                        filled: true,
                        hintStyle:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: allColors.blackColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 0.h),
                        counterText: '',
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide.none),
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
              Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h),
                child: Icon(
                  widget.icon,
                  color: allColors.primaryColor,
                  size: 16.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
