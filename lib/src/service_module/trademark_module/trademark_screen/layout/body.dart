import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/trademark_module/register_trademark_screen/register_trademark_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/all_expandable_data.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/benefit_item.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/footer_widget.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/required_documents_cards.dart';

import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/constants/values.dart';
import '../../../../../core/helpers/pascal_case_converter.dart';
import '../../../business_service_module/business_setup_screen/layout/widgets/faq_cards_widget.dart';
import '../../../widgets/common_container.dart';
import 'widgets/divider.dart';

class TradeMarkBody extends ConsumerStatefulWidget {
  const TradeMarkBody({super.key});

  @override
  ConsumerState<TradeMarkBody> createState() => _TradeMarkBodyState();
}

class _TradeMarkBodyState extends ConsumerState<TradeMarkBody> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.tradeMarkProvider.notifier);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            isButton: false,
            mainText: variables.staticData?.trademarkRegistration ?? '',
            subText: '',
            height: 0.21,
            isBack: true,
            onClickTap: () {
              RoutesUtils.context.push(RegisterTradeMarkScreen.trademarkRoute);
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
                      SizedBox(height: 30.h),
                      Padding(
                        padding: kHeadlineBottomPadding,
                        child: Align(
                          child: Text(
                            variables.staticData?.trademarkRegistration
                                    .upperCase() ??
                                '',
                            style: context.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ClickHereButton(
                          onTap: () {
                            RoutesUtils.context
                                .push(RegisterTradeMarkScreen.trademarkRoute);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: kLeftRightPadding16,
                        child: FaqItems(
                          isTrade: true,
                          name:
                              variables.staticData?.uaeTrademarkRegistration ??
                                  '',
                          description: variables.staticData
                                  ?.uaeForYearsHasBeenFollowingAStrictTrademar
                                  .capitalizeFirstLetter() ??
                              '',
                          number: '',
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kLeftRightPadding16,
                        child: FaqItems(
                          isTrade: true,
                          name: variables
                                  .staticData?.trademarkRegisterationInUae
                                  .capitalizeFirstLetter() ??
                              '',
                          description: variables.staticData
                                  ?.trademarkRegistrationInTheUaeIsImportantFor
                                  .capitalizeFirstLetter() ??
                              '',
                          number: '',
                          isHtml: true,
                        ),
                      ),
                      Padding(
                        padding: kTitlePadding2,
                        child: Text(
                          variables.staticData
                                  ?.theUaesStrictTrademarkRegistrationSystemAids
                                  .capitalizeFirstLetter() ??
                              '',
                          style: context.bodyMedium?.copyWith(
                              color: allColors.lightTextColor,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          capitalizeFirst(variables.staticData
                                  ?.benefitsOfTrademarkRegistrationInUae ??
                              ''),
                          style: context.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CommonContainer(
                        containerBorderColor: allColors.dividerColor,
                        containerColor: allColors.transparentColor,
                        widget: Column(
                          children: [
                            BenefitItem(
                                icon: SvgImagesAssetPath.safeguardSvg,
                                text: variables.staticData
                                        ?.safeguardsYourBusinessIdentity ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                icon: SvgImagesAssetPath.protectsSvg,
                                text: variables.staticData
                                        ?.itProtectsYouAgainstOthersUsingTheSameOrS ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                icon: SvgImagesAssetPath.proofSvg,
                                text: variables.staticData
                                        ?.itProvidesSolidProofOfYourLegallyProtected_ ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                icon: SvgImagesAssetPath.lawSvg,
                                text: variables.staticData
                                        ?.itRemovesTheNeedToRelyOnCommonLawRights ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                icon: SvgImagesAssetPath.assetSvg,
                                text: variables.staticData
                                        ?.itIsAnAssetAndItsValueGrowsOverTime ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                icon: SvgImagesAssetPath.licenseSvg,
                                text: variables.staticData
                                        ?.itCanBeLicensedFranchisedOrSold ??
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
                      Padding(
                        padding: kLeftRightPadding16,
                        child: Html(
                          style: {
                            "span": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                color: allColors.textColor,
                                fontSize: FontSize(18.sp),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Tajawal'),
                            "body": Style(
                                color: allColors.textColor,
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                fontSize: FontSize(18.sp),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Tajawal'),
                          },
                          data: variables.staticData
                                  ?.documentsRequiredForTrademarkRegistrationInU
                                  .capitalizeFirstLetter() ??
                              '',
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonContainer(
                        containerBorderColor: context.primaryColor,
                        containerColor: context.primaryColor,
                        widget: Column(
                          children: [
                            RequiredDocCards(
                                icon: PngImagePaths.attornyImg,
                                text: variables.staticData
                                        ?.powerOfAttorneyAppointingUsToActAndApplyO ??
                                    ''),
                            const DividerWidget(),
                            RequiredDocCards(
                                icon: PngImagePaths.visaImg,
                                text: variables.staticData
                                        ?.copyOfPassportOfTheApplicants ??
                                    ''),
                            const DividerWidget(),
                            RequiredDocCards(
                                icon: PngImagePaths.license2Img,
                                text: variables.staticData
                                        ?.copyOfTradeLicenseInCaseOfCorporateApplica ??
                                    ''),
                            const DividerWidget(),
                            RequiredDocCards(
                                icon: PngImagePaths.companyNameImg,
                                text: variables.staticData
                                        ?.artworkOfTheBrandNameOrLogo ??
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
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          capitalizeFirst(variables.staticData
                                  ?.trademarkRegistrationInThreeSteps ??
                              ''),
                          style: context.titleMedium
                              ?.copyWith(color: allColors.lightTextColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CommonContainer(
                        containerBorderColor: allColors.dividerColor,
                        containerColor: allColors.transparentColor,
                        widget: Column(
                          children: [
                            BenefitItem(
                                isSteps: true,
                                icon: PngImagePaths.applicationImg,
                                text: variables.staticData
                                        ?.filingOfTrademarkApplication ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                isSteps: true,
                                icon: PngImagePaths.examinationImg,
                                text: variables.staticData
                                        ?.step_02ApplicationExamination ??
                                    ''),
                            const DividerWidget(),
                            BenefitItem(
                                isSteps: true,
                                icon: PngImagePaths.certificateImg,
                                text: 'Registration Certificate'),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AllExpandableData(
                        variables: variables,
                      ),
                      FooterWidget(
                        variables: variables,
                        provider: provider,
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
