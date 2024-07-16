import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_button_widget.dart';
import '../../../../../core/common_widgets/common_sizebox_widget.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/constants/values.dart';
import '../../../../../core/helpers/pascal_case_converter.dart';
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
                        SizedBox(height: 30.h),
                        Padding(
                          padding: kHeadlineBottomPadding,
                          child: Align(
                            child: Text(
                              variables
                                      .staticData?.registerOrSearchYourTrademark
                                      .upperCase() ??
                                  '',
                              style: context.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SelectTypeWidget(
                          trademarkVar: trademarkVar,
                          variables: variables,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.applicantContactDetails ??
                                    ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.trademarkOwner ?? ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          readOnly: true,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.designatedCountry ?? ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          readOnly: true,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.trademarkName ?? ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.trademarkType ?? ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TradeMarkTypeWidget(
                          trademarkVar: trademarkVar,
                          variables: variables,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(
                                variables.staticData?.attachFile ?? ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldWidget(
                          readOnly: true,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Text(
                            capitalizeFirst(variables
                                    .staticData?.describeYourProductOrService ??
                                ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
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
                            padding: kLeftRightPadding16,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: context.onPrimaryColor),
                            backgroundColor: context.primaryColor,
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
