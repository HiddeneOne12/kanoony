import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/service_module/widgets/common_container.dart';
import 'package:kanoony/src/service_module/widgets/expandable_card.dart';

import '../../../../core/common_widgets/callback_button.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/constants/values.dart';
import '../../register_will_module/register_will_screen/layout/widgets/divider.dart';
import '../../widgets/expandable_items.dart';
import '../../widgets/request_callback_popup.dart';
import 'widgets/visa_divider.dart';

class GoldenVisaBody extends ConsumerStatefulWidget {
  const GoldenVisaBody({super.key});

  @override
  ConsumerState<GoldenVisaBody> createState() => _GoldenVisaBodyState();
}

class _GoldenVisaBodyState extends ConsumerState<GoldenVisaBody> {
  bool isVisaExpanded = false;
  bool isReqExpanded = false;
  bool isExpanded = false;
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
            mainText: variables.staticData?.goldenVisa ?? '',
            subText: '',
            height: 0.21,
            isBack: true,
            onClickTap: () async {
              await requestCallBackPopUp(context, ref, false, true);
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
                            variables.staticData?.goldenVisa.upperCase() ?? '',
                            style: context.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ClickHereButton(
                          onTap: () async {
                            await requestCallBackPopUp(
                                context, ref, false, true);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: kTitlePadding2,
                        child: Text(
                          variables.staticData
                                  ?.theUaesGoldenVisaGrantsEligibleExpatriatesI
                                  .capitalizeFirstLetter() ??
                              '',
                          style: context.bodyMedium?.copyWith(
                              color: allColors.lightTextColor,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.visaColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisaExpanded = !isVisaExpanded;
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        variables.staticData?.goldenVisaBenefits
                                                .capitalizeFirstLetter() ??
                                            '',
                                        style: context.titleMedium?.copyWith(
                                          color: context.onPrimaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      isVisaExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onPrimaryColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (isVisaExpanded) ...[
                              CommonContainer(
                                  widget: Column(
                                    children: [
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.the01ExtendedResidency ??
                                            '',
                                        description: variables.staticData
                                                ?.oneOfTheMainBenefitsOfTheUaeGoldenVisaIs ??
                                            '',
                                      ),
                                      const VisaDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.the02FreedomToWorkAndStudy ??
                                            '',
                                        description: variables.staticData
                                                ?.goldenVisaHoldersEnjoyTheFreedomToWorkAnd_ ??
                                            '',
                                      ),
                                      const VisaDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.the03InvestmentOpportunities ??
                                            '',
                                        description: variables.staticData
                                                ?.forInvestorsAndEntrepreneursTheGoldenVisaPr ??
                                            '',
                                      ),
                                      const VisaDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.the04FamilyBenefits ??
                                            '',
                                        description: variables.staticData
                                                ?.goldenVisaHoldersCanExtendTheBenefitsOfThe ??
                                            '',
                                      ),
                                      const VisaDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.the05CulturalDiversityAndLifestyle ??
                                            '',
                                        description: variables.staticData
                                                ?.theUaeIsRenownedForItsRichCulturalHeritage ??
                                            '',
                                      ),
                                      const VisaDivider(),
                                      ExpandableItems(
                                        title: variables
                                                .staticData?.the06Discounts ??
                                            '',
                                        description: variables.staticData
                                                ?.governmentAgenciesAndPrivateCompaniesProvide_ ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                  containerColor: allColors.transparentColor,
                                  containerBorderColor: context.onPrimaryColor),
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
                        padding: kLeftRightPadding16,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isReqExpanded = !isReqExpanded;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                variables.staticData
                                        ?.categories_EligibilityRequirements
                                        .capitalizeFirstLetter() ??
                                    '',
                                style: context.titleMedium?.copyWith(
                                  color: allColors.lightTextColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Icon(
                                isReqExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: context.onSurfaceColor,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isReqExpanded) ...[
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonContainer(
                            widget: Column(
                              children: [
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title:
                                      variables.staticData?.the1Investors ?? '',
                                  description: variables.staticData
                                          ?.forThoseSeekingInvestmentOpportunitiesInThe_ ??
                                      '',
                                ),
                                const WillDivider(),
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title: variables.staticData
                                          ?.the2AspiringEntrepreneurs ??
                                      '',
                                  description: variables.staticData
                                          ?.forThoseWithEntrepreneurialAmbitionsTheUaeG ??
                                      '',
                                ),
                                const WillDivider(),
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title: variables.staticData
                                          ?.the3HighlySkilledProfessionals ??
                                      '',
                                  description: variables.staticData
                                          ?.renownedForItsCuttingedgeIndustriesAndToptie ??
                                      '',
                                ),
                                const WillDivider(),
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title: variables.staticData
                                          ?.the4PeopleWithExceptionalTalents ??
                                      '',
                                  description: variables.staticData
                                          ?.whetherItIsPeopleOfCultureAndArtInnovators ??
                                      '',
                                ),
                                const WillDivider(),
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title: variables.staticData
                                          ?.the5HighPerformingStudents ??
                                      '',
                                  description: variables.staticData
                                          ?.recognizingTheExcellenceOfItsEducationalInst ??
                                      '',
                                ),
                                const WillDivider(),
                                ExpandableItems(
                                  isDoc: true,
                                  isVisa: true,
                                  title: variables.staticData
                                          ?.the1HumanitarianPioneers ??
                                      '',
                                  description: variables.staticData
                                          ?.peopleContributingToTheHumanitarianFieldIncl ??
                                      '',
                                ),
                              ],
                            ),
                            containerColor: allColors.transparentColor,
                            containerBorderColor: context.onSurfaceColor),
                      ],
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.errorColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: kLeftRightPadding16,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      variables.staticData
                                              ?.goldenVisasForPropertyOwnersScenarios
                                              .capitalizeFirstLetter() ??
                                          '',
                                      style: context.titleMedium?.copyWith(
                                        color: context.onPrimaryColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onPrimaryColor,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (isExpanded) ...[
                              CommonContainer(
                                  widget: Column(
                                    children: [
                                      ExpandableCards(
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle:
                                            variables.staticData?.titleDeed ??
                                                '',
                                        name: variables.staticData?.option_01 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables.staticData
                                                ?.fullyPaid_PropertyHandedOver ??
                                            '',
                                        point2: variables.staticData
                                                ?.the10yearGoldenVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        point4: variables.staticData
                                                ?.ValueOfThePropertyShouldBeOverAed_2000000 ??
                                            '',
                                        point5: variables.staticData
                                                ?.TitleDeedMustBeInTheIndividualsNameNotTh ??
                                            '',
                                        point6: variables.staticData
                                                ?.SpouseHusbandOrWifeCanBeOnTheTitleDeedB ??
                                            '',
                                        price: variables.staticData
                                                ?.TitleDeedFullyPaidUp ??
                                            '',
                                        point7: variables
                                                .staticData?.listOfDocuments ??
                                            '',
                                        isWill: false,
                                        point8: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        point9: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point10: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        isPadding: true,
                                      ),
                                      Divider(
                                        thickness: 1.w,
                                        height: 1.h,
                                        color: allColors.dividerColor,
                                      ),
                                      ExpandableCards(
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle:
                                            variables.staticData?.titleDeed ??
                                                '',
                                        name: variables.staticData?.option_02 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables.staticData
                                                ?.mortgagedPropertyOrPaymentPlanWithDeveloper ??
                                            '',
                                        point2: variables.staticData
                                                ?.the10yearGoldenVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        point4: variables.staticData
                                                ?.ValueOfThePropertyShouldBeOverAed_2000000 ??
                                            '',
                                        point5: variables.staticData
                                                ?.TitleDeedMustBeInTheIndividualsNameNotTh ??
                                            '',
                                        point6: variables.staticData
                                                ?.SpouseHusbandOrWifeCanBeOnTheTitleDeedB ??
                                            '',
                                        price: variables.staticData
                                                ?.MortgagedNocLetterFromTheBankMentioningThe ??
                                            '',
                                        point7: variables
                                                .staticData?.listOfDocuments ??
                                            '',
                                        isWill: false,
                                        point8: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        point9: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point10: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        pointExtra1: variables.staticData
                                                ?.PaymentPlanSoaFromDeveloper_PretitleDeed ??
                                            '',
                                        isPadding: true,
                                      ),
                                      Divider(
                                        thickness: 1.w,
                                        height: 1.h,
                                        color: allColors.dividerColor,
                                      ),
                                      ExpandableCards(
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle: variables
                                                .staticData?.offplanProperty ??
                                            '',
                                        name: variables.staticData?.option_03 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables.staticData
                                                ?.the10yearGoldenVisa ??
                                            '',
                                        point2: variables.staticData
                                                ?.the10yearGoldenVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        point4: variables.staticData
                                                ?.ThePropertyDevelopmentThatReached_40OfCompl ??
                                            '',
                                        point5: variables.staticData
                                                ?.ValueOfThePropertyShouldBeOverAed_2000000 ??
                                            '',
                                        point6: variables.staticData
                                                ?.NoMinimalPaidupAmountRequiredFromJan_2024 ??
                                            '',
                                        pointExtra3: variables.staticData
                                                ?.TitleDeedMustBeInTheIndividualsNameNotTh ??
                                            '',
                                        pointExtra4: variables.staticData
                                                ?.SpouseHusbandOrWifeCanBeOnTheTitleDeedB ??
                                            '',
                                        price: variables.staticData
                                                ?.PreTitledeedOqoodInitialSaleContractAed_2M ??
                                            '',
                                        pointExtra1: variables.staticData
                                                ?.StatementOfAccountForOffplanProperty ??
                                            '',
                                        point7: variables
                                                .staticData?.listOfDocuments ??
                                            '',
                                        isWill: false,
                                        point8: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        point9: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point10: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        isPadding: true,
                                      ),
                                      Divider(
                                        thickness: 1.w,
                                        height: 1.h,
                                        color: allColors.dividerColor,
                                      ),
                                      ExpandableCards(
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle: variables.staticData
                                                ?.titleDeedWithPartner ??
                                            '',
                                        name: variables.staticData?.option_04 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables.staticData
                                                ?.noteThatKidsAndRelativesOtherThanSpouseAre ??
                                            '',
                                        point2: variables.staticData
                                                ?.the10yearGoldenVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        pointExtra3: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        pointExtra4: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point4: variables.staticData
                                                ?.TitleDeedAed_4MillionMinimalValue ??
                                            '',
                                        point5: variables.staticData
                                                ?.NoMinimalPaidupAmountRequiredFromJan_2024 ??
                                            '',
                                        point6: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        price: '',
                                        point7: '',
                                        isWill: false,
                                        point8: '',
                                        point9: '',
                                        point10: '',
                                        isPadding: true,
                                      ),
                                      Divider(
                                        thickness: 1.w,
                                        height: 1.h,
                                        color: allColors.dividerColor,
                                      ),
                                      ExpandableCards(
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle:
                                            variables.staticData?.titleDeed ??
                                                '',
                                        name: variables.staticData?.option_05 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables.staticData
                                                ?.fullyPaid_PropertyHandedOver ??
                                            '',
                                        point2: variables
                                                .staticData?.the2yearVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        point4: variables.staticData
                                                ?.ValueOfThePropertyShouldBeOverAed_750000 ??
                                            '',
                                        point5: variables.staticData
                                                ?.TitleDeedMustBeInTheIndividualsNameNotTh ??
                                            '',
                                        point6: variables.staticData
                                                ?.SpouseHusbandOrWifeCanBeOnTheTitleDeedB ??
                                            '',
                                        price: variables.staticData
                                                ?.TitleDeedAed_4MillionMinimalValue ??
                                            '',
                                        point7: variables
                                                .staticData?.listOfDocuments ??
                                            '',
                                        isWill: false,
                                        pointExtra1: variables.staticData
                                                ?.NoMinimalPaidupAmountRequiredFromJan_2024 ??
                                            '',
                                        point8: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        point9: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point10: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        isPadding: true,
                                      ),
                                      Divider(
                                        thickness: 1.w,
                                        height: 1.h,
                                        color: allColors.dividerColor,
                                      ),
                                      ExpandableCards(
                                        isPadding: true,
                                        isVisa: true,
                                        isSix: false,
                                        isWillTitle: variables
                                                .staticData?.offplanProperty ??
                                            '',
                                        name: variables.staticData?.option_06 ??
                                            '',
                                        isSeven: false,
                                        isThree: false,
                                        point1: variables
                                                .staticData?.the2yearVisa ??
                                            '',
                                        point2: variables
                                                .staticData?.the2yearVisa ??
                                            '',
                                        point3: variables.staticData
                                                ?.goldenVisaRequirements ??
                                            '',
                                        point4: variables.staticData
                                                ?.ThePropertyDevelopmentThatReached_40OfCompl ??
                                            '',
                                        point5: variables.staticData
                                                ?.ValueOfThePropertyShouldBeOverAed_750000 ??
                                            '',
                                        point6: variables.staticData
                                                ?.TitleDeedAed_750000MinimalValue ??
                                            '',
                                        pointExtra3: variables.staticData
                                                ?.TitleDeedMustBeInTheIndividualsNameNotTh ??
                                            '',
                                        pointExtra4: variables.staticData
                                                ?.SpouseHusbandOrWifeCanBeOnTheTitleDeedB ??
                                            '',
                                        price: variables.staticData
                                                ?.PreTitledeedOqoodInitialSaleContract ??
                                            '',
                                        pointExtra1: variables.staticData
                                                ?.StatementOfAccountForOffplanProperty ??
                                            '',
                                        pointExtra2: variables.staticData
                                                ?.CopiesOfThePassportVisaAndEmiratesId ??
                                            '',
                                        point7: variables
                                                .staticData?.listOfDocuments ??
                                            '',
                                        isWill: false,
                                        point8: variables.staticData
                                                ?.CopyOfTheMedicalInsuranceIfAvailable ??
                                            '',
                                        point9: variables.staticData
                                                ?.HighResolutionPhotoOfApplicant ??
                                            '',
                                        point10: variables.staticData
                                                ?.GoodConductCertificateFromDubaiPolice ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      )
                                    ],
                                  ),
                                  containerColor: context.onPrimaryColor,
                                  containerBorderColor: context.onPrimaryColor),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ExpandableCards(
                        isVisa: false,
                        isEight: true,
                        isSix: false,
                        isWillTitle:
                            variables.staticData?.goldenVisaRequirements ?? '',
                        name: variables.staticData
                                ?.goldenVisaForHighsalaryProfessionals ??
                            '',
                        isSeven: false,
                        isThree: false,
                        point1: variables.staticData
                                ?.noObjectionLetterFromTheEmployerForGranting ??
                            '',
                        point2: variables.staticData?.passportCopy ?? '',
                        point3: variables.staticData?.visaCopy ?? '',
                        point4: variables.staticData
                                ?.bachelorsDegreeOrAHigherCertificateAttested_ ??
                            '',
                        point5: variables.staticData
                                ?.ForFreeZoneEmployeesSalaryCertificateIssued ??
                            '',
                        point6: variables.staticData
                                ?.ForMainlandEmployeesBothLabourContractFrom_ ??
                            '',
                        price: '',
                        point7: variables.staticData
                                ?.PersonalBankStatementCoveringTheLast_6Month ??
                            '',
                        isWill: false,
                        point8: variables.staticData?.personalPhoto ?? '',
                        point9: '',
                        point10: '',
                      ),
                      ExpandableCards(
                        isVisa: false,
                        isEight: true,
                        isSix: false,
                        isWillTitle:
                            variables.staticData?.goldenVisaRequirements ?? '',
                        name: variables.staticData
                                ?.goldenVisaForSpecialistsInEngineering_Scienc ??
                            '',
                        isSeven: false,
                        isThree: false,
                        point1: variables.staticData
                                ?.bachelorsDegreeOrAHigherCertificateAttested_ ??
                            '',
                        point2: variables.staticData
                                ?.workContractInOneOfTheFollowingFieldsVirol ??
                            '',
                        point3: variables.staticData
                                ?.salaryCertificateSalaryNotLessThanAed_30k ??
                            '',
                        point4:
                            variables.staticData?.the6MonthsBankStatement ?? '',
                        point5: variables.staticData
                                ?.noObjectionLetterFromTheEmployerForGranting ??
                            '',
                        point6: variables.staticData?.passportCopy ?? '',
                        price: '',
                        point7: variables.staticData?.visaCopy ?? '',
                        isWill: false,
                        point8: variables.staticData?.personalPhoto ?? '',
                        point9: '',
                        point10: '',
                      ),
                      ExpandableCards(
                        isVisa: false,
                        isEight: true,
                        isSix: false,
                        isWillTitle:
                            variables.staticData?.goldenVisaRequirements ?? '',
                        name: variables
                                .staticData?.goldenVisaForBankDepositInvestor ??
                            '',
                        isSeven: false,
                        isThree: false,
                        point1: variables.staticData
                                ?.aLetterFromTheBankInArabicConfirmingTheDe ??
                            '',
                        point2: variables.staticData?.passportCopy ?? '',
                        point3: variables.staticData?.visaCopy ?? '',
                        point4: variables.staticData
                                ?.bachelorsDegreeOrAHigherCertificateAttested_ ??
                            '',
                        point5: variables.staticData?.personalPhoto ?? '',
                        point6: variables
                                .staticData?.ejariIsNowAMandatoryRequirement ??
                            '',
                        price: '',
                        point7: '',
                        isWill: false,
                        point9: '',
                        point10: '',
                      ),
                      ExpandableCards(
                        isVisa: false,
                        isEight: true,
                        isSix: false,
                        isWillTitle:
                            variables.staticData?.goldenVisaRequirements ?? '',
                        name:
                            variables.staticData?.goldenVisaForSpecialTalent ??
                                '',
                        isSeven: false,
                        isThree: false,
                        point1: variables.staticData
                                ?.recommendationLetterFromTheRelevantAuthority ??
                            '',
                        point2:
                            variables.staticData?.cvportfoliomediaLinks ?? '',
                        point3: variables.staticData?.passportCopy ?? '',
                        point4: variables.staticData?.visa_EidCopy ?? '',
                        point5: variables.staticData?.personalPhoto ?? '',
                        point6: variables.staticData
                                ?.occupationToBePrintedOnTheVisaWillBeBased ??
                            '',
                        price: '',
                        point7: '',
                        isWill: false,
                        point8: '',
                        point9: '',
                        point10: '',
                      ),
                      ExpandableCards(
                        isVisa: false,
                        isEight: true,
                        isSix: false,
                        isWillTitle:
                            variables.staticData?.goldenVisaRequirements ?? '',
                        name: variables.staticData?.goldenVisaForRetired ?? '',
                        isSeven: false,
                        isThree: false,
                        point1: variables.staticData
                                ?.haveWorkedForNotLessThan_15YearsInsideOrO ??
                            '',
                        point2: variables.staticData
                                ?.orOwnAPropertypropertiesOfNoLessThanAed_1_ ??
                            '',
                        point3: variables.staticData
                                ?.orHaveFinancialSavingsOfNoLessThanAed_1Mi ??
                            '',
                        point4: variables.staticData?.visaValidFor_5Years ?? '',
                        point5: '',
                        point6: '',
                        price: '',
                        point7: '',
                        isWill: false,
                        point8: '',
                        point9: '',
                        point10: '',
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
