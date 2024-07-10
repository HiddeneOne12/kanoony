import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../../faq_screen/faq_screen.dart';
import '../../../widgets/cards_popup.dart';
import '../../../widgets/faq_button.dart';
import 'widgets/business_offshore_faq_cards.dart';
import '../../../widgets/business_offshore_servicecards.dart';
import 'widgets/streamlined_document_card.dart';

class BusinessSetupOffshoreBody extends ConsumerStatefulWidget {
  const BusinessSetupOffshoreBody({super.key});

  @override
  ConsumerState<BusinessSetupOffshoreBody> createState() =>
      _BusinessSetupOffshoreBodyState();
}

class _BusinessSetupOffshoreBodyState
    extends ConsumerState<BusinessSetupOffshoreBody> {
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
            mainText: variables.staticData?.offshoreCompanyformationInUae ?? '',
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
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isArabic ? 0 : 0.23.sw,
                          right: isArabic ? 0.23.sw : 0,
                        ),
                        child: const CallBackButton(),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 20.sp,
                        text: variables.staticData
                                ?.heresHowYouCanEffortlesslySetUpAnOffshore_.capitalizeFirstLetter()
                                 ??
                            '',
                        weight: FontWeight.w500,
                        align: TextAlign.start,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 12.h),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 1.35,
                        crossAxisSpacing: 7.h,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData
                                          ?.findATrustworthyRegisteredAgent ??
                                      '',
                                  PngImagePaths.agentImg,
                                  variables.staticData
                                          ?.ifYouWishToSetUpARakIccapprovedOffshoreB ??
                                      '',
                                  true,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.agentImg,
                            text: variables.staticData
                                    ?.findATrustworthyRegisteredAgent ??
                                '',
                          ),
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData
                                          ?.determineYourCompanyType ??
                                      '',
                                  PngImagePaths.companyTypeImg,
                                  variables.staticData
                                          ?.determiningTheTypeAndStructureOfYourCompany ??
                                      '',
                                  true,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.companyTypeImg,
                            text: variables
                                    .staticData?.determineYourCompanyType ??
                                '',
                          ),
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData
                                          ?.giveYourCompanyAUniqueName ??
                                      '',
                                  PngImagePaths.companyNameImg,
                                  variables.staticData
                                          ?.whileSelectingAUniqueNameForYourOffshoreCo ??
                                      '',
                                  true,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.companyNameImg,
                            text: variables
                                    .staticData?.giveYourCompanyAUniqueName ??
                                '',
                          ),
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData?.gatherVitalDocuments ??
                                      '',
                                  PngImagePaths.vitalDocImg,
                                  variables.staticData
                                          ?.documentsPlayAPivotalRoleInRegisteringAnOf ??
                                      '',
                                  true,
                                  true,
                                  variables.staticData?.ACopyOfYourCertifiedPassport ??
                                      '',
                                  variables.staticData
                                          ?.ACopyAndOriginalBankStatementsOfThePastS ??
                                      '',
                                  variables.staticData
                                          ?.NameOfDirectorsAndShareholders ??
                                      '',
                                  variables.staticData
                                          ?.ProofOfAddressRegisteredOfficeAddressInRak ??
                                      '',
                                  variables.staticData
                                          ?.ThreeCompanyNameOptionsForReservation ??
                                      '');
                            },
                            icon: PngImagePaths.vitalDocImg,
                            text: variables.staticData?.gatherVitalDocuments ??
                                '',
                          ),
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables
                                          .staticData?.registeringYourCompany ??
                                      '',
                                  PngImagePaths.companyRegisterImg,
                                  variables.staticData
                                          ?.bySubmittingAllTheDocumentsApprovedByTheRe ??
                                      '',
                                  true,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.companyRegisterImg,
                            text:
                                variables.staticData?.registeringYourCompany ??
                                    '',
                          ),
                          BusinessOffshoreLandServiceCard(
                            onTap: () async {
                              await cardsPopUp(
                                  context,
                                  variables.staticData
                                          ?.openAnOffshoreBankAccount ??
                                      '',
                                  PngImagePaths.offshoreBankImg,
                                  variables.staticData
                                          ?.onceYourCompanyIsSuccessfullyRegisteredUnder ??
                                      '',
                                  true,
                                  false,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '');
                            },
                            icon: PngImagePaths.offshoreBankImg,
                            text: variables
                                    .staticData?.openAnOffshoreBankAccount ??
                                '',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.primaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              color: allColors.textColor,
                              size: 20.sp,
                              text: variables.staticData
                                      ?.benefitsOfRegisteringAnOffshoreCompany.capitalizeFirstLetter() ??
                                  '',
                              weight: FontWeight.w500,
                              align: TextAlign.start,
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, top: 10.h),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables.staticData?.aTaxHeaven ?? '',
                              description: variables.staticData
                                      ?.uaeIsRecognizedGloballyAsATaxHavenTherefor ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables
                                      .staticData?.the100ForeignOwnership ??
                                  '',
                              description: variables.staticData
                                      ?.theBestPartAboutOwningAnOffshoreCompanyIn_ ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables.staticData?.confidentiality ?? '',
                              description: variables.staticData
                                      ?.whileFormingAnOffshoreCompanyConfidentiality_ ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables
                                      .staticData?.moreFlexibilityInBusiness ??
                                  '',
                              description: variables.staticData
                                      ?.offshoreCompaniesInUaeEnjoyGreatFlexibility_ ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name:
                                  variables.staticData?.accessToGlobalFunding ??
                                      '',
                              description: variables.staticData
                                      ?.establishingAnOffshoreCompanyInUaeIsAGatew ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables.staticData
                                      ?.noMinimumCapitalRequirements ??
                                  '',
                              description: variables.staticData
                                      ?.anotherSignificantAdvantageOfAnOffshoreBusin ??
                                  '',
                            ),
                            BusinessOffShoreFaqCards(
                              name: variables.staticData?.anEaseOfSetup ?? '',
                              description: variables.staticData
                                      ?.settingUpAnOffshoreBusinessInUaeRequiresMi ??
                                  '',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 20.sp,
                        text: variables.staticData
                                ?.streamlinedProcessWithMinimalCapitalAndSimpl.capitalizeFirstLetter() ??
                            '',
                        weight: FontWeight.w500,
                        align: TextAlign.start,
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 16.h,
                        ),
                      ),
                      Container(
                        height: 235.h,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamLinedCard(
                                img: PngImagePaths.companyNameImg,
                                num: variables.staticData?.the01 ?? '',
                                description: variables.staticData
                                        ?.theNameSelectionPlaysAnIntegralRoleInTheP.capitalizeFirstLetter() ??
                                    '',
                                title: variables.staticData
                                        ?.choosingAUniqueCompanyName ??
                                    '',
                                step: variables.staticData?.step ?? '',
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              StreamLinedCard(
                                img: PngImagePaths.vitalDocImg,
                                num: variables.staticData?.the02 ?? '',
                                description: variables.staticData
                                        ?.theApplicationRequiresPersonalDetailsAndAll_ ??
                                    '',
                                title: variables.staticData
                                        ?.fillingUpAnApplicationForm ??
                                    '',
                                step: variables.staticData?.step ?? '',
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              StreamLinedCard(
                                img: PngImagePaths.companyRegisterImg,
                                num: variables.staticData?.the03 ?? '',
                                description: variables.staticData
                                        ?.draftingAnArticleOfAssociationAoaAndMemoran ??
                                    '',
                                title:
                                    variables.staticData?.draftingMoaAndAoa ??
                                        '',
                                step: variables.staticData?.step ?? '',
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              StreamLinedCard(
                                img: PngImagePaths.companyRegisterImg,
                                num: variables.staticData?.the04 ?? '',
                                description: variables.staticData
                                        ?.theFinalStepAfterSuccessfullyRegisteringYour ??
                                    '',
                                title: variables.staticData
                                        ?.openAnOffshoreBankAccount ??
                                    '',
                                step: variables.staticData?.step ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                      FaqButton(
                        onTap: () {
                          RoutesUtils.context.push(
                            FaqScreen.faqRoute,
                            extra: {
                              TextUtils.isBusiness: false,
                              TextUtils.isFreeZone: false,
                              TextUtils.isMainland: false,
                              TextUtils.isOffshore: true,
                              TextUtils.isTrademark: false
                            },
                          );
                        },
                        isCallIcon: false,
                        backgroundColor: allColors.textColor,
                      ),
                      SizedBox(
                        height: 10.h,
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
