import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/common_textfield_widget.dart';
import 'package:kanoony/core/common_widgets/common_topauth_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/core/routing/routing_config.dart';

class ForgotPasswordBody extends ConsumerStatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  ConsumerState<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends ConsumerState<ForgotPasswordBody> {
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
                  key: provider.forgotPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 25.sp,
                          text: 'FORGOT PASSWORD',
                          weight: FontWeight.w700,
                          padding: noPadding),
                      CommonSizeBoxWidget(height: 30.h, width: 0),
                      CommonTextField(
                        focusNode: provider.emailNode,
                        textEditingController: provider.emailController,
                        hintText: translation.enterEmail,
                        labelText: translation.email,
                        validator: TextFieldValidator.validateEmail,
                        icon: Icon(
                          Icons.email_outlined,
                          size: 14.h,
                          color: allColors.canvasColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CommonButton(
                          loadingNotifier: variables.isLoading,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          height: 46.h,
                          text: translation.next,
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
                            if (provider.forgotPasswordFormKey.currentState!
                                .validate()) {
                              await provider.sendForgotPasswordRequest(
                                  provider.emailController.text);
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
