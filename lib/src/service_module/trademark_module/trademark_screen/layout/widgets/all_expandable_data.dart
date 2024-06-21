// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../widgets/expandable_card.dart';

class AllExpandableData extends StatelessWidget {
  DashboardState variables;
  AllExpandableData({super.key, required this.variables});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextWidget(
          color: allColors.lightTextColor,
          size: 18.sp,
          align: TextAlign.start,
          text:
              variables.staticData?.trademarkRegistrationRequirementsInTheUae ??
                  '',
          weight: FontWeight.w700,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
        ),
        ExpandableCards(
          price: '',
          name: variables.staticData?.individualApplicant ?? '',
          isSix: true,
          isSeven: false,
          isThree: false,
          point1: variables.staticData?.fullName ?? '',
          point2: variables.staticData?.residentialAddressOfThePerson ?? '',
          point3: variables.staticData?.passportCopy ?? '',
          point4:
              variables.staticData?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                  '',
          point5: variables
                  .staticData?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
              '',
          point6: variables
                  .staticData?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
              '',
          point7: '',
        ),
        ExpandableCards(
          price: '',
          name: variables.staticData?.uaeCompany_Business ?? '',
          isSix: true,
          isSeven: false,
          isThree: false,
          point1: variables.staticData?.fullName ?? '',
          point2: variables.staticData?.residentialAddressOfThePerson ?? '',
          point3: variables.staticData?.passportCopy ?? '',
          point4:
              variables.staticData?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                  '',
          point5: variables
                  .staticData?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
              '',
          point6: variables
                  .staticData?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
              '',
          point7: '',
        ),
        ExpandableCards(
          price: '',
          name: variables.staticData?.foreignCompany_Business ?? '',
          isSix: true,
          isSeven: false,
          isThree: false,
          point1: variables.staticData?.fullName ?? '',
          point2: variables.staticData?.residentialAddressOfThePerson ?? '',
          point3: variables.staticData?.passportCopy ?? '',
          point4:
              variables.staticData?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                  '',
          point5: variables
                  .staticData?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
              '',
          point6: variables
                  .staticData?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
              '',
          point7: '',
        ),
        CommonTextWidget(
          color: allColors.lightTextColor,
          size: 18.sp,
          align: TextAlign.start,
          text: variables
                  .staticData?.trademarkRegistrationForIndividualsBusinesses_ ??
              '',
          weight: FontWeight.w700,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
        ),
        ExpandableCards(
          price: variables.staticData?.aed_10909_5Vat ?? '',
          name: variables.staticData?.trademarkRegistration ?? '',
          isSix: false,
          isSeven: true,
          isThree: false,
          point1: variables.staticData?.idealForIndividualProprietor ?? '',
          point2: variables.staticData?.filingOfTrademarkApplication ?? '',
          point3: variables.staticData?.drafingOfTrademarkApplicationForm ?? '',
          point4:
              variables.staticData?.adviceOnTrademarkClassAndClassification ??
                  '',
          point5: variables.staticData?.nameSearchAndApproval ?? '',
          point6: variables.staticData?.regularUpdatesUntilRegistration ?? '',
          point7:
              variables.staticData?.excludesTheReplyToTrademarkObjections ?? '',
        ),
        ExpandableCards(
          price: variables.staticData?.aed_1135_5Vat ?? '',
          name: variables.staticData?.trademarkSearch_Price ?? '',
          isSix: false,
          isSeven: false,
          isThree: true,
          point1: variables
                  .staticData?.enablesTheCustomerToSubmitARequestForSearc ??
              '',
          point2: variables
                  .staticData?.facilitatesTheInvestigationOfExistingOrRegis ??
              '',
          point3: variables
                  .staticData?.assessesTheSimilarityBetweenTheProposedTrade ??
              '',
          point4: '',
          point5: '',
          point6: '',
          point7: '',
        ),
      ],
    );
  }
}
