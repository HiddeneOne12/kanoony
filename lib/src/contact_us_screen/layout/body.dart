import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/common_widgets/common_sizebox_widget.dart';
import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/image_paths/image_paths.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: 'CONTACT US',
            subText: '',
            height: 0.16,
            isBack: true,
            isBlogTextField: false,
            isFilter: false,
            isButton: false,
            isTextfield: false,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.3.sw),
                child: Image.asset(
                  PngImagePaths.dashboardDesignImg,
                  height: 326.65.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 620.h,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 5.h),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: allColors.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.r))),
                                      height: 43.h,
                                      width: 43.w,
                                      child: Icon(
                                        Icons.call,
                                        size: 18.h,
                                        color: allColors.canvasColor,
                                      )),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 19.sp,
                                          text: 'Phone Number',
                                          weight: FontWeight.w500,
                                          padding: EdgeInsets.only(
                                              left: 5.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 0.h)),
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 15.sp,
                                          text: '+971547744466',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 5.h,
                                              right: 16.h,
                                              top: 0.h,
                                              bottom: 0.h)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 5.h),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: allColors.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.r))),
                                      height: 43.h,
                                      width: 43.w,
                                      child: Icon(
                                        Icons.email,
                                        size: 18.h,
                                        color: allColors.canvasColor,
                                      )),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 19.sp,
                                          text: 'Email Address',
                                          weight: FontWeight.w500,
                                          padding: EdgeInsets.only(
                                              left: 5.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 0.h)),
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 15.sp,
                                          text: 'abd@gmai.com',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 5.h,
                                              right: 16.h,
                                              top: 0.h,
                                              bottom: 0.h)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 18.sp,
                          text: 'LEAVE A MESSAGE',
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 0.91.sw),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                          height: 1.h,
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'First Name*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 1,

                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                20.h),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter Full Name',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.person,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Last Name*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                20.h),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter Last Name',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.person,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Phone*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                20.h),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.phone,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Phone Number',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.call,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Email*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                1.sh),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter Email',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.email,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Subject*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                20.h),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter Subject',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.settings,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 72.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Comment*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 3.h)),
                                      TextFormField(
                                        // textAlign: widget._textAlign,
                                        // enabled: widget.enabled,
                                        // enableSuggestions: false,
                                        // focusNode:
                                        //     widget.focusNode == null ? null : widget.focusNode!,
                                        controller: TextEditingController(),
                                        //    maxLength: widget.textFieldMaxLength,
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: allColors.blackColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                20.h),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,

                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Enter Comment',
                                          fillColor: allColors.canvasColor,
                                          filled: true,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                color: allColors.blackColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 0.h),
                                          counterText: '',
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r)),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.w,
                                                  color: allColors.canvasColor),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.r))),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.r)),
                                            borderSide: BorderSide(
                                                width: 2.w,
                                                color: allColors.canvasColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.r)),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          suffixIconConstraints:
                                              BoxConstraints(maxHeight: 25.h),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.r)),
                                            borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                          errorMaxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.message,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: InkWell(
                          child: Container(
                            height: 41.h,
                            decoration: BoxDecoration(
                                color: allColors.canvasColor,
                                border:
                                    Border.all(color: allColors.canvasColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonTextWidget(
                                          color: allColors.blackColor,
                                          size: 10.sp,
                                          text: 'Attach File*',
                                          weight: FontWeight.w700,
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              right: 16.h,
                                              top: 5.h,
                                              bottom: 0.h)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, right: 16.h),
                                  child: Icon(
                                    Icons.attachment,
                                    color: allColors.primaryColor,
                                    size: 13.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonButton(
                          //   loadingNotifier: variables.isLoadingButton,
                          height: 40.h,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: allColors.canvasColor),
                          backgroundColor: allColors.textColor,
                          text: 'SUBMIT',
                          onPressed: () async {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
