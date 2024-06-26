import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_button_widget.dart';
import '../../../../../core/common_widgets/common_sizebox_widget.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/helpers/validators.dart';
import 'widgets/product_or_service_widget.dart';
import 'widgets/select_type_widget.dart';
import '../../../widgets/textfield_widget.dart';
import 'widgets/trademark_type.dart';

class RegisterTradeMarkBody extends ConsumerStatefulWidget {
  const RegisterTradeMarkBody({super.key});

  @override
  ConsumerState<RegisterTradeMarkBody> createState() =>
      _RegisterTradeMarkBodyState();
}

class _RegisterTradeMarkBodyState extends ConsumerState<RegisterTradeMarkBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(allProviderList.tradeMarkProvider.notifier).clearData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.tradeMarkProvider.notifier);
    var trademarkVar = ref.watch(allProviderList.tradeMarkProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: variables.staticData?.registerOrSearchYourTrademark ?? '',
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
                height: 0.795.sh,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                    key: provider.tradeMarkFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectTypeWidget(
                          trademarkVar: trademarkVar,
                          variables: variables,
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text:
                                variables.staticData?.applicantContactDetails ??
                                    '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          controller: provider.nameController,
                          maxLines: 1,
                          type: TextInputType.name,
                          label: variables.staticData?.fullName ?? '',
                          icon: Icons.person,
                          validator: TextFieldValidator.validateText,
                          focusNode: provider.nameFocus,
                        ),
                        TextFieldWidget(
                          controller: provider.emailController,
                          maxLines: 1,
                          type: TextInputType.emailAddress,
                          label: variables.staticData?.email ?? '',
                          icon: Icons.email,
                          validator: TextFieldValidator.validateEmail,
                          focusNode: provider.emailFocus,
                        ),
                        TextFieldWidget(
                          controller: provider.phoneController,
                          maxLines: 1,
                          type: TextInputType.phone,
                          label: variables.staticData?.mobileNumber ?? '',
                          icon: Icons.phone,
                          validator: TextFieldValidator.validatePhone,
                          focusNode: provider.phoneFocus,
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables.staticData?.trademarkOwner ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          controller: provider.ownerController,
                          maxLines: 1,
                          type: TextInputType.none,
                          onTap: () {
                            provider.showPopupMenu();
                          },
                          label: variables.staticData?.trademarkOwner ?? '',
                          icon: Icons.keyboard_arrow_down,
                          validator: TextFieldValidator.validateText,
                          focusNode: FocusNode(),
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables.staticData?.designatedCountry ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          controller: provider.countryController,
                          maxLines: 1,
                          type: TextInputType.none,
                          onTap: () {
                            provider.showCountryPickerPopup();
                          },
                          label: variables.staticData?.designatedCountry ?? '',
                          icon: Icons.keyboard_arrow_down,
                          validator: TextFieldValidator.validateText,
                          focusNode: FocusNode(),
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables.staticData?.trademarkName ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          controller: provider.trademarkNameController,
                          maxLines: 1,
                          type: TextInputType.text,
                          label: variables.staticData?.trademarkName ?? '',
                          icon: Icons.edit,
                          validator: TextFieldValidator.validateText,
                          focusNode: provider.trademarkNameFocus,
                        ),
                        ProductOrServiceWidget(
                          trademarkVar: trademarkVar,
                          variables: variables,
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables.staticData?.trademarkType ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TradeMarkTypeWidget(
                          trademarkVar: trademarkVar,
                          variables: variables,
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables.staticData?.attachFile ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          onTap: () {
                            provider.pickAttachment();
                          },
                          controller: provider.attachmentController,
                          maxLines: 1,
                          type: TextInputType.none,
                          label: variables.staticData?.attachFile ?? '',
                          icon: Icons.attachment,
                          // validator: TextFieldValidator.validateText,
                          focusNode: FocusNode(),
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            text: variables
                                    .staticData?.describeYourProductOrService ??
                                '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 5.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.w : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          height: 80.h,
                          readOnly: false,
                          controller: provider.messageController,
                          maxLines: 4,
                          type: TextInputType.text,
                          label: variables.staticData?.message ?? '',
                          icon: Icons.message,
                          focusNode: provider.messageFocus,
                        ),
                        CommonSizeBoxWidget(height: 10.h, width: 0),
                        CommonButton(
                            loadingNotifier: trademarkVar.isLoading,
                            height: 40.h,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: allColors.canvasColor),
                            backgroundColor: allColors.primaryColor,
                            text: variables.staticData?.submit ?? '',
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (provider.tradeMarkFormKey.currentState!
                                  .validate()) {
                                await provider.sendRequest();
                              }
                            }),
                        CommonSizeBoxWidget(height: 10.h, width: 0),
                      ],
                    ),
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
