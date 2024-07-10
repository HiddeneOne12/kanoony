// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/helpers/validators.dart';
import 'package:kanoony/src/service_module/widgets/popup_textfields.dart';

import '../../../core/routing/routing_config.dart';

ValueNotifier<bool> isLoading = ValueNotifier(false);
requestCallBackPopUp(context, WidgetRef ref, bool isBusiness, bool isVisa) {
  var variable = ref.watch(allProviderList.dashboardProvider);
  var doc = ref.read(allProviderList.translateDocNotifier.notifier);
  var docVar = ref.watch(allProviderList.translateDocNotifier);
  var business = ref.read(allProviderList.businessNotifier.notifier);
  var visa = ref.read(allProviderList.goldenVisaNotifier.notifier);
  final formKey = GlobalKey<FormState>();

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
          actions: [
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonButton(
                      isEnabledNotifier: isLoading,
                      height: 35.h,
                      backgroundColor: allColors.primaryColor,
                      radius: 6,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                          color: allColors.canvasColor),
                      text: isLoading.value
                          ? 'Please wait...'
                          : variable.staticData?.submit?.capitalizeFirstLetter() ?? '',
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading.value = true;
                          });
                          if (isBusiness) {
                            await business.sendRequest();
                          } else if (isVisa) {
                            await visa.sendRequest();
                          } else {
                            await doc.sendRequest();
                          }

                          setState(() {
                            isLoading.value = false;
                          });
                        }
                      }),
                ],
              );
            })
          ],
          content: Directionality(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: StatefulBuilder(builder: (context, setState) {
              return SizedBox(
                height: 0.53.sh,
                child: Stack(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 120.h,
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
                      text: variable.staticData?.requestACallBack
                              ?.capitalizeFirstLetter() ??
                          '',
                      weight: FontWeight.w500,
                      padding: EdgeInsets.only(
                          top: 20.h,
                          left: isArabic ? 0 : 25.h,
                          right: isArabic ? 25.5 : 0)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic ? 0 : 0.7.sw,
                        top: 12.h,
                        right: isArabic ? 0.7.sw : 0),
                    child: InkWell(
                        onTap: () {
                          if (isBusiness) {
                            business.clearData();
                          } else if (isVisa) {
                            visa.clearData();
                          } else {
                            doc.clearData();
                          }

                          RoutesUtils.context.pop();
                        },
                        child: Icon(
                          Icons.close,
                          size: 20.h,
                          color: allColors.textColor,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25.h,
                        right: 25.h,
                        top: isVisa
                            ? 0.07.sh
                            : isBusiness
                                ? 0.1.sh
                                : 0.07.sh),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopUpTextField(
                              hintText: variable.staticData?.fullName ?? '',
                              icons: Icons.person_2_outlined,
                              controller: isBusiness
                                  ? business.nameController
                                  : isVisa
                                      ? visa.nameController
                                      : doc.nameController,
                              type: TextInputType.name,
                              validator: TextFieldValidator.validateText,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            PopUpTextField(
                              hintText: variable.staticData?.email ?? '',
                              icons: Icons.email_outlined,
                              controller: isBusiness
                                  ? business.emailController
                                  : isVisa
                                      ? visa.emailController
                                      : doc.emailController,
                              type: TextInputType.emailAddress,
                              validator: TextFieldValidator.validateEmail,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            PopUpTextField(
                              hintText: variable.staticData?.phoneNumber ?? '',
                              icons: Icons.call,
                              controller: isBusiness
                                  ? business.phoneController
                                  : isVisa
                                      ? visa.phoneController
                                      : doc.phoneController,
                              type: TextInputType.phone,
                              validator: TextFieldValidator.validatePhone,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            PopUpTextField(
                              onTap: () {
                                if (isBusiness) {
                                  business.showCompanyPopupMenu();
                                } else if (isVisa) {
                                  visa.showCompanyPopupMenu();
                                } else {
                                  doc.showLanguagePopupMenu();
                                }
                              },
                              hintText: isBusiness
                                  ? variable.staticData?.companySetIn ?? ''
                                  : isVisa
                                      ? variable
                                              .staticData?.chooseYourCategory ??
                                          ''
                                      : variable.staticData?.targetLanguage ??
                                          '',
                              icons: Icons.keyboard_arrow_down,
                              controller: isBusiness
                                  ? business.companyController
                                  : isVisa
                                      ? visa.categoryController
                                      : doc.languageController,
                              type: TextInputType.none,
                              validator: TextFieldValidator.validateText,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (isVisa) ...[
                              PopUpTextField(
                                hintText: variable.staticData?.occupation ?? '',
                                icons: Icons.person,
                                controller: visa.occupationController,
                                type: TextInputType.text,
                                validator: TextFieldValidator.validateText,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                            PopUpTextField(
                              maxLines: 3,
                              hintText: isBusiness
                                  ? variable.staticData?.message ?? ''
                                  : variable.staticData?.notes ?? '',
                              icons: Icons.message_outlined,
                              controller: isBusiness
                                  ? business.messageController
                                  : isVisa
                                      ? visa.noteController
                                      : doc.notesController,
                              type: TextInputType.text,
                              validator: TextFieldValidator.validateText,
                            ),
                            if (!isBusiness && !isVisa) ...[
                              SizedBox(
                                height: 10.h,
                              ),
                              PopUpTextField(
                                onTap: () {
                                  doc.pickFiles(ref);
                                },
                                hintText:
                                    variable.staticData?.attachAFile ?? '',
                                icons: Icons.attachment_outlined,
                                controller: TextEditingController(),
                                type: TextInputType.none,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              if (docVar.selectedFiles.isNotEmpty) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 400.w,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.all(0.h),
                                          itemCount:
                                              docVar.selectedFiles.length,
                                          itemBuilder: (context, index) {
                                            var name = docVar
                                                .selectedFiles[index].path
                                                .split('/')
                                                .last;
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: CommonTextWidget(
                                                        align: TextAlign.start,
                                                        color:
                                                            allColors.textColor,
                                                        size: 13.sp,
                                                        text: name,
                                                        weight: FontWeight.w400,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 0.h))),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 5.h),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        doc.removeFiles(name);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 13.h,
                                                      color:
                                                          allColors.errorColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              );
            }),
          ),
        );
      });
}
