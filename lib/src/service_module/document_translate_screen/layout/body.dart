import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/service_module/document_translate_screen/layout/widgets/operation_cards.dart';

import '../../../../core/common_widgets/callback_button.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/common_widgets/service_cards.dart';
import '../../widgets/expandable_items.dart';
import '../../widgets/request_callback_popup.dart';

class DocTranslateBody extends ConsumerStatefulWidget {
  const DocTranslateBody({super.key});

  @override
  ConsumerState<DocTranslateBody> createState() => _DocTranslateBodyState();
}

class _DocTranslateBodyState extends ConsumerState<DocTranslateBody> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            isButton: false,
            mainText: variables.staticData?.legalTranslationServiceInUae ?? '',
            subText: '',
            height: isArabic ? 0.23 : 0.21,
            isBack: true,
            onClickTap: () async {
              await requestCallBackPopUp(context, ref, false, false);
            },
            isFilter: false,
            isBlogTextField: false,
            isClick: true,
            isTextfield: false,
            isImage: false,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: allColors.scaffoldColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: isArabic ? 0 : 0.23.sw,
                                right: isArabic ? 0.23.sw : 0,
                              ),
                              child: ClickHereButton(
                                onTap: () async {
                                  await requestCallBackPopUp(
                                      context, ref, false, false);
                                },
                              ),
                            ),
                            CommonTextWidget(
                              color: allColors.textColor,
                              size: 18.sp,
                              align: TextAlign.start,
                              text: capitalizeFirst(variables.staticData
                                      ?.ourLegalTranslationServices ??
                                  ''),
                              weight: FontWeight.w500,
                              padding: EdgeInsets.only(
                                left: 16.h,
                                right: 16.h,
                                top: 15.h,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CommonTextWidget(
                              color: allColors.lightTextColor,
                              size: 16,
                              align: TextAlign.start,
                              text: variables.staticData
                                      ?.kanoonyOffersLegalTranslationServicesForAVa ??
                                  '',
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, top: 0.h),
                            ),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              childAspectRatio: 1.6,
                              crossAxisSpacing: 7.h,
                              padding: EdgeInsets.only(
                                  left: 15.h, right: 15.h, top: 10.h),
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ServiceCard(
                                    isBold: true,
                                    isPng: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.birthCertificateImg,
                                    text: variables
                                            .staticData?.birthCertificate ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.marriageCertificateImg,
                                    text: variables
                                            .staticData?.marriageCertificate ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.resolutionImg,
                                    text: variables.staticData?.resolutions ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.diplomasImg,
                                    text: variables.staticData?.diplomas ?? ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.willsImg,
                                    text: variables.staticData?.wills ?? ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.memorandaImg,
                                    text:
                                        variables.staticData?.memoranda ?? ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.patentsImg,
                                    text: variables.staticData?.patents ?? ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.litagationDocsImg,
                                    text: variables
                                            .staticData?.litigationDocuments ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.tradelLicensesImg,
                                    text: variables.staticData?.tradeLicenses ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.deedsImg,
                                    text: variables.staticData
                                            ?.legalAgreementsAndDeeds ??
                                        ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.attorny2Img,
                                    text:
                                        variables.staticData?.powerOfAttorney ??
                                            ''),
                                ServiceCard(
                                    isPng: true,
                                    isBold: true,
                                    onTap: () async {},
                                    icon: PngImagePaths.moreImg,
                                    text: variables.staticData?.andManyMore ??
                                        ''),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.textColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 18.sp,
                              text:
                                  capitalizeFirst(variables.staticData?.theAttestationProcess ??
                                      ''),
                              weight: FontWeight.w500,
                              align: TextAlign.center,
                              padding: EdgeInsets.only(
                                  left: 30.h, right: 30.h, top: 15.h),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ExpandableItems(
                              isDoc: true,
                              p2: variables.staticData
                                      ?.priorToProceedingWithTheTranslationTheUaeE ??
                                  '',
                              p3: variables.staticData
                                      ?.onceTheseStepsAreCompleteKanoonyWillForward ??
                                  '',
                              title: variables.staticData?.scenario_1 ?? '',
                              description: variables.staticData
                                      ?.legalContractsAndDocumentsIssuedOutsideUaeA ??
                                  '',
                            ),
                            ExpandableItems(
                              isDoc: true,
                              p2: variables.staticData
                                      ?.priorToProceedingWithTheTranslationTheUaeO ??
                                  '',
                              p3: variables.staticData
                                      ?.consequentlyTheAttestationProcessOfTheDocume ??
                                  '',
                              title: variables.staticData?.scenario_2 ?? '',
                              description: variables.staticData
                                      ?.legalContractsAndDocumentsIssuedInDubaiAbu_ ??
                                  '',
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ),
                      ),
                      CommonTextWidget(
                        color: allColors.lightTextColor,
                        size: 18.sp,
                        align: TextAlign.center,
                        text: capitalizeFirst(variables.staticData?.theFlowOfOurOperation ?? ''),
                        weight: FontWeight.w500,
                        padding: EdgeInsets.only(
                            left: 0.25.sw, right: 0.25.sw, top: 15.h),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 7.h,
                        padding:
                            EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          OperationCards(
                              num: '1',
                              title: variables.staticData?.documentReceiving ??
                                  ''),
                          OperationCards(
                              num: '2',
                              title: variables.staticData
                                      ?.clientServiceExecutiveInitiatingTheProcess ??
                                  ''),
                          OperationCards(
                              num: '3',
                              title: variables.staticData
                                      ?.translatorsContentProduction ??
                                  ''),
                          OperationCards(
                              num: '4',
                              title: variables.staticData
                                      ?.reviewersInitialReviewOfContent ??
                                  ''),
                          OperationCards(
                              num: '5',
                              title: variables.staticData
                                      ?.legalTranslatorsFinalApproval ??
                                  ''),
                          OperationCards(
                              num: '6',
                              title:
                                  variables.staticData?.contentDelivery ?? ''),
                        ],
                      ),
                    ],
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
