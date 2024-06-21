import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_mainland_screen/layout/widgets/business_mainland_faq_cards.dart';
import 'package:kanoony/src/service_module/widgets/cards_popup.dart';

import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../widgets/faq_button.dart';
import 'widgets/business_mainland_service_cards.dart';

class BusinessSetupMainLandBody extends ConsumerStatefulWidget {
  const BusinessSetupMainLandBody({super.key});

  @override
  ConsumerState<BusinessSetupMainLandBody> createState() =>
      _BusinessSetupMainLandBodyState();
}

class _BusinessSetupMainLandBodyState
    extends ConsumerState<BusinessSetupMainLandBody> {
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
            mainText: variables.staticData?.businessSetupInDubaiMainland ?? '',
            subText: '',
            height: isArabic ? 0.21 : 0.24,
            isBack: true,
            isFilter: false,
            isBlogTextField: false,
            isButton: true,
            isTextfield: false,
            isImage: true,
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
                height: isArabic ? 0.68.sh : 0.65.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 18.sp,
                        text: variables.staticData
                                ?.whyChooseMainlandCompanyFormationInDubai ??
                            '',
                        weight: FontWeight.w700,
                        align: TextAlign.start,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isArabic ? 16.h : 0.92.sw,
                            left: isArabic ? 0.92.sw : 16.h),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                          height: 1.h,
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 7.h,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.primeSpot ?? '',
                                  PngImagePaths.pinImg,
                                  variables.staticData
                                          ?.dubaiSitsAtAStrategicCrosswordConnectingEas ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.pinImg,
                            text: variables.staticData?.primeSpot ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.bigMarket ?? '',
                                  PngImagePaths.bigMarketImg,
                                  variables.staticData
                                          ?.mainlandCompaniesCanWorkWithTheLocalUaeMar ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.bigMarketImg,
                            text: variables.staticData?.bigMarket ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.noMoneyIssues ?? '',
                                  PngImagePaths.noMoneyImg,
                                  variables.staticData
                                          ?.thereAreNoRestrictionsOnChangingMoneyOrRep ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.noMoneyImg,
                            text: variables.staticData?.noMoneyIssues ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.doAnyBusiness ?? '',
                                  PngImagePaths.anyBusinessImg,
                                  variables.staticData
                                          ?.mainlandCompaniesCanDoCarryOutDifferentType ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.anyBusinessImg,
                            text: variables.staticData?.doAnyBusiness ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.skilledWorkers ?? '',
                                  PngImagePaths.skilledWorkersImg,
                                  variables.staticData
                                          ?.dubaiHasManyTalentedWorkersWhoSpeakDifferen ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.skilledWorkersImg,
                            text: variables.staticData?.skilledWorkers ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.taxBenefits ?? '',
                                  PngImagePaths.taxBenefitsImg,
                                  variables.staticData
                                          ?.noPersonalTaxIncomeTaxOrCapitalTax ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.taxBenefitsImg,
                            text: variables.staticData?.taxBenefits ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.topAddress ?? '',
                                  PngImagePaths.topAddressImg,
                                  variables.staticData
                                          ?.havingADubaiMainlandAddressMakesYourBusines ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.topAddressImg,
                            text: variables.staticData?.topAddress ?? '',
                          ),
                          BusinessMainLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.localTrading ?? '',
                                  PngImagePaths.localTradingImg,
                                  variables.staticData
                                          ?.mainlandCompaniesCanSellDirectlyToTheLocal_ ??
                                      '',
                                  false,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.localTradingImg,
                            text: variables.staticData?.localTrading ?? '',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.textColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 18.sp,
                              text: variables.staticData
                                      ?.processForEstablishingAMainlandCompanyInDub ??
                                  '',
                              weight: FontWeight.w700,
                              align: TextAlign.start,
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, top: 10.h),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: isArabic ? 16.h : 0.92.sw,
                                  left: isArabic ? 0.92.sw : 16.h),
                              child: Divider(
                                color: allColors.primaryColor,
                                thickness: 1.w,
                                height: 1.h,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            BusinessMainLandFaqItems(
                              title: variables.staticData
                                      ?.natureAndLegalStructureSelection ??
                                  '',
                              description: variables.staticData
                                      ?.defineTheSpecificBusinessActivityYouWishTo_ ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title:
                                  variables.staticData?.tradeNameApproval ?? '',
                              description: variables.staticData
                                      ?.proposeADistinctiveTradeNameForYourBusiness ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title: variables.staticData?.preliminaryConsent ??
                                  '',
                              description: variables.staticData
                                      ?.presentTheRequiredDocumentationToTheDedOrT ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title: variables.staticData
                                      ?.memorandumOfAssociationMoaCompilation ??
                                  '',
                              description: variables.staticData
                                      ?.craftAComprehensiveMoaDetailingVitalComponen ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title: variables
                                      .staticData?.businessLocationSelection ??
                                  '',
                              description: variables.staticData
                                      ?.sourceAFittingWorkspaceThatAdheresToTheSti ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title:
                                  variables.staticData?.tenancyAgreement ?? '',
                              description: variables.staticData
                                      ?.secureATenancyAgreementForYourChosenPremise ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title: variables.staticData
                                      ?.acquisitionOfSupplementaryApprovals ??
                                  '',
                              description: variables.staticData
                                      ?.dependingOnYourChosenBusinessDomainAdditiona ??
                                  '',
                            ),
                            BusinessMainLandFaqItems(
                              title: variables.staticData?.licensingProcedure ??
                                  '',
                              description: variables.staticData
                                      ?.furnishAllRequisiteDocumentsAndProceedToApp ??
                                  '',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            FaqButton(
                              isCallIcon: false,
                              backgroundColor: allColors.primaryColor,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      )
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
