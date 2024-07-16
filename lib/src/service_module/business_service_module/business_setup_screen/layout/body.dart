import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_freezone_screen/business_setup_freezone_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_mainland_screen/business_setup_mainland_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_offshore_screen/business_setup_offshore_screen.dart';
import 'package:kanoony/src/service_module/widgets/faq_button.dart';
import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/constants/values.dart';
import '../../../../faq_screen/faq_screen.dart';
import 'widgets/faq_cards_widget.dart';
import 'widgets/options_card_widget.dart';

class BusinessSetupBody extends ConsumerStatefulWidget {
  const BusinessSetupBody({super.key});

  @override
  ConsumerState<BusinessSetupBody> createState() => _BusinessSetupBodyState();
}

class _BusinessSetupBodyState extends ConsumerState<BusinessSetupBody> {
  bool selectedItem = false;

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
            mainText: variables.staticData?.businessSetupInUae ?? '',
            subText: '',
            height: isArabic ? 0.24 : 0.21,
            isBack: true,
            isFilter: false,
            isBlogTextField: false,
            isButton: true,
            isTextfield: false,
            isImage: true,
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
                height: 0.8.sh,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: kMainBodyPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18.h),
                        Padding(
                          padding: kHeadlineBottomPadding,
                          child: Align(
                            child: Text(
                              variables.staticData?.businessSetupInUae
                                      .upperCase() ??
                                  '',
                              style: context.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Text(
                          variables.staticData
                                  ?.enteringTheBusinessWorldOfTheUnitedArabEmi ??
                              '',
                          style: context.bodyMedium,
                          textAlign: TextAlign.justify,
                        ),
                        const Align(
                            alignment: Alignment.center,
                            child: CallBackButton()),
                        Padding(
                          padding: kHeadlineBottomPadding,
                          child: Text(
                            capitalizeFirst(variables
                                    .staticData?.yourDreamNeedsTheBestStart ??
                                ''),
                            style: context.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: kHeadlineBottomPadding,
                          child: Text(
                            variables.staticData
                                    ?.theUnitedArabEmiratesUaeOffersADiverseRang ??
                                '',
                            style: context.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            RoutesUtils.context.push(
                                BusinessSetupFreeZoneScreen.businessSetupRoute);
                          },
                          child: buildOptionCard(
                            context,
                            variables.staticData?.freezone ?? '',
                            variables.staticData
                                    ?.ifYouAreSeekingSpecializedPrivilegesAndAMo ??
                                '',
                            variables.staticData?.learnMore ?? '',
                          ),
                        ),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () {
                            RoutesUtils.context.push(BusinessSetupMainLandScreen
                                .businessSetupMainLandRoute);
                          },
                          child: buildOptionCard(
                            context,
                            variables.staticData?.mainland ?? '',
                            variables.staticData
                                    ?.stepIntoTheCoreOfTheUaesBusinessEnvironmen ??
                                '',
                            variables.staticData?.learnMore ?? '',
                          ),
                        ),
                        SizedBox(height: 10.h),
                        InkWell(
                          onTap: () {
                            RoutesUtils.context.push(BusinessSetupOffshoreScreen
                                .businessSetupOffshoreRoute);
                          },
                          child: buildOptionCard(
                            context,
                            variables.staticData?.offshore ?? '',
                            variables.staticData
                                    ?.forThoseWithAVisionBeyondTheLocalHorizons_ ??
                                '',
                            variables.staticData?.learnMore ?? '',
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedItem = !selectedItem;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  variables.staticData
                                          ?.whyIsDubaiTheTopPickForSavvyBusinessLeade
                                          .capitalizeFirstLetter() ??
                                      '',
                                  style: context.titleMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Icon(
                                selectedItem
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: allColors.textColor,
                                size: 25,
                              ),
                              SizedBox(
                                width: 20.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (selectedItem) ...[
                          FaqItems(
                            name: variables.staticData?.taxIncentives_1 ?? '',
                            description: variables.staticData
                                    ?.oneOfThePrimaryLuresOfDubaiIsItsTaxfriend ??
                                '',
                            number: '',
                          ),
                          FaqItems(
                            name: variables.staticData
                                    ?.strategicGeographicalLocation_2 ??
                                '',
                            description: variables.staticData
                                    ?.dubaisPositioningIsNothingShortOfStrategicB ??
                                '',
                            number: '',
                          ),
                          FaqItems(
                            name: variables
                                    .staticData?.worldclassInfrastructure_3 ??
                                '',
                            description: variables.staticData
                                    ?.dubaiDoesntJustProvideABusinessfriendlyEnvir ??
                                '',
                            number: '',
                          ),
                          FaqItems(
                            name: variables
                                    .staticData?.diverseEconomicLandscape_4 ??
                                '',
                            description: variables.staticData
                                    ?.contraryToThePrevalentPerceptionDubaisEconom ??
                                '',
                            number: '',
                          ),
                          FaqItems(
                            name: variables.staticData
                                    ?.streamlinedBusinessIncorporation_5 ??
                                '',
                            description: variables.staticData
                                    ?.dubaiUnderstandsTheValueOfTimeForBusinessL ??
                                '',
                            number: '',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FaqButton(
                            onTap: () {
                              RoutesUtils.context.push(
                                FaqScreen.faqRoute,
                                extra: {
                                  TextUtils.isBusiness: true,
                                  TextUtils.isFreeZone: false,
                                  TextUtils.isMainland: false,
                                  TextUtils.isOffshore: false,
                                  TextUtils.isTrademark: false
                                },
                              );
                            },
                            isCallIcon: false,
                            backgroundColor: context.onSurfaceColor,
                          ),
                        ],
                        SizedBox(
                          height: 50.h,
                        )
                      ],
                    ),
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
