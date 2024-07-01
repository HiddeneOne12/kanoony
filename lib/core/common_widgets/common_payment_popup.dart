// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/core/routing/routing_config.dart';

paymentPopUp(context, WidgetRef ref, data, bool isGuest, String selectedValue,
    bool isPackage) {
  var provider = ref.read(allProviderList.paidDocProvider.notifier);
  var package = ref.read(allProviderList.packageProvider.notifier);

  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: allColors.popUpColor,
          surfaceTintColor: allColors.popUpColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.r,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(0.h),
          titlePadding: EdgeInsets.only(top: 0.h, bottom: 0.h),
          content: SizedBox(
            height: 0.44.sh,
            child: Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: StatefulBuilder(builder: (context, setState) {
                return Stack(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 150.h,
                    ),
                    child: Image.asset(
                      PngImagePaths.authDesignImg,
                      height: 214.65.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 18.sp,
                      text: 'BEFORE YOU CONTINUE',
                      weight: FontWeight.w700,
                      padding: EdgeInsets.only(
                          top: 20.h,
                          left: isArabic ? 0 : 20.h,
                          right: isArabic ? 20.h : 0)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic ? 0 : 0.7.sw,
                        top: 12.h,
                        right: isArabic ? 0.7.sw : 0),
                    child: InkWell(
                        onTap: () {
                          selectedValue = '';

                          if (isPackage) {
                            package.emailController.clear();
                            package.nameController.clear();
                            package.cardFieldController = CardEditController();
                          } else {
                            provider.emailController.clear();
                            provider.nameController.clear();
                            provider.cardFieldController = CardEditController();
                          }

                          formKey.currentState!.reset();
                          RoutesUtils.context.pop();
                        },
                        child: Icon(
                          Icons.close,
                          size: 20.h,
                          color: allColors.textColor,
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.h, right: 20.h, top: 0.09.sh),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isPackage) ...[
                              CommonTextWidget(
                                  color: allColors.textColor,
                                  size: 20.sp,
                                  text: data.title,
                                  align: TextAlign.center,
                                  weight: FontWeight.w700,
                                  maxLine: 5,
                                  padding:
                                      EdgeInsets.only(left: 0.h, right: 0.h)),
                              SizedBox(
                                height: 10.h,
                              ),
                              CommonTextWidget(
                                  color: allColors.primaryColor,
                                  align: TextAlign.center,
                                  size: 18.sp,
                                  text: "${data.price} AED + VAT",
                                  weight: FontWeight.w900,
                                  padding:
                                      EdgeInsets.only(left: 0.h, right: 0.h)),
                            ] else ...[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: SizedBox(
                                      height: 35.h,
                                      width: 35.h,
                                      child: SvgPicture.asset(
                                          SvgImagesAssetPath.documentSvg),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: CommonTextWidget(
                                        color: allColors.textColor,
                                        size: 14.sp,
                                        text: data.title,
                                        align: TextAlign.start,
                                        weight: FontWeight.w700,
                                        maxLine: 5,
                                        padding: EdgeInsets.only(
                                            left: 0.h, right: 0.h)),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    flex: 1,
                                    child: CommonTextWidget(
                                        color: allColors.primaryColor,
                                        align: TextAlign.start,
                                        size: 14.sp,
                                        text: data.documentPrice == "0"
                                            ? "FREE"
                                            : "${data.documentPrice} AED",
                                        weight: FontWeight.w900,
                                        padding: EdgeInsets.only(
                                            left: 0.h, right: 0.h)),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ],
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              validator: TextFieldValidator.validateText,
                              enableSuggestions: false,
                              controller: isPackage
                                  ? package.nameController
                                  : provider.nameController,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: allColors.textColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                              cursorColor: Theme.of(context).primaryColor,
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          1.sh),
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.done,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: isArabic ? 0 : 10.h,
                                      left: isArabic ? 10.h : 0),
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    color: allColors.textColor,
                                    size: 12.h,
                                  ),
                                ),
                                isDense: true,
                                hintText: 'Card Holder Name',
                                fillColor: allColors.popUpTextFieldFillColor,
                                filled: true,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: allColors.popUpTextFieldTextColor,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 15.h),
                                counterText: '',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: allColors
                                            .popUpTextFieldBorderColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 2.w,
                                      color:
                                          allColors.popUpTextFieldBorderColor),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error)),
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 25.h),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                                errorMaxLines: 3,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (isGuest) ...[
                              TextFormField(
                                validator: TextFieldValidator.validateEmail,
                                //  textAlign: widget._textAlign,

                                enableSuggestions: false,

                                controller: isPackage
                                    ? package.emailController
                                    : provider.emailController,
                                //  maxLength: widget.textFieldMaxLength,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: allColors.textColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                cursorColor: Theme.of(context).primaryColor,
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom +
                                        1.sh),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.name,

                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        right: isArabic ? 0 : 10.h,
                                        left: isArabic ? 10.h : 0),
                                    child: Icon(
                                      Icons.email,
                                      color: allColors.textColor,
                                      size: 12.h,
                                    ),
                                  ),
                                  isDense: true,
                                  hintText: 'Card Holder Email',
                                  fillColor: allColors.popUpTextFieldFillColor,
                                  filled: true,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color:
                                            allColors.popUpTextFieldTextColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 15.h),
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
                                          color: allColors
                                              .popUpTextFieldBorderColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 2.w,
                                        color: allColors
                                            .popUpTextFieldBorderColor),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error)),
                                  suffixIconConstraints:
                                      BoxConstraints(maxHeight: 25.h),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 1.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                                  ),
                                  errorMaxLines: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                            CardField(
                              dangerouslyGetFullCardDetails: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: allColors.textColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.h, left: 10.h),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: allColors.textColor,
                                    size: 12.h,
                                  ),
                                ),
                                isDense: true,
                                hintText: 'Card Number',
                                fillColor: allColors.popUpTextFieldFillColor,
                                filled: true,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: allColors.popUpTextFieldTextColor,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 15.h),
                                counterText: '',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.w,
                                        color: allColors
                                            .popUpTextFieldBorderColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 2.w,
                                      color:
                                          allColors.popUpTextFieldBorderColor),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error)),
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 25.h),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 1.0,
                                      color:
                                          Theme.of(context).colorScheme.error),
                                ),
                                errorMaxLines: 3,
                              ),
                              controller: isPackage
                                  ? package.cardFieldController
                                  : provider.cardFieldController,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CommonButton(
                                isEnabledNotifier: isLoading,
                                height: 35.h,
                                backgroundColor: allColors.primaryColor,
                                borderSides:
                                    BorderSide(color: allColors.primaryColor),
                                radius: 4.r,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: allColors.canvasColor),
                                text: isLoading.value
                                    ? "PLEASE WAIT..."
                                    : 'PAY NOW',
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();

                                  if (isPackage) {
                                    if (formKey.currentState!.validate() &&
                                        package.cardFieldController.details
                                                .number ==
                                            '4242424242424242') {
                                      setState(() {
                                        isLoading.value = true;
                                      });
                                      await package.sendSubscribePackageRequest(
                                          int.parse(data.packgeId), isGuest);
                                      setState(() {
                                        isLoading.value = false;
                                      });
                                    }
                                  } else {
                                    if (formKey.currentState!.validate() &&
                                        provider.cardFieldController.details
                                                .number ==
                                            '4242424242424242') {
                                      setState(() {
                                        isLoading.value = true;
                                      });
                                      await provider.sendDownloadPaidDocRequest(
                                          int.parse(data.id),
                                          selectedValue,
                                          isGuest);
                                      setState(() {
                                        isLoading.value = false;
                                      });
                                    }
                                  }
                                  formKey.currentState!.reset();
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ]);
              }),
            ),
          ),
        );
      });
}
