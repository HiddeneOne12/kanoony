import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/service_module/register_will_module/register_will_form/register_will_form.dart';
import 'package:kanoony/src/service_module/widgets/expandable_card.dart';

import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../widgets/expandable_items.dart';
import 'widgets/information_for_will_cards.dart';
import 'widgets/no_of_steps_cards.dart';

class RegisterWillBody extends ConsumerStatefulWidget {
  const RegisterWillBody({super.key});

  @override
  ConsumerState<RegisterWillBody> createState() => _RegisterWillBodyState();
}

class _RegisterWillBodyState extends ConsumerState<RegisterWillBody> {
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
                height: isArabic ? 0.683.sh : 0.66.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        color: allColors.lightTextColor,
                        size: 14.sp,
                        align: TextAlign.start,
                        text: variables.staticData
                                ?.aWillIsOneOfTheMostImportantDocumentsThat ??
                            '',
                        weight: FontWeight.w400,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
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
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 18.sp,
                              text: variables.staticData
                                      ?.whatTypeOfDifcWillsMightBeRegistered ??
                                  '',
                              weight: FontWeight.w700,
                              align: TextAlign.center,
                              padding: EdgeInsets.only(
                                  left: 30.h, right: 30.h, top: 15.h),
                            ),
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 14.sp,
                              text: variables.staticData
                                      ?.currentlyItIsPossibleToRegisterFive_5Differ ??
                                  '',
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                              padding: EdgeInsets.only(
                                  left: 50.h,
                                  right: 50.h,
                                  top: 10.h,
                                  bottom: 10.h),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ExpandableItems(
                              title: variables.staticData?.fullDifcWill ?? '',
                              description: variables.staticData
                                      ?.toCoverAnyAndAllAspectsAndAssetsIeGuardia ??
                                  '',
                            ),
                            ExpandableItems(
                              title:
                                  variables.staticData?.guardianshipDifcWill ??
                                      '',
                              description: variables.staticData
                                      ?.limitedToGuardianshipProvisions ??
                                  '',
                            ),
                            ExpandableItems(
                              title:
                                  variables.staticData?.propertyDifcWill ?? '',
                              description: variables.staticData
                                      ?.upToFiveRealEstatePropertiesWithinTheUae ??
                                  '',
                            ),
                            ExpandableItems(
                              title: variables
                                      .staticData?.businessOwnersDifcWill ??
                                  '',
                              description: variables.staticData
                                      ?.upToFiveShareholdingsWithinTheUae ??
                                  '',
                            ),
                            ExpandableItems(
                              title: variables
                                      .staticData?.financialAssetsDifcWill ??
                                  '',
                              description: variables.staticData
                                      ?.upToTenBankAndorBrokerageAccountsRegistered ??
                                  '',
                            ),
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 14.sp,
                              text: variables.staticData
                                      ?.difcMirrorWillsAreAlsoAvailableInTheEvent_ ??
                                  '',
                              weight: FontWeight.w400,
                              align: TextAlign.center,
                              padding: EdgeInsets.only(
                                  left: 50.h,
                                  right: 50.h,
                                  top: 2.h,
                                  bottom: 10.h),
                            ),
                          ],
                        ),
                      ),
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 16.sp,
                        align: TextAlign.center,
                        text: variables.staticData
                                ?.whatAreTheInformationTypicallyRequestedToRe ??
                            '',
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 15.h, bottom: 10.h),
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the1TestatorsNationalityReligionAndIdDocuments ??
                            '',
                        icon: PngImagePaths.testatorImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData?.the2FamilyDeclaration ?? '',
                        icon: PngImagePaths.familyImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the3ListOfAssetsToBeCoveredByTheWill ??
                            '',
                        icon: PngImagePaths.listImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the4AppointmentOfAnExecutorAndASubstituteExec ??
                            '',
                        icon: PngImagePaths.appointmentImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the5InformationOnTheBeneficiariesAndTheirEntit ??
                            '',
                        icon: PngImagePaths.beneficiriImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the6InformationOnAnySpecificGiftOrWishesToBe ??
                            '',
                        icon: PngImagePaths.giftImg,
                      ),
                      InfoForWillItem(
                        text: variables.staticData
                                ?.the7InCaseOfMinorChildrenSpecificInstructionR ??
                            '',
                        icon: PngImagePaths.minorImg,
                      ),
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 18.sp,
                        align: TextAlign.start,
                        text: variables.staticData?.ourSteps ?? '',
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 16.h,
                          top: 15.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.h,
                            right: isArabic ? 16.h : 0.92.sw,
                            left: isArabic ? 0.92.sw : 16.h),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                          height: 1.h,
                        ),
                      ),
                      StepCards(
                        text: variables.staticData
                                ?.provideInformationAndDocumentsToPrepareTheW ??
                            '',
                        icon: PngImagePaths.step1Img,
                      ),
                      StepCards(
                        text: variables.staticData
                                ?.preparationOfTheWillAndValidationOfTheCont ??
                            '',
                        icon: PngImagePaths.step2Img,
                      ),
                      StepCards(
                        text: variables.staticData?.registrationOfTheWill ?? '',
                        icon: PngImagePaths.step31Img,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width.sw,
                        color: allColors.errorColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              color: allColors.canvasColor,
                              size: 18.sp,
                              text: variables.staticData?.pricing ?? '',
                              weight: FontWeight.w700,
                              align: TextAlign.start,
                              padding: EdgeInsets.only(
                                  left: 16.h,
                                  right: 16.h,
                                  top: 20.h,
                                  bottom: 15.h),
                            ),
                            ExpandableCards(
                              isSix: false,
                              isWillTitle: variables.staticData
                                      ?.forDifcAndAbuDhabiFullWillRegistration ??
                                  '',
                              name: variables.staticData?.oneWillRegistration ??
                                  '',
                              isSeven: true,
                              isThree: false,
                              point1:
                                  variables.staticData?.draftingOfTheWill ?? '',
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
                                  variables.staticData?.draftingOfTheWill ?? '',
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
                        ),
                      ),
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 18.sp,
                        align: TextAlign.start,
                        text: variables.staticData?.timeline ?? '',
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 16.h,
                          top: 20.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 15.h,
                            right: isArabic ? 16.h : 0.92.sw,
                            left: isArabic ? 0.92.sw : 16.h),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                          height: 1.h,
                        ),
                      ),
                      InfoForWillItem(
                        icon: "1",
                        text: variables.staticData?.drafting ?? '',
                        des: variables.staticData?.the1To_2WorkingDays ?? '',
                        isTimeline: true,
                      ),
                      InfoForWillItem(
                        icon: "2",
                        text: variables.staticData?.preparationAndValidation ??
                            '',
                        des: variables.staticData?.the3To_5WorkingDays ?? '',
                        isTimeline: true,
                      ),
                      InfoForWillItem(
                        icon: "3",
                        text: variables.staticData?.registration ?? '',
                        des: variables.staticData
                                ?.the1WorkingDayAccordingToAvailabilityOfTheWil ??
                            '',
                        isTimeline: true,
                      )
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
