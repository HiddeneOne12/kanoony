// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';

import '../../../dashboard_screen/provider/dashboard_provider.dart';

class isMainLandWidget extends StatelessWidget {
  DashboardState dashboardVariables;
  isMainLandWidget({super.key, required this.dashboardVariables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theDedIsTheGovernmentBodyResponsibleForReg ??
                '',
            questions: dashboardVariables
                    .staticData?.whatIsTheDubaiEconomicDepartmentDed ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.mainlandDubaiAllowsForVariousLegalStructures ??
                '',
            questions: dashboardVariables
                    .staticData?.whatAreTheTypesOfBusinessEntitiesICanEsta ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theMinimumCapitalRequirementCanVaryDepending ??
                '',
            questions: dashboardVariables
                    .staticData?.whatIsTheMinimumCapitalRequirementForSettin ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.noInMostCasesHoweverSomeActivitiesThatRequ ??
                '',
            questions: dashboardVariables
                    .staticData?.doINeedALocalSponsorToSetUpABusinessIn_ ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.theProcessMayInvolveObtainingInitialApproval ??
                '',
            questions: dashboardVariables
                    .staticData?.whatAreTheKeyStepsInvolvedInTheCompanySet ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.commonlyRequiredDocumentsIncludeAPassportCop ??
                '',
            questions: dashboardVariables
                    .staticData?.whatDocumentsAreRequiredForCompanyRegistrati ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.businessesAreTypicallyRequiredToRenewTheirT ??
                '',
            questions: dashboardVariables
                    .staticData?.whatAreTheOngoingComplianceRequirementsForB ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesForeignCompaniesCanEstablishABranchInMa ??
                '',
            questions: dashboardVariables
                    .staticData?.canAForeignCompanyOpenABranchInMainlandDu ??
                '',
            number: ''),
        FaqCard(
            isNumber: false,
            answer: dashboardVariables
                    .staticData?.yesCertainIndustriesMayHaveSpecificRequireme ??
                '',
            questions: dashboardVariables
                    .staticData?.areThereSpecificIndustriesWithAdditionalRegu ??
                '',
            number: ''),
      ],
    );
  }
}
