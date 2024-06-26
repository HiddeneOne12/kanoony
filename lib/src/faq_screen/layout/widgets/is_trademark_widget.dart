// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';

import '../../../dashboard_screen/provider/dashboard_provider.dart';

class isTradeMarkWidget extends StatelessWidget {
  DashboardState dashboardVariables;
  isTradeMarkWidget({super.key, required this.dashboardVariables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noTheProtectionOfTheMarkIsGrantedToTheSh ??
                '',
            questions: dashboardVariables
                    .staticData?.the1CanAPartOfTheRegisteredMarkBeUsedSepara ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.aTrademarkApplicationCoveringTheClassHeading ??
                '',
            questions: dashboardVariables
                    .staticData?.the2HowCanWeObtainTheMaximumProtectionInAPa ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noTheChargesRemainTheSameRegardlessOfTheN ??
                '',
            questions: dashboardVariables
                    .staticData?.the3DoTheChargesDifferBasedOnTheNumberOfIte ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noASeparateApplicationShouldBeFiledForEach ??
                '',
            questions: dashboardVariables.staticData
                    ?.the4IsFilingAMulticlassApplicationPossibleInU ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesWithinSixMonthsOfTheFilingDateOfThePr ??
                '',
            questions: dashboardVariables
                    .staticData?.the5IsItPossibleToClaimPriorityInUaeUnderTh ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesThePowerOfAttorneyShouldBeLegalizedUpT ??
                '',
            questions: dashboardVariables
                    .staticData?.the6IsItNecessaryToLegalizeThePowerOfAttorne ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theLegalizedPowerOfAttorneyShouldBeLocally_ ??
                '',
            questions: dashboardVariables
                    .staticData?.the7WhatAreTheTwoTypesOfAttestationOfThePow ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.ifThereIsNoUaeConsulateInTheApplicantsCou ??
                '',
            questions: dashboardVariables
                    .staticData?.the8WhatIsTheAlternativeIfThereIsNoUaeConsu ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.lateSubmissionOfThePowerOfAttorneyIsNoLon ??
                '',
            questions: dashboardVariables
                    .staticData?.the9IsLateSubmissionOfDocumentsPossibleInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer:
                dashboardVariables.staticData?.noACertifiedCopyIsSufficient ??
                    '',
            questions: dashboardVariables.staticData
                    ?.the10IsItNecessaryToLegalizeThePriorityDocume ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noBar_NightClubServicesAreNotApplicableIn_ ??
                '',
            questions: dashboardVariables.staticData
                    ?.the11CanBarServices_NightClubServicesBeRegist ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.class_33IsNotApplicableAccordingToTheLawHo ??
                '',
            questions: dashboardVariables.staticData
                    ?.the12IsClass_33AlcoholicDrinksApplicableInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noPorkMeatIsNotAllowedToBeRegistered ??
                '',
            questions: dashboardVariables
                    .staticData?.the13IsItPossibleToRegisterAMarkForPorkMeat ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noSuchServicesCanBeReplacedByUsingThePhra ??
                '',
            questions: dashboardVariables.staticData
                    ?.the14CanRetail_WholesaleServicesBeRegisteredIn ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesHoweverTheApplicantShouldSubmitEvidenceP ??
                '',
            questions: dashboardVariables
                    .staticData?.the15IsItPossibleToFileATrademarkWithTheGeo ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesFilingATrademarkApplicationWillCoverAll_ ??
                '',
            questions: dashboardVariables
                    .staticData?.the16WillTheProtectionInUaeExtendToTheSeven_ ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer:
                dashboardVariables.staticData?.noPriorUseIsNotCompulsory ?? '',
            questions: dashboardVariables
                    .staticData?.the17IsPriorUseOfAMarkCompulsoryInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesAConcernedCivilCourtMayOrderTheCancella ??
                '',
            questions: dashboardVariables
                    .staticData?.the18CanAThirdPartyFileACancellationActionOn ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesUaeAdoptedThe_10thEditionOfTheNiceClass ??
                '',
            questions: dashboardVariables
                    .staticData?.the19DidUaeAdoptTheNiceClassificationIfYesWh ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesASeriesOfMarksCanBeFiledInUaeAsANor ??
                '',
            questions: dashboardVariables
                    .staticData?.the20CanASeriesOfMarksBeFiledInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.notPossibleASeparateNationalApplicationShoul ??
                '',
            questions: dashboardVariables
                    .staticData?.the21IsItPossibleToFileASingleApplicationCov ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesJointApplicantsArePossibleProvidedThatTh ??
                '',
            questions: dashboardVariables
                    .staticData?.the22IsJointApplicantsPossibleInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.itIsPossibleToAmendAPendingTrademarkApplic ??
                '',
            questions: dashboardVariables.staticData
                    ?.the23IsItPossibleToAmendAFiledregisteredTrade ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesASloganCanBeFiledAndTreatedAsATradema ??
                '',
            questions: dashboardVariables
                    .staticData?.the24IsItPossibleToFileASloganInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noTrademarkMarkingIsNotCompulsory ??
                '',
            questions: dashboardVariables
                    .staticData?.the25IsTrademarkMarkingCompulsoryInUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.tmCanOnlyBeUsedWhenTheMarkIsUnderThePro ??
                '',
            questions: dashboardVariables
                    .staticData?.the26WhenCanWeUse____WithTheTrademarkCanItB ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theValidityOfTheTrademarkRegistrationIs_10Y ??
                '',
            questions: dashboardVariables.staticData
                    ?.the27WhatIsTheValidityOfTheTrademarkRegistrat ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theExpectedTimeframeForFilingATrademarkUpT ??
                '',
            questions: dashboardVariables
                    .staticData?.the28WhatIsTheExpectedTimeframeForFilingATra ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.uponReceivingTheInstructionsTheApplicationsC ??
                '',
            questions: dashboardVariables
                    .staticData?.the29WhatIsTheDurationOfEachProcessFilingPub ??
                '',
            number: ''),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
