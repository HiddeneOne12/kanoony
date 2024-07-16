import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/service_module/widgets/faq_button.dart';
import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../../faq_screen/faq_screen.dart';
import '../../business_setup_offshore_screen/layout/widgets/business_offshore_faq_cards.dart';
import 'widgets/blueprints_card_listing.dart';
import 'widgets/business_freezone_service_cards.dart';

class BusinessSetupFreeZoneBody extends ConsumerStatefulWidget {
  const BusinessSetupFreeZoneBody({super.key});

  @override
  ConsumerState<BusinessSetupFreeZoneBody> createState() =>
      _BusinessSetupFreeZoneBodyState();
}

class _BusinessSetupFreeZoneBodyState
    extends ConsumerState<BusinessSetupFreeZoneBody> {
  bool selectedItem = false;
  bool bluePrintSelected = false;
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
            mainText: variables.staticData?.freezoneBusinessSetupInUae ?? '',
            subText: '',
            height: isArabic ? 0.21 : 0.21,
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
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          variables.staticData?.freezoneBusinessSetupInUae
                                  .upperCase() ??
                              '',
                          style: context.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: CallBackButton(),
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          variables.staticData?.keyFreeZonesInTheUae
                                  .capitalizeFirstLetter() ??
                              '',
                          style: context.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 7.h,
                        padding: EdgeInsets.only(left: 16.h, right: 16.h),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BusinessFreeZoneServiceCard(
                            onTap: () async {},
                            icon: PngImagePaths.saifZoneImg,
                            text: variables.staticData?.saifZone ?? '',
                          ),
                          BusinessFreeZoneServiceCard(
                            onTap: () async {},
                            icon: PngImagePaths.sharjahImg,
                            text: variables.staticData?.sharjahMediaCity ?? '',
                          ),
                          BusinessFreeZoneServiceCard(
                            onTap: () {},
                            icon: PngImagePaths.ajmanImg,
                            text: variables.staticData?.ajmanFreeZone ?? '',
                          ),
                          BusinessFreeZoneServiceCard(
                            onTap: () {},
                            icon: PngImagePaths.rakezImg,
                            text: variables.staticData?.rakez ?? '',
                          ),
                          BusinessFreeZoneServiceCard(
                            onTap: () {},
                            icon: PngImagePaths.jafzaImg,
                            text: variables.staticData?.jabelAliFreeZone ?? '',
                          ),
                          BusinessFreeZoneServiceCard(
                            onTap: () {},
                            icon: PngImagePaths.airportImg,
                            text: variables.staticData?.dubaiAirportFreeZone ??
                                '',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: context.primaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedItem = !selectedItem;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: kTitlePadding2,
                                      child: Text(
                                        capitalizeFirst(variables.staticData
                                                ?.advantagesOfABusinessOdysseyInUaeFreeZones ??
                                            ''),
                                        style: context.headlineLarge?.copyWith(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      child: Icon(
                                    selectedItem
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: allColors.textColor,
                                    size: 25,
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (selectedItem) ...[
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.enjoyTheLibertyOf_100ForeignOwnershipWithout ??
                                    '',
                                name:
                                    variables.staticData?.unbridledOwnership ??
                                        '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.freelyTransferYourProfitsAndCapitalOutsideT ??
                                    '',
                                name: variables.staticData
                                        ?.unrestrictedProfitMovements ??
                                    '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.experienceZeroCustomsDutiesOnGoodsAndServic ??
                                    '',
                                name:
                                    variables.staticData?.dutyfreeOperations ??
                                        '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.sidestepLengthyBureaucraticProcessesWithAnEx ??
                                    '',
                                name: variables.staticData?.swiftSetup ?? '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.accessModernAmenitiesFromPlushOfficeSpacesT ??
                                    '',
                                name: variables.staticData
                                        ?.stateoftheartInfrastructure ??
                                    '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.engageInIndustrycentricZonesLikeMediaTechAn ??
                                    '',
                                name:
                                    variables.staticData?.specializedHubs ?? '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.benefitFromAnInfluxOfGlobalTalentThanksTo_ ??
                                    '',
                                name: variables.staticData?.diverseTalentPool ??
                                    '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.enjoyEnhancedBusinessDiscretionAndStakeholder ??
                                    '',
                                name: variables.staticData?.upheldPrivacy ?? '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.seamlesslyRenewBusinessLicensesEnsuringUninte ??
                                    '',
                                name: variables.staticData
                                        ?.hasslefreeLicenseRenewals ??
                                    '',
                              ),
                              BusinessOffShoreFaqCards(
                                description: variables.staticData
                                        ?.enjoyTheLibertyToMoveYourCapitalAndProfits ??
                                    '',
                                name: variables
                                        .staticData?.fluidCapitalMovements ??
                                    '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ]
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            bluePrintSelected = !bluePrintSelected;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: kTitlePadding2,
                                child: Text(
                                  variables.staticData
                                          ?.blueprintForEstablishingABusinessInUaeFree_
                                          .capitalizeFirstLetter() ??
                                      '',
                                  style: context.headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Icon(
                              bluePrintSelected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: allColors.textColor,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      if (bluePrintSelected) ...[
                        Container(
                          margin: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: context.onPrimaryColor,
                            borderRadius: kBorderRadius6,
                            boxShadow: [
                              BoxShadow(
                                  color: allColors.lightGreyColor,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 1.9),
                            ],
                          ),
                          child: Column(
                            children: [
                              BluePrintCardListing(
                                title:
                                    variables.staticData?.researchAndSelect ??
                                        '',
                                description: variables.staticData
                                        ?.beginByIdentifyingWhichFreeZoneAlignsBestW ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData
                                        ?.decideOnNatureOfTheLegalEntity ??
                                    '',
                                description: variables.staticData
                                        ?.willYouBeSettingUpAsAnIndividualABranchO ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title:
                                    variables.staticData?.chooseABusinessName ??
                                        '',
                                description: variables.staticData
                                        ?.yourBusinessNameShouldNotOnlyReflectYourBr ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables
                                        .staticData?.prepareDocumentation ??
                                    '',
                                description: variables.staticData
                                        ?.collateAllRequiredDocumentsWhichTypicallyInc ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title:
                                    variables.staticData?.licenseApplication ??
                                        '',
                                description: variables.staticData
                                        ?.applyForTheBusinessLicenseRelevantToYourAc ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData
                                        ?.officeSpace_Infrastructure ??
                                    '',
                                description: variables.staticData
                                        ?.basedOnYourBusinessSizeAndRequirementsChoos ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData?.getApprovals ?? '',
                                description: variables.staticData
                                        ?.apartFromTheStandardFreeZoneAuthoritysAppro ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData?.feesPayment ?? '',
                                description: variables.staticData
                                        ?.uponApprovalYouWillBeRequiredToPayTheRele ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables
                                        .staticData?.collectBusinessLicense ??
                                    '',
                                description: variables.staticData
                                        ?.withPaymentsClearedYouCanNowCollectYourBus ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData
                                        ?.openACorporateBankAccount ??
                                    '',
                                description: variables.staticData
                                        ?.withYourLicenseInHandApproachOneOfUaesNum ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData
                                        ?.finalizeVisasAndImmigration ??
                                    '',
                                description: variables.staticData
                                        ?.ifYourePlanningToRelocateOrHaveEmployeesIn ??
                                    '',
                              ),
                              BluePrintCardListing(
                                title: variables.staticData
                                        ?.turnYourBusinessVisionIntoRealityInAUaeFr ??
                                    '',
                                description: variables.staticData
                                        ?.contactOurExpertTeamTodayForPersonalizedGui ??
                                    '',
                              ),
                            ],
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: FaqButton(
                            onTap: () {
                              RoutesUtils.context.push(
                                FaqScreen.faqRoute,
                                extra: {
                                  TextUtils.isBusiness: false,
                                  TextUtils.isFreeZone: true,
                                  TextUtils.isMainland: false,
                                  TextUtils.isOffshore: false,
                                  TextUtils.isTrademark: false
                                },
                              );
                            },
                            backgroundColor: allColors.textColor,
                            isCallIcon: false),
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
