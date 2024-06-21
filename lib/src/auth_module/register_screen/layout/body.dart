// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/common_textfield_widget.dart';
import 'package:kanoony/core/common_widgets/common_topauth_widget.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/auth_module/login_screen/login_screen.dart';

import '../../../../core/constants/object_constants/object_constants.dart';

class RegisterBody extends ConsumerStatefulWidget {
  const RegisterBody({super.key});

  @override
  ConsumerState<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends ConsumerState<RegisterBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await  ref.read(allProviderList.registerProvider.notifier).clearData();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var registerProvider = ref.read(allProviderList.registerProvider.notifier);
    var registerVariable = ref.watch(allProviderList.registerProvider);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Stack(
            children: [
              TopAuthWidget(
                top: 0.16,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.3.sh),
                child: Form(
                  key: registerProvider.registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 25.sp,
                          text: translation.createAccount,
                          weight: FontWeight.w700,
                          padding: EdgeInsets.only(top: 0.h)),
                      CommonSizeBoxWidget(height: 0.07.sh, width: 0),
                      CommonTextField(
                        focusNode: registerProvider.nameNode,
                        textEditingController: registerProvider.nameController,
                        hintText: translation.enterFullName,
                        labelText: translation.fullName,
                        validator: TextFieldValidator.validateText,
                        icon: Icon(
                          Icons.person_outline,
                          size: 14.h,
                          color: allColors.canvasColor,
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonTextField(
                        focusNode: registerProvider.emailNode,
                        textEditingController: registerProvider.emailController,
                        hintText: translation.enterEmail,
                        validator: TextFieldValidator.validateEmail,
                        labelText: translation.email,
                        icon: Icon(
                          Icons.email_outlined,
                          size: 14.h,
                          color: allColors.canvasColor,
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonTextField(
                        focusNode: registerProvider.numberNode,
                        inputType: TextInputType.phone,
                        textEditingController: registerProvider.phoneController,
                        hintText: translation.enterMobile,
                        labelText: translation.mobileNumber,
                        validator: TextFieldValidator.validatePhone,
                        icon: Icon(
                          Icons.phone_outlined,
                          size: 14.h,
                          color: allColors.canvasColor,
                        ),
                      ),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonTextField(
                        focusNode: registerProvider.passwordNode,
                        validator: TextFieldValidator.validatePassword,
                        textEditingController:
                            registerProvider.passwordController,
                        hintText: translation.enterPassword,
                        labelText: translation.password,
                        isHidden: registerVariable.obscureText,
                        icon: InkWell(
                            onTap: () {
                              setState(() {
                                registerVariable.obscureText =
                                    !registerVariable.obscureText;
                              });
                            },
                            child: registerVariable.obscureText
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
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonTextField(
                        focusNode: registerProvider.confirmPasswordNode,
                        textEditingController:
                            registerProvider.confirmPasswordController,
                        validator: (val) =>
                            TextFieldValidator.validateConfirmPassword(
                                val, registerProvider.passwordController.text),
                        hintText: translation.enterConfirmPassword,
                        labelText: translation.confirmPassword,
                        isHidden: registerVariable.obscureText2,
                        icon: InkWell(
                            onTap: () {
                              setState(() {
                                registerVariable.obscureText2 =
                                    !registerVariable.obscureText2;
                              });
                            },
                            child: registerVariable.obscureText2
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
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonButton(
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          height: 46.h,
                          loadingNotifier: registerVariable.isLoading,
                          text: translation.signUp,
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
                            if (registerProvider.registerFormKey.currentState!
                                .validate()) {
                              await registerProvider.sendRequest();
                            }
                          }),
                      CommonSizeBoxWidget(height: 0.035.sh, width: 0),
                      TextButton(
                        onPressed: () {
                          RoutesUtils.context
                              .pushReplacement(LoginScreen.loginRoute);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: translation.alreadyAccount,
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
                                text: translation.login,
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
