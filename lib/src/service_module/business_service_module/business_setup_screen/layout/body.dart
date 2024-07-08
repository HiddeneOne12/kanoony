import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_freezone_screen/business_setup_freezone_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_mainland_screen/business_setup_mainland_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_offshore_screen/business_setup_offshore_screen.dart';
import 'package:kanoony/src/service_module/widgets/faq_button.dart';
import '../../../../../core/common_widgets/common_appbar.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../faq_screen/faq_screen.dart';
import 'widgets/faq_cards_widget.dart';
import 'widgets/options_card_widget.dart';

class BusinessSetupBody extends ConsumerStatefulWidget {
  const BusinessSetupBody({super.key});

  @override
  ConsumerState<BusinessSetupBody> createState() => _BusinessSetupBodyState();
}

class _BusinessSetupBodyState extends ConsumerState<BusinessSetupBody> {
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
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                        
                        color: allColors.textColor,
                        size: 18.sp,
                        text:
                            variables.staticData?.yourDreamNeedsTheBestStart?.toUpperCase() ??
                                '',
                        weight: FontWeight.w500,
                        align: TextAlign.start,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 15.h),
                            
                      ),
                      CommonTextWidget(
                        
                        color: allColors.textColor,
                        size: 16,
                        align: TextAlign.start,
                        text: variables.staticData
                                ?.theUnitedArabEmiratesUaeOffersADiverseRang ??
                            '',
                        weight: FontWeight.w400,
                        padding: EdgeInsets.only(
                            left: 16.h, right: 16.h, top: 10.h, bottom: 10.h),
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
                      CommonTextWidget(
                        color: allColors.textColor,
                        size: 18.sp,
                        text: variables.staticData
                                ?.whyIsDubaiTheTopPickForSavvyBusinessLeade?.toUpperCase() ??
                            '',
                        weight: FontWeight.w500,
                        align: TextAlign.start,
                        padding:
                            EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FaqItems(
                        name: variables.staticData?.taxIncentives_1 ?? '',
                        description: variables.staticData
                                ?.oneOfThePrimaryLuresOfDubaiIsItsTaxfriend ??
                            '',
                        number: '',
                      ),
                      FaqItems(
                        name: variables
                                .staticData?.strategicGeographicalLocation_2 ??
                            '',
                        description: variables.staticData
                                ?.dubaisPositioningIsNothingShortOfStrategicB ??
                            '',
                        number: '',
                      ),
                      FaqItems(
                        name:
                            variables.staticData?.worldclassInfrastructure_3 ??
                                '',
                        description: variables.staticData
                                ?.dubaiDoesntJustProvideABusinessfriendlyEnvir ??
                            '',
                        number: '',
                      ),
                      FaqItems(
                        name:
                            variables.staticData?.diverseEconomicLandscape_4 ??
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
                      const SizedBox(height: 10,),
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
                        backgroundColor: allColors.textColor,
                      ),
                      SizedBox(
                        height: 20.h,
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
