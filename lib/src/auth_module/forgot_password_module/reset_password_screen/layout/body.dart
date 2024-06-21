// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/common_topauth_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/core/routing/routing_config.dart';


import '../../../../../core/common_widgets/common_textfield_widget.dart';

class ResetPasswordBody extends ConsumerStatefulWidget {
  String email;
  ResetPasswordBody({super.key, required this.email});

  @override
  ConsumerState<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends ConsumerState<ResetPasswordBody> {
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
          child: Stack(
            children: [
              TopAuthWidget(
                isBack: true,
                onTap: () {
                  provider.clearData();
                  RoutesUtils.context.pop();
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.37.sh),
                child: Form(
                  key: provider.resetPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 25.sp,
                          text: translation.resetPassword,
                          weight: FontWeight.w700,
                          padding: noPadding),
                      CommonSizeBoxWidget(height: 30.h, width: 0),
                      CommonTextField(
                        focusNode: provider.passwordNode,
                        textEditingController: provider.passwordController,
                        hintText: translation.enterPassword,
                        isHidden: variables.obscureText,
                        labelText: translation.password,
                        validator: TextFieldValidator.validatePassword,
                        icon: InkWell(
                            onTap: () {
                              setState(() {
                                variables.obscureText = !variables.obscureText;
                              });
                            },
                            child: variables.obscureText
                                ? Icon(
                                    Icons.lock_outline,
                                    size: 14.h,
                                    color: allColors.canvasColor,
                                  )
                                : Icon(
                                    Icons.lock_open_rounded,
                                    size: 14.h,
                                    color: allColors.canvasColor,
                                  )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextField(
                        focusNode: provider.confirmPasswordNode,
                        isHidden: variables.obscureText2,
                        textEditingController:
                            provider.confirmPasswordController,
                        hintText: translation.enterConfirmPassword,
                        labelText: translation.confirmPassword,
                        validator: (val) =>
                            TextFieldValidator.validateConfirmPassword(
                                val, provider.passwordController.text),
                        icon: InkWell(
                            onTap: () {
                              setState(() {
                                variables.obscureText2 =
                                    !variables.obscureText2;
                              });
                            },
                            child: variables.obscureText2
                                ? Icon(
                                    Icons.lock_outline,
                                    size: 14.h,
                                    color: allColors.canvasColor,
                                  )
                                : Icon(
                                    Icons.lock_open_rounded,
                                    size: 14.h,
                                    color: allColors.canvasColor,
                                  )),
                      ),
                      SizedBox(height: 10.h),
                      CommonButton(
                          isEnabledNotifier: variables.isLoading,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          height: 46.h,
                          backgroundColor: allColors.primaryColor,
                          text: translation.updatePassword,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                                color: allColors.canvasColor,
                              ),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (provider.resetPasswordFormKey.currentState!
                                .validate()) {
                              await provider.sendResetPasswordRequest(widget.email);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
