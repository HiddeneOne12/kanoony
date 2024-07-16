import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_drop_down.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_button_widget.dart';
import '../../../../../core/common_widgets/common_sizebox_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/constants/values.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../widgets/textfield_widget.dart';
import 'widgets/select_type_widget.dart';

class RegisterWillFormBody extends ConsumerStatefulWidget {
  const RegisterWillFormBody({super.key});

  @override
  ConsumerState<RegisterWillFormBody> createState() =>
      _RegisterWillFormBodyState();
}

class _RegisterWillFormBodyState extends ConsumerState<RegisterWillFormBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(allProviderList.willProvider.notifier).clearData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.willProvider.notifier);
    var willVar = ref.watch(allProviderList.willProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: variables.staticData?.submitAction ?? '',
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
                    key: provider.willFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Padding(
                          padding: kLeftRightPadding16,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              variables.staticData?.submitAction!
                                      .toUpperCase() ??
                                  '',
                              style: context.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.h,
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
                          height: 80.h,
                          readOnly: false,
                          controller: provider.addressController,
                          maxLines: 4,
                          type: TextInputType.text,
                          label: variables.staticData?.fullAddress ?? '',
                          icon: Icons.message,
                          focusNode: provider.addressFocus,
                        ),
                        CommonDropDown(
                          list: willVar.statusList,
                          selectedValue: provider.statusController.text.isEmpty
                              ? null
                              : provider.statusController.text,
                          onTextChanged: (p0) {
                            provider.statusController.text = p0 ?? "";
                            setState(() {});
                          },
                          hintText:
                              variables.staticData?.martialStatus ?? "Select",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonDropDown(
                          list: willVar.numberList,
                          selectedValue:
                              provider.childrenController.text.isEmpty
                                  ? null
                                  : provider.childrenController.text,
                          onTextChanged: (p0) {
                            provider.childrenController.text = p0 ?? "";
                            setState(() {});
                          },
                          hintText:
                              variables.staticData?.minorChildren ?? "Select",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // TextFieldWidget(
                        //   controller: provider.childrenController,
                        //   maxLines: 1,
                        //   type: TextInputType.none,
                        //   onTap: () {
                        //     provider.showNumberPopupMenu(true);
                        //   },
                        //   label: variables.staticData?.minorChildren ?? '',
                        //   icon: Icons.keyboard_arrow_down,
                        //   validator: TextFieldValidator.validateText,
                        //   focusNode: FocusNode(),
                        // ),
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
                        TextFieldWidget(
                          controller: provider.executerNameController,
                          maxLines: 1,
                          type: TextInputType.text,
                          label: variables.staticData?.executorName ?? '',
                          icon: Icons.edit,
                          validator: TextFieldValidator.validateText,
                          focusNode: provider.executorNameFocus,
                        ),
                        TextFieldWidget(
                          onTap: () {
                            provider.showNumberPopupMenu(false);
                          },
                          controller: provider.beneficialController,
                          maxLines: 1,
                          type: TextInputType.none,
                          label: variables.staticData?.numberOfBeneficial ?? '',
                          icon: Icons.keyboard_arrow_down,
                          validator: TextFieldValidator.validateText,
                          focusNode: FocusNode(),
                        ),
                        ListView.builder(
                          itemCount: willVar.controllerList.length,
                          padding: EdgeInsets.all(0.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = willVar.controllerList[index];
                            return Row(
                              children: [
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: data.name!,
                                    maxLines: 1,
                                    type: TextInputType.text,
                                    label: '${index + 1} Beneficiary Name',
                                    icon: Icons.edit,
                                    validator: TextFieldValidator.validateText,
                                    focusNode: provider.executorNameFocus,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: data.percentage!,
                                    maxLines: 1,
                                    type: TextInputType.number,
                                    label: '${index + 1} Percentage',
                                    icon: Icons.edit,
                                    validator: TextFieldValidator.validateText,
                                    focusNode: provider.executorNameFocus,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SelectTypeWidget(
                          willVar: willVar,
                          variables: variables,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CommonButton(
                            loadingNotifier: willVar.isLoading,
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

                              if (provider.willFormKey.currentState!
                                  .validate()) {
                                provider.checkSum();
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
