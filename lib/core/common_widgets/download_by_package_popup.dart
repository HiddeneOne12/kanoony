// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import '../../src/document_module/document_details_screen/model/document_detail_model.dart';

String selectedValue = '';
bool isError = false;
ValueNotifier<bool>? isLoading = ValueNotifier(false);
downloadDocumentByPackagePopUp(context, WidgetRef ref, DocDetail data) {
  var varaibles = ref.watch(allProviderList.dashboardProvider);
  var provider = ref.read(allProviderList.paidDocProvider.notifier);
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
            height: data.title.length >= 30 ? 0.3.sh : 0.28.sh,
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
                          isLoading!.value = false;
                          isError = false;
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isError) ...[
                            CommonTextWidget(
                                color: allColors.errorColor,
                                size: 13.sp,
                                text: 'Please select language to download!',
                                align: TextAlign.center,
                                weight: FontWeight.w400,
                                maxLine: 7,
                                padding: EdgeInsets.only(
                                    left: 0.h, right: 0.h, bottom: 10.h)),
                          ],
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
                                    padding:
                                        EdgeInsets.only(left: 0.h, right: 0.h)),
                              ),
                              const Spacer(),
                              Flexible(
                                flex: 1,
                                child: CommonTextWidget(
                                    color: allColors.primaryColor,
                                    align: TextAlign.start,
                                    size: 14.sp,
                                    text: "${data.documentPrice} AED",
                                    weight: FontWeight.w900,
                                    padding:
                                        EdgeInsets.only(left: 0.h, right: 0.h)),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.h),
                            child: Row(
                              children: [
                                if (data.englishattachment != 'null') ...[
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedValue = 'englishattachment';
                                          isError = false;
                                        });
                                      },
                                      child: Container(
                                        height: 20.h,
                                        width: 46.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: selectedValue ==
                                                    'englishattachment'
                                                ? allColors.primaryColor
                                                : allColors.canvasColor,
                                            border: Border.all(
                                              color: selectedValue ==
                                                      'englishattachment'
                                                  ? allColors.primaryColor
                                                  : allColors.textColor,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.r))),
                                        child: CommonTextWidget(
                                            color: selectedValue ==
                                                    'englishattachment'
                                                ? allColors.canvasColor
                                                : allColors.textColor,
                                            size: 10.sp,
                                            align: TextAlign.justify,
                                            text: 'English',
                                            weight: FontWeight.w800,
                                            padding: EdgeInsets.only(
                                                right: 0.h,
                                                top: 5.h,
                                                left: 0.h)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                ],
                                if (data.arabicattachment != 'null') ...[
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedValue = 'arabicattachment';
                                          isError = false;
                                        });
                                      },
                                      child: Container(
                                        height: 20.h,
                                        width: 46.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: selectedValue ==
                                                    'arabicattachment'
                                                ? allColors.primaryColor
                                                : allColors.canvasColor,
                                            border: Border.all(
                                              color: selectedValue ==
                                                      'arabicattachment'
                                                  ? allColors.primaryColor
                                                  : allColors.textColor,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.r))),
                                        child: CommonTextWidget(
                                            color: selectedValue ==
                                                    'arabicattachment'
                                                ? allColors.canvasColor
                                                : allColors.textColor,
                                            size: 10.sp,
                                            align: TextAlign.justify,
                                            text: 'Arabic',
                                            weight: FontWeight.w800,
                                            padding: EdgeInsets.only(
                                                right: 0.h,
                                                top: 5.h,
                                                left: 0.h)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                ],
                                if (data.combineattacment != 'null') ...[
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedValue = 'combineattacment';
                                          isError = false;
                                        });
                                      },
                                      child: Container(
                                        height: 20.h,
                                        width: 85.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: selectedValue ==
                                                    'combineattacment'
                                                ? allColors.primaryColor
                                                : allColors.canvasColor,
                                            border: Border.all(
                                              color: selectedValue ==
                                                      'combineattacment'
                                                  ? allColors.primaryColor
                                                  : allColors.textColor,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.r))),
                                        child: CommonTextWidget(
                                            color: selectedValue ==
                                                    'combineattacment'
                                                ? allColors.canvasColor
                                                : allColors.textColor,
                                            size: 10.sp,
                                            align: TextAlign.justify,
                                            text: 'English & Arabic',
                                            weight: FontWeight.w800,
                                            padding: EdgeInsets.only(
                                                right: 0.h,
                                                top: 5.h,
                                                left: 0.h)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                ],
                              ],
                            ),
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
                              text: isLoading!.value
                                  ? "PLEASE WAIT..."
                                  : varaibles.staticData?.downloadNow ?? '',
                              onPressed: () async {
                                if (selectedValue.isNotEmpty) {
                                  setState(() {
                                    isLoading!.value = true;
                                  });

                                  await provider
                                      .sendDownloadPaidDocByPackageRequest(
                                          int.parse(data.id), selectedValue);
                                  //setState(() {
                                  selectedValue = '';
                                  isError = false;
                                  isLoading!.value = false;
                                  //   });
                                } else {
                                  setState(() {
                                    isError = true;
                                  });
                                }
                              }),
                        ],
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
