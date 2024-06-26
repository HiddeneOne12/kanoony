import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/trademark_module/register_trademark_screen/register_trademark_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/all_expandable_data.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/benefit_item.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/footer_widget.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/layout/widgets/required_documents_cards.dart';

import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';

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
                height: 0.795.sh,
                child: SingleChildScrollView(
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
                          onTap: () {
                            RoutesUtils.context
                                .push(RegisterTradeMarkScreen.trademarkRoute);
                          },
                        ),
                      ),
                      CommonTextWidget(
                        color: allColors.lightTextColor,
                        size: 14.sp,
                        align: TextAlign.start,
                        text: variables.staticData
                                ?.theUaesStrictTrademarkRegistrationSystemAids ??
                            '',
                        weight: FontWeight.w400,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 15.h),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.h, right: 25.h),
                        child: Divider(
                          height: 1.h,
                          color: allColors.dividerColor,
                          thickness: 1.w,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                        color: allColors.lightTextColor,
                        size: 18.sp,
                        align: TextAlign.center,
                        text: variables.staticData
                                ?.benefitsOfTrademarkRegistrationInUae ??
                            '',
                        weight: FontWeight.w500,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
                      ),
                      BenefitItem(
                          icon: SvgImagesAssetPath.safeguardSvg,
                          text: variables
                                  .staticData?.safeguardsYourBusinessIdentity ??
                              ''),
                      BenefitItem(
                          icon: SvgImagesAssetPath.protectsSvg,
                          text: variables.staticData
                                  ?.itProtectsYouAgainstOthersUsingTheSameOrS ??
                              ''),
                      BenefitItem(
                          icon: SvgImagesAssetPath.proofSvg,
                          text: variables.staticData
                                  ?.itProvidesSolidProofOfYourLegallyProtected_ ??
                              ''),
                      BenefitItem(
                          icon: SvgImagesAssetPath.lawSvg,
                          text: variables.staticData
                                  ?.itRemovesTheNeedToRelyOnCommonLawRights ??
                              ''),
                      BenefitItem(
                          icon: SvgImagesAssetPath.lawSvg,
                          text: variables.staticData
                                  ?.itIsAnAssetAndItsValueGrowsOverTime ??
                              ''),
                      BenefitItem(
                          icon: SvgImagesAssetPath.licenseSvg,
                          text: variables.staticData
                                  ?.itCanBeLicensedFranchisedOrSold ??
                              ''),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
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
                                  ?.documentsRequiredForTrademarkRegistrationInU ??
                              '',
                        ),
                      ),
                      RequiredDocCards(
                          icon: PngImagePaths.attornyImg,
                          text: variables.staticData
                                  ?.powerOfAttorneyAppointingUsToActAndApplyO ??
                              ''),
                      RequiredDocCards(
                          icon: PngImagePaths.visaImg,
                          text: variables
                                  .staticData?.copyOfPassportOfTheApplicants ??
                              ''),
                      RequiredDocCards(
                          icon: PngImagePaths.license2Img,
                          text: variables.staticData
                                  ?.copyOfTradeLicenseInCaseOfCorporateApplica ??
                              ''),
                      RequiredDocCards(
                          icon: PngImagePaths.companyNameImg,
                          text: variables
                                  .staticData?.artworkOfTheBrandNameOrLogo ??
                              ''),
                      CommonTextWidget(
                        color: allColors.lightTextColor,
                        size: 18.sp,
                        align: TextAlign.center,
                        text: variables.staticData
                                ?.trademarkRegistrationInThreeSteps ??
                            '',
                        weight: FontWeight.w500,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
                      ),
                      BenefitItem(
                          isSteps: true,
                          icon: PngImagePaths.applicationImg,
                          text: variables
                                  .staticData?.filingOfTrademarkApplication ??
                              ''),
                      BenefitItem(
                          isSteps: true,
                          icon: PngImagePaths.examinationImg,
                          text: variables
                                  .staticData?.step_02ApplicationExamination ??
                              ''),
                      BenefitItem(
                          isSteps: true,
                          icon: PngImagePaths.certificateImg,
                          text: 'Registration Certificate'),
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
