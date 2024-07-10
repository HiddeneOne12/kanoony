// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/common_widgets/common_topauth_widget.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';

class EmailVerificationBody extends ConsumerStatefulWidget {
  String email;
  EmailVerificationBody({super.key, required this.email});

  @override
  ConsumerState<EmailVerificationBody> createState() =>
      _EmailVerificationBodyState();
}

class _EmailVerificationBodyState extends ConsumerState<EmailVerificationBody> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.forgotPasswordNotifier);
    var provider = ref.read(allProviderList.forgotPasswordNotifier.notifier);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            children: [
              TopAuthWidget(
                isBack: true,
                onTap: () {
                  provider.clearData();
                  RoutesUtils.context.pop();
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.06.sh,
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 25.sp,
                      text: translation.enterCode,
                      weight: FontWeight.w700,
                      padding: noPadding),
                  CommonSizeBoxWidget(height: 5.h, width: 0),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 15.sp,
                      text: translation.enterCodeDes,
                      weight: FontWeight.w300,
                      padding: noPadding),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 16.sp,
                      text: widget.email,
                      weight: FontWeight.w500,
                      padding: EdgeInsets.only(top: 20.h)),
                  CommonSizeBoxWidget(height: 20.h, width: 0),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Pinput(
                      length: 6,
                      obscureText: false,
                      onCompleted: (code) async {
                        FocusScope.of(context).unfocus();
                        if (provider.otpController.text.isNotEmpty) {
                          await provider.sendVerifyEmailRequest(widget.email);
                        } else {
                          showSnackBarMessage(
                              content: "Please enter OTP!",
                              backgroundColor: allColors.errorColor,
                              contentColor: allColors.canvasColor);
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: provider.otpController,
                      obscuringCharacter: '-',
                      defaultPinTheme: PinTheme(
                        width: 30.h,
                        height: 30.h,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: allColors.textColor,
                                fontSize: 22.h),
                        decoration: BoxDecoration(
                          color: allColors.scaffoldColor,
                          border: Border.all(
                              color: allColors.scaffoldColor, width: 2.w),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                  ),
                  CommonSizeBoxWidget(height: 30.h, width: 0),
                  InkWell(
                    onTap: () {
                      provider.sendForgotPasswordRequest(widget.email);
                    },
                    child: CommonTextWidget(
                        color: allColors.blueColor,
                        size: 14.sp,
                        text: variables.isLoading!.value
                            ? 'Please Wait...'
                            : translation.resend,
                        weight: FontWeight.w400,
                        padding: noPadding),
                  ),
                  CommonSizeBoxWidget(height: 0.26.sh, width: 0),
                  CommonButton(
                      isEnabledNotifier: variables.isLoading,
                      padding: EdgeInsets.only(left: 16.h, right: 16.h),
                      height: 46.h,
                      backgroundColor: allColors.primaryColor,
                      text: translation.submit,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: allColors.canvasColor,
                          ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (provider.otpController.text.isNotEmpty) {
                          await provider.sendVerifyEmailRequest(widget.email);
                        } else {
                          showSnackBarMessage(
                              content: "Please enter OTP!",
                              backgroundColor: allColors.errorColor,
                              contentColor: allColors.canvasColor);
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
