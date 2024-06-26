// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';

import '../../../dashboard_screen/provider/dashboard_provider.dart';

class isFreeZoneWidget extends StatelessWidget {
  DashboardState dashboardVariables;
  isFreeZoneWidget({super.key, required this.dashboardVariables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.freeZonesAreDesignatedAreasWithSpecificRegu ??
                '',
            questions: dashboardVariables
                    .staticData?.the1WhatIsAFreeZoneAndWhatAreTheAdvantages_ ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesDubaisFreeZonesAreOftenIndustryspecificS ??
                '',
            questions: dashboardVariables.staticData
                    ?.the3IsThereASpecificBusinessActivityOrIndustr ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesManyFreeZonesInDubaiAllowCompaniesToOp ??
                '',
            questions: dashboardVariables
                    .staticData?.the4CanIHaveALocalBankAccountForMyFreeZone ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.mostFreeZonesInDubaiRequireCompaniesToHave ??
                '',
            questions: dashboardVariables
                    .staticData?.the5DoINeedAPhysicalOfficeSpaceInTheFreeZo ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesMostFreeZonesAllowCompaniesToSponsorVis ??
                '',
            questions: dashboardVariables
                    .staticData?.the6IsThereAVisaRequirementForEmployeesInAD ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.commonlyRequiredDocumentsIncludeAPassportCop ??
                '',
            questions: dashboardVariables.staticData
                    ?.the7WhichDocumentsAreRequiredForCompanyRegistr ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noInMostDubaiFreeZones_100ForeignOwnership_ ??
                '',
            questions: dashboardVariables
                    .staticData?.the8IsItMandatoryToHaveAUaeNationalAsAShar ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.ongoingComplianceVariesBetweenFreezonesThisI ??
                '',
            questions: dashboardVariables.staticData
                    ?.the9WhatAreTheOngoingComplianceRequirementsAft ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.someFreeZonesAllowMultipleBusinessActivities ??
                '',
            questions: dashboardVariables.staticData
                    ?.the10CanIHaveMultipleBusinessActivitiesUnderO ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.freeZonesTypicallyOfferExemptionFromCustoms_ ??
                '',
            questions: dashboardVariables.staticData
                    ?.the11AreThereAnySpecificCustomsDutiesOrImport ??
                '',
            number: ''),
      ],
    );
  }
}
