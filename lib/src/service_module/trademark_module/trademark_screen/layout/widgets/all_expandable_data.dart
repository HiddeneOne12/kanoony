// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/values.dart';
import '../../../../../../core/helpers/pascal_case_converter.dart';
import '../../../../widgets/expandable_card.dart';

class AllExpandableData extends StatefulWidget {
  DashboardState variables;
  AllExpandableData({super.key, required this.variables});

  @override
  State<AllExpandableData> createState() => _AllExpandableDataState();
}

class _AllExpandableDataState extends State<AllExpandableData> {
  bool isRequirements = false;
  bool isRegister = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isRequirements = !isRequirements;
            });
          },
          child: Padding(
            padding: kLeftRightPadding50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    capitalizeFirst(
                      widget.variables.staticData
                              ?.trademarkRegistrationRequirementsInTheUae
                              ?.capitalizeFirstLetter() ??
                          '',
                    ),
                    style: context.titleMedium
                        ?.copyWith(color: allColors.lightTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(
                  isRequirements
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: context.onSurfaceColor,
                  size: 25,
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
            ),
          ),
        ),
        if (isRequirements) ...[
          ExpandableCards(
            price: '',
            name: widget.variables.staticData?.individualApplicant ?? '',
            isSix: true,
            isSeven: false,
            isThree: false,
            point1: widget.variables.staticData?.fullName ?? '',
            point2:
                widget.variables.staticData?.residentialAddressOfThePerson ??
                    '',
            point3: widget.variables.staticData?.passportCopy ?? '',
            point4: widget.variables.staticData
                    ?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                '',
            point5: widget.variables.staticData
                    ?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
                '',
            point6: widget.variables.staticData
                    ?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
                '',
            point7: '',
          ),
          ExpandableCards(
            price: '',
            name: widget.variables.staticData?.uaeCompany_Business ?? '',
            isSix: true,
            isSeven: false,
            isThree: false,
            point1: widget.variables.staticData?.fullName ?? '',
            point2:
                widget.variables.staticData?.residentialAddressOfThePerson ??
                    '',
            point3: widget.variables.staticData?.passportCopy ?? '',
            point4: widget.variables.staticData
                    ?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                '',
            point5: widget.variables.staticData
                    ?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
                '',
            point6: widget.variables.staticData
                    ?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
                '',
            point7: '',
          ),
          ExpandableCards(
            price: '',
            name: widget.variables.staticData?.foreignCompany_Business ?? '',
            isSix: true,
            isSeven: false,
            isThree: false,
            point1: widget.variables.staticData?.fullName ?? '',
            point2:
                widget.variables.staticData?.residentialAddressOfThePerson ??
                    '',
            point3: widget.variables.staticData?.passportCopy ?? '',
            point4: widget.variables.staticData
                    ?.aListOfGoodsservicesToBeCoveredByTheAppli ??
                '',
            point5: widget.variables.staticData
                    ?.softCopyelectronicCopyOfTheMarkToBeRegiste ??
                '',
            point6: widget.variables.staticData
                    ?.powerOfAttorneyNotarizedByTheNotaryPublicA ??
                '',
            point7: '',
          ),
        ],
        InkWell(
          onTap: () {
            setState(() {
              isRegister = !isRegister;
            });
          },
          child: Padding(
            padding: kLeftRightPadding50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    capitalizeFirst(
                      widget.variables.staticData
                              ?.trademarkRegistrationForIndividualsBusinesses_
                              ?.capitalizeFirstLetter() ??
                          '',
                    ),
                    style: context.titleMedium
                        ?.copyWith(color: allColors.lightTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(
                  isRegister
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: context.onSurfaceColor,
                  size: 25,
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
            ),
          ),
        ),
        if (isRegister) ...[
          ExpandableCards(
            price: widget.variables.staticData?.aed_10909_5Vat ?? '',
            name: widget.variables.staticData?.trademarkRegistration ?? '',
            isSix: false,
            isSeven: true,
            isThree: false,
            point1:
                widget.variables.staticData?.idealForIndividualProprietor ?? '',
            point2:
                widget.variables.staticData?.filingOfTrademarkApplication ?? '',
            point3: widget
                    .variables.staticData?.drafingOfTrademarkApplicationForm ??
                '',
            point4: widget.variables.staticData
                    ?.adviceOnTrademarkClassAndClassification ??
                '',
            point5: widget.variables.staticData?.nameSearchAndApproval ?? '',
            point6:
                widget.variables.staticData?.regularUpdatesUntilRegistration ??
                    '',
            point7: widget.variables.staticData
                    ?.excludesTheReplyToTrademarkObjections ??
                '',
          ),
          ExpandableCards(
            price: widget.variables.staticData?.aed_1135_5Vat ?? '',
            name: widget.variables.staticData?.trademarkSearch_Price ?? '',
            isSix: false,
            isSeven: false,
            isThree: true,
            point1: widget.variables.staticData
                    ?.enablesTheCustomerToSubmitARequestForSearc ??
                '',
            point2: widget.variables.staticData
                    ?.facilitatesTheInvestigationOfExistingOrRegis ??
                '',
            point3: widget.variables.staticData
                    ?.assessesTheSimilarityBetweenTheProposedTrade ??
                '',
            point4: '',
            point5: '',
            point6: '',
            point7: '',
          ),
        ]
      ],
    );
  }
}
