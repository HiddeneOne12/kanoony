import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/service_module/register_will_module/register_will_form/register_will_form.dart';
import 'package:kanoony/src/service_module/widgets/expandable_card.dart';

import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/constants/values.dart';
import '../../../../../core/helpers/pascal_case_converter.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../trademark_module/trademark_screen/layout/widgets/divider.dart';
import '../../../widgets/common_container.dart';
import '../../../widgets/expandable_items.dart';
import 'widgets/divider.dart';
import 'widgets/information_for_will_cards.dart';
import 'widgets/no_of_steps_cards.dart';

class RegisterWillBody extends ConsumerStatefulWidget {
  const RegisterWillBody({super.key});

  @override
  ConsumerState<RegisterWillBody> createState() => _RegisterWillBodyState();
}

class _RegisterWillBodyState extends ConsumerState<RegisterWillBody> {
  bool isExpanded = false;
  bool isPrice = false;
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
            mainText: variables.staticData?.willRegistrationInDubai ?? '',
            subText: '',
            height: isArabic ? 0.2 : 0.23,
            isBack: true,
            onClickTap: () {
              RoutesUtils.context.push(RegisterWillForm.registerWillFormRoute);
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
                        padding: kLeftRightPadding16,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            variables.staticData?.willRegistrationInDubai
                                    .upperCase() ??
                                '',
                            style: context.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.center,
                        child: ClickHereButton(
                          onTap: () {
                            RoutesUtils.context
                                .push(RegisterWillForm.registerWillFormRoute);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: kTitlePadding2,
                        child: Text(
                          variables.staticData
                                  ?.aWillIsOneOfTheMostImportantDocumentsThat
                                  .capitalizeFirstLetter() ??
                              '',
                          style: context.bodyMedium?.copyWith(
                              color: allColors.lightTextColor,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.textColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.h,
                                  right: 30.h,
                                  top: 15.h,
                                  bottom: 15.h),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        variables.staticData
                                                ?.whatTypeOfDifcWillsMightBeRegistered
                                                .capitalizeFirstLetter() ??
                                            '',
                                        style: context.titleMedium?.copyWith(
                                          color: context.onPrimaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onPrimaryColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded) ...[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 40.h, right: 40.h, bottom: 10.h),
                                child: Text(
                                  variables.staticData
                                          ?.currentlyItIsPossibleToRegisterFive_5Differ
                                          .capitalizeFirstLetter() ??
                                      '',
                                  style: context.bodyMedium?.copyWith(
                                      color: context.onPrimaryColor,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: kLeftRightPadding16,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: context.onPrimaryColor,
                                        width: 1.w),
                                    borderRadius: kBorderRadius6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ExpandableItems(
                                        title: variables
                                                .staticData?.fullDifcWill ??
                                            '',
                                        description: variables.staticData
                                                ?.toCoverAnyAndAllAspectsAndAssetsIeGuardia ??
                                            '',
                                      ),
                                      const WillDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.guardianshipDifcWill ??
                                            '',
                                        description: variables.staticData
                                                ?.limitedToGuardianshipProvisions ??
                                            '',
                                      ),
                                      const WillDivider(),
                                      ExpandableItems(
                                        title: variables
                                                .staticData?.propertyDifcWill ??
                                            '',
                                        description: variables.staticData
                                                ?.upToFiveRealEstatePropertiesWithinTheUae ??
                                            '',
                                      ),
                                      const WillDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.businessOwnersDifcWill ??
                                            '',
                                        description: variables.staticData
                                                ?.upToFiveShareholdingsWithinTheUae ??
                                            '',
                                      ),
                                      const WillDivider(),
                                      ExpandableItems(
                                        title: variables.staticData
                                                ?.financialAssetsDifcWill ??
                                            '',
                                        description: variables.staticData
                                                ?.upToTenBankAndorBrokerageAccountsRegistered ??
                                            '',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 40.h, right: 40.h, bottom: 10.h),
                                child: Text(
                                  variables.staticData
                                          ?.difcMirrorWillsAreAlsoAvailableInTheEvent_
                                          .capitalizeFirstLetter() ??
                                      '',
                                  style: context.bodyMedium?.copyWith(
                                      color: context.onPrimaryColor,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          capitalizeFirst(variables.staticData
                                  ?.whatAreTheInformationTypicallyRequestedToRe ??
                              ''),
                          style: context.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CommonContainer(
                        containerBorderColor: allColors.dividerColor,
                        containerColor: allColors.transparentColor,
                        widget: Column(
                          children: [
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the1TestatorsNationalityReligionAndIdDocuments ??
                                  '',
                              icon: PngImagePaths.testatorImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text:
                                  variables.staticData?.the2FamilyDeclaration ??
                                      '',
                              icon: PngImagePaths.familyImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the3ListOfAssetsToBeCoveredByTheWill ??
                                  '',
                              icon: PngImagePaths.listImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the4AppointmentOfAnExecutorAndASubstituteExec ??
                                  '',
                              icon: PngImagePaths.appointmentImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the5InformationOnTheBeneficiariesAndTheirEntit ??
                                  '',
                              icon: PngImagePaths.beneficiriImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the6InformationOnAnySpecificGiftOrWishesToBe ??
                                  '',
                              icon: PngImagePaths.giftImg,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              text: variables.staticData
                                      ?.the7InCaseOfMinorChildrenSpecificInstructionR ??
                                  '',
                              icon: PngImagePaths.minorImg,
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          capitalizeFirst(variables.staticData?.ourSteps ?? ''),
                          style: context.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CommonContainer(
                        containerBorderColor: context.primaryColor,
                        containerColor: context.primaryColor,
                        widget: Column(
                          children: [
                            StepCards(
                              text: variables.staticData
                                      ?.provideInformationAndDocumentsToPrepareTheW ??
                                  '',
                              icon: PngImagePaths.step1Img,
                            ),
                            const DividerWidget(),
                            StepCards(
                              text: variables.staticData
                                      ?.preparationOfTheWillAndValidationOfTheCont ??
                                  '',
                              icon: PngImagePaths.step2Img,
                            ),
                            const DividerWidget(),
                            StepCards(
                              text:
                                  variables.staticData?.registrationOfTheWill ??
                                      '',
                              icon: PngImagePaths.step31Img,
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.errorColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.h,
                                  right: 16.h,
                                  top: 20.h,
                                  bottom: 15.h),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPrice = !isPrice;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        capitalizeFirst(
                                            variables.staticData?.pricing ??
                                                ''),
                                        style: context.titleMedium?.copyWith(
                                            color: context.onPrimaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(
                                      isPrice
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onPrimaryColor,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (isPrice) ...[
                              ExpandableCards(
                                isSix: false,
                                isWillTitle: variables.staticData
                                        ?.forDifcAndAbuDhabiFullWillRegistration ??
                                    '',
                                name:
                                    variables.staticData?.oneWillRegistration ??
                                        '',
                                isSeven: true,
                                isThree: false,
                                point1:
                                    variables.staticData?.draftingOfTheWill ??
                                        '',
                                point2: variables.staticData
                                        ?.legalTranslationInArabicIfApplicable ??
                                    '',
                                point3: variables.staticData
                                        ?.coversDistributionOfAssetsInTheUaeAndAbroa ??
                                    '',
                                point4: variables.staticData
                                        ?.coversAppointmentOfGuardians ??
                                    '',
                                point5: variables.staticData
                                        ?.assistanceForTheRegistrationOfTheWillInclud ??
                                    '',
                                point6: variables.staticData
                                        ?.DifcAndWillsServiceCostsForOneWillAed_100 ??
                                    '',
                                price: variables.staticData?.aed_6500Vat ?? '',
                                point7: variables.staticData
                                        ?.AbuDhabiCourtWillServiceCostForOneWillAe ??
                                    '',
                                isWill: true,
                              ),
                              ExpandableCards(
                                isSix: false,
                                isWillTitle: variables.staticData
                                        ?.forDifcAndAbuDhabiFullMirrorWillRegistrati ??
                                    '',
                                name: variables
                                        .staticData?.mirrorWillRegistration ??
                                    '',
                                isSeven: true,
                                isThree: false,
                                point1:
                                    variables.staticData?.draftingOfTheWill ??
                                        '',
                                point2: variables.staticData
                                        ?.legalTranslationInArabicIfApplicable ??
                                    '',
                                point3: variables.staticData
                                        ?.coversDistributionOfAssetsInTheUaeAndAbroa ??
                                    '',
                                point4: variables.staticData
                                        ?.coversAppointmentOfGuardians ??
                                    '',
                                point5: variables.staticData
                                        ?.assistanceForTheRegistrationOfTheWillInclud ??
                                    '',
                                point6: variables.staticData
                                        ?.DifcAndWillsServiceCostsForMirrorWillAed_ ??
                                    '',
                                price: variables.staticData?.aed_8500Vat ?? '',
                                point7: variables.staticData
                                        ?.AbuDhabiCourtWillServiceCostForMirrorWill ??
                                    '',
                                isWill: true,
                              ),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: kTitlePadding,
                        child: Text(
                          capitalizeFirst(variables.staticData?.timeline
                                  .capitalizeFirstLetter() ??
                              ''),
                          style: context.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CommonContainer(
                        containerBorderColor: allColors.dividerColor,
                        containerColor: allColors.transparentColor,
                        widget: Column(
                          children: [
                            InfoForWillItem(
                              icon: "1",
                              text: variables.staticData?.drafting ?? '',
                              des: variables.staticData?.the1To_2WorkingDays ??
                                  '',
                              isTimeline: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "2",
                              text: variables
                                      .staticData?.preparationAndValidation ??
                                  '',
                              des: variables.staticData?.the3To_5WorkingDays ??
                                  '',
                              isTimeline: true,
                            ),
                            const DividerWidget(),
                            InfoForWillItem(
                              icon: "3",
                              text: variables.staticData?.registration ?? '',
                              des: variables.staticData
                                      ?.the1WorkingDayAccordingToAvailabilityOfTheWil ??
                                  '',
                              isTimeline: true,
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
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
