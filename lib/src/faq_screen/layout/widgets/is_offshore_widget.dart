// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';

import '../../../dashboard_screen/provider/dashboard_provider.dart';

class isOffshoreWidget extends StatelessWidget {
  DashboardState dashboardVariables;
  isOffshoreWidget({super.key, required this.dashboardVariables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.anOffshoreCompanyIsALegalEntityRegisteredI ??
                '',
            questions: dashboardVariables
                    .staticData?.the1WhatIsAnOffshoreCompanyInTheUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.somePopularFreeZonesForOffshoreCompanyRegis ??
                '',
            questions: dashboardVariables
                    .staticData?.the2WhichZonesInTheUaeAllowTheRegistrationOf ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables.staticData
                    ?.benefitsMayIncludeTaxAdvantagesConfidentialit ??
                '',
            questions: dashboardVariables
                    .staticData?.the3WhatAreTheKeyAdvantagesOfSettingUpAnOff ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.generallyOffshoreCompaniesInTheUaeAreNotRe ??
                '',
            questions: dashboardVariables
                    .staticData?.the4IsItMandatoryToHaveAPhysicalOfficeForAn ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.offshoreCompaniesInTheUaeOftenDoNotHaveSt ??
                '',
            questions: dashboardVariables.staticData
                    ?.the5AreThereAnyMinimumCapitalRequirementsForO ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.offshoreCompaniesAreUsuallyRestrictedFromCon ??
                '',
            questions: dashboardVariables.staticData
                    ?.the6WhatTypesOfActivitiesCanOffshoreCompanies_ ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesOffshoreCompaniesAreGenerallyAllowedToOp ??
                '',
            questions: dashboardVariables
                    .staticData?.the7CanAnOffshoreCompanyOpenABankAccountInT ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.offshoreCompaniesAreTypicallySubjectToMinima ??
                '',
            questions: dashboardVariables.staticData
                    ?.the8WhatAreTheReportingAndComplianceRequiremen ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.offshoreCompaniesCanOftenOwnPropertyInDesig ??
                '',
            questions: dashboardVariables
                    .staticData?.the9CanAnOffshoreCompanyOwnPropertyInTheUae ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noOffshoreCompaniesInTheUaeDoNotRequireA_ ??
                '',
            questions: dashboardVariables
                    .staticData?.the10IsThereANeedForALocalSponsorForOffshor ??
                '',
            number: ''),
      ],
    );
  }
}
