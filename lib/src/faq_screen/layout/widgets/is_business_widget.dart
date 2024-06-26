// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';

import '../../../dashboard_screen/provider/dashboard_provider.dart';

class isBusinessWidget extends StatelessWidget {
  DashboardState dashboardVariables;
  isBusinessWidget({super.key, required this.dashboardVariables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaqCard(
            isNumber: false,
            answer: dashboardVariables.staticData
                    ?.dubaiOffersVariousBusinessStructuresIncluding ??
                '',
            questions: dashboardVariables
                    .staticData?.whatTypesOfBusinessEntitiesAreAvailableIn_1 ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesInMostBusinessStructuresAndJurisdictions_ ??
                '',
            questions: dashboardVariables
                    .staticData?.canIOwn_100OfMyBusinessInDubai_2 ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.freeZonesAreDesignatedAreasWithSpecificRegu ??
                '',
            questions: dashboardVariables
                    .staticData?.whatIsAFreeZoneAndWhatAreTheAdvantages_3 ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.considerYourExpertiseMarketDemandAndLongterm ??
                '',
            questions: dashboardVariables
                    .staticData?.howDoIChooseTheRightBusinessActivityFor_4 ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theMinimumCapitalRequirementDependsOnTheBus ??
                '',
            questions: dashboardVariables
                    .staticData?.isThereAMinimumCapitalRequirementForStart_5 ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.toOpenABusinessBankAccountYoullNeedToSubm ??
                '',
            questions: dashboardVariables
                    .staticData?.the6HowDoIOpenABankForMyBusinessInDubai ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.registerTrademarksAndPatentsWithTheUaeMinis ??
                '',
            questions: dashboardVariables
                    .staticData?.the7HowCanIProtectMyIntellectualPropertyInDu ??
                '',
            number: ''),
      ],
    );
  }
}
