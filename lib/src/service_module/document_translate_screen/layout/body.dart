import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/service_module/document_translate_screen/layout/widgets/operation_cards.dart';

import '../../../../core/common_widgets/callback_button.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/common_widgets/service_cards.dart';
import '../../../../core/constants/values.dart';
import '../../register_will_module/register_will_screen/layout/widgets/divider.dart';
import '../../register_will_module/register_will_screen/layout/widgets/information_for_will_cards.dart';
import '../../trademark_module/trademark_screen/layout/widgets/divider.dart';
import '../../widgets/common_container.dart';
import '../../widgets/expandable_items.dart';
import '../../widgets/request_callback_popup.dart';

class DocTranslateBody extends ConsumerStatefulWidget {
  const DocTranslateBody({super.key});

  @override
  ConsumerState<DocTranslateBody> createState() => _DocTranslateBodyState();
}

class _DocTranslateBodyState extends ConsumerState<DocTranslateBody> {
  @override
  bool isExpanded = false;
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
                height: 0.81.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: allColors.scaffoldColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            Padding(
                              padding: kLeftRightPadding16,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  variables.staticData
                                          ?.legalTranslationServiceInUae!
                                          .toUpperCase() ??
                                      '',
                                  style: context.headlineLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Align(
                              alignment: Alignment.center,
                              child: ClickHereButton(
                                onTap: () async {
                                  await requestCallBackPopUp(
                                      context, ref, false, false);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: kTitlePadding2,
                              child: Text(
                                variables
                                        .staticData?.ourLegalTranslationServices
                                        .capitalizeFirstLetter() ??
                                    '',
                                style: context.titleMedium,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: kTitlePadding2,
                              child: Text(
                                variables.staticData
                                        ?.kanoonyOffersLegalTranslationServicesForAVa
                                        .capitalizeFirstLetter() ??
                                    '',
                                style: context.bodyMedium?.copyWith(
                                    color: allColors.lightTextColor,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CommonContainer(
                              containerBorderColor: allColors.dividerColor,
                              containerColor: context.onPrimaryColor,
                              widget: Column(
                                children: [
                                  ServiceCard(
                                      isBold: true,
                                      isPng: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.birthCertificateImg,
                                      text: variables
                                              .staticData?.birthCertificate ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon:
                                          PngImagePaths.marriageCertificateImg,
                                      text: variables.staticData
                                              ?.marriageCertificate ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.resolutionImg,
                                      text: variables.staticData?.resolutions ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.diplomasImg,
                                      text:
                                          variables.staticData?.diplomas ?? ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.willsImg,
                                      text: variables.staticData?.wills ?? ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.memorandaImg,
                                      text: variables.staticData?.memoranda ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.patentsImg,
                                      text:
                                          variables.staticData?.patents ?? ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.litagationDocsImg,
                                      text: variables.staticData
                                              ?.litigationDocuments ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.tradelLicensesImg,
                                      text:
                                          variables.staticData?.tradeLicenses ??
                                              ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.deedsImg,
                                      text: variables.staticData
                                              ?.legalAgreementsAndDeeds ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.attorny2Img,
                                      text: variables
                                              .staticData?.powerOfAttorney ??
                                          ''),
                                  const DividerWidget(),
                                  ServiceCard(
                                      isPng: true,
                                      isBold: true,
                                      isTranslate: true,
                                      onTap: () async {},
                                      icon: PngImagePaths.moreImg,
                                      text: variables.staticData?.andManyMore ??
                                          ''),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: context.onSurfaceColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.h, right: 30.h, top: 15.h),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        variables.staticData
                                                ?.theAttestationProcess
                                                .capitalizeFirstLetter() ??
                                            '',
                                        style: context.titleMedium?.copyWith(
                                            color: context.onPrimaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onPrimaryColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (isExpanded) ...[
                              CommonContainer(
                                  widget: Column(
                                    children: [
                                      ExpandableItems(
                                        isDoc: true,
                                        p2: variables.staticData
                                                ?.priorToProceedingWithTheTranslationTheUaeE ??
                                            '',
                                        p3: variables.staticData
                                                ?.onceTheseStepsAreCompleteKanoonyWillForward ??
                                            '',
                                        title:
                                            variables.staticData?.scenario_1 ??
                                                '',
                                        description: variables.staticData
                                                ?.legalContractsAndDocumentsIssuedOutsideUaeA ??
                                            '',
                                      ),
                                      const WillDivider(),
                                      ExpandableItems(
                                        isDoc: true,
                                        p2: variables.staticData
                                                ?.priorToProceedingWithTheTranslationTheUaeO ??
                                            '',
                                        p3: variables.staticData
                                                ?.consequentlyTheAttestationProcessOfTheDocume ??
                                            '',
                                        title:
                                            variables.staticData?.scenario_2 ??
                                                '',
                                        description: variables.staticData
                                                ?.legalContractsAndDocumentsIssuedInDubaiAbu_ ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      )
                                    ],
                                  ),
                                  containerColor: allColors.transparentColor,
                                  containerBorderColor:
                                      allColors.scaffoldColor),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding2,
                        child: Text(
                          variables.staticData?.theFlowOfOurOperation
                                  .capitalizeFirstLetter() ??
                              '',
                          style: context.titleMedium
                              ?.copyWith(color: allColors.lightTextColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonContainer(
                        containerBorderColor: allColors.dividerColor,
                        containerColor: allColors.transparentColor,
                        widget: Column(
                          children: [
                            InfoForWillItem(
                              icon: "1",
                              text:
                                  variables.staticData?.documentReceiving ?? '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "2",
                              text:
                                  variables.staticData?.documentReceiving ?? '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "3",
                              text: variables.staticData
                                      ?.translatorsContentProduction ??
                                  '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "4",
                              text: variables.staticData
                                      ?.reviewersInitialReviewOfContent ??
                                  '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "5",
                              text: variables.staticData
                                      ?.legalTranslatorsFinalApproval ??
                                  '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "6",
                              text: variables.staticData?.contentDelivery ?? '',
                              des: '',
                              isTimeline: true,
                              isDoc: true,
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                      // GridView.count(
                      //   crossAxisCount: 2,
                      //   shrinkWrap: true,
                      //   childAspectRatio: 1.5,
                      //   crossAxisSpacing: 7.h,
                      //   padding:
                      //       EdgeInsets.only(left: 15.h, right: 15.h, top: 10.h),
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   children: [

                      //     OperationCards(
                      //         num: '4',
                      //         title: ),
                      //     OperationCards(
                      //         num: '5',
                      //         title: ),
                      //     OperationCards(
                      //         num: '6',
                      //         title:
                      //            ),
                      //   ],
                      // ),
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
