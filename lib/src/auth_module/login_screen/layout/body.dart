// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_img_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/common_textfield_widget.dart';
import 'package:kanoony/core/common_widgets/common_topauth_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/fogot_password_screen/forgot_password_screen.dart';
import 'package:kanoony/src/auth_module/register_screen/register_screen.dart';

class LoginBody extends ConsumerStatefulWidget {
  const LoginBody({super.key});

  @override
  ConsumerState<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(allProviderList.loginProvider.notifier).clearData();
      Future.delayed(const Duration(seconds: 2), () {
        ref.read(allProviderList.loginProvider.notifier).loadSavedLogin();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var loginProvider = ref.read(allProviderList.loginProvider.notifier);
    var loginVariable = ref.watch(allProviderList.loginProvider);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Stack(
            children: [
              TopAuthWidget(),
              Padding(
                padding: EdgeInsets.only(top: 0.36.sh),
                child: Form(
                  key: loginProvider.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 25.sp,
                          text: translation.login,
                          weight: FontWeight.w700,
                          padding: noPadding),
                      CommonSizeBoxWidget(height: 30.h, width: 0),
                      CommonTextField(
                        focusNode: loginProvider.emailNode,
                        textEditingController: loginProvider.emailController,
                        hintText: translation.enterEmail,
                        labelText: translation.email,
                        validator: TextFieldValidator.validateEmail,
                        icon: Icon(
                          Icons.email_outlined,
                          size: 14.h,
                          color: allColors.canvasColor,
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonTextField(
                        focusNode: loginProvider.passwordNode,
                        textEditingController: loginProvider.passwordController,
                        hintText: translation.enterPassword,
                        labelText: translation.password,
                        isHidden: loginVariable.obscureText,
                        validator: TextFieldValidator.validateText,
                        icon: InkWell(
                            onTap: () {
                              setState(() {
                                loginVariable.obscureText =
                                    !loginVariable.obscureText;
                              });
                            },
                            child: loginVariable.obscureText
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
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  loginVariable.rememberMe =
                                      !loginVariable.rememberMe;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 7),
                                  height: 19.h,
                                  width: 21.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: allColors.textColor,
                                          width: 1.w),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r))),
                                  child: loginVariable.rememberMe
                                      ? Icon(
                                          Icons.check,
                                          size: 14.h,
                                          color: allColors.textColor,
                                        )
                                      : null),
                            ),
                            CommonSizeBoxWidget(height: 0, width: 10.w),
                            CommonTextWidget(
                                color: allColors.blackColor,
                                size: 16,
                                text: translation.rememberMe,
                                weight: FontWeight.w500,
                                padding: noPadding),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                RoutesUtils.context.push(
                                    ForgotPasswordScreen.forgotPasswordRoute);
                              },
                              child: CommonTextWidget(
                                  color: allColors.blueColor,
                                  size: 16,
                                  text: translation.forgotPassword,
                                  weight: FontWeight.w500,
                                  padding: noPadding),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CommonButton(
                          loadingNotifier: loginVariable.isLoading,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          height: 46.h,
                          text: translation.signIn,
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
                            if (loginProvider.loginFormKey.currentState!
                                .validate()) {
                              await loginProvider.sendRequest();
                            }
                          }),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonImgButtonWidget(
                          fontColor: allColors.textColor,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          height: 46,
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            await loginProvider.googleSignIn();
                          },
                          backgroundColor: allColors.canvasColor,
                          borderColor: allColors.textColor,
                          radius: 8,
                          icon: SizedBox(
                            height: 26.h,
                            width: 26.h,
                            child: Image.asset(
                              PngImagePaths.googleImg,
                            ),
                          ),
                          text: translation.googleSignIn,
                          isLoading: loginVariable.isGoogleLoading!),
                      CommonSizeBoxWidget(height: 0.15.sh, width: 0),
                      TextButton(
                        onPressed: () {
                          RoutesUtils.context
                              .pushReplacement(RegisterScreen.registerRoute);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "${translation.dontHaveAccount} ",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: allColors.textColor,
                                ),
                            children: [
                              TextSpan(
                                text: translation.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      color: allColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
