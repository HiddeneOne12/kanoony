import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';

class SearchDocumentBody extends StatefulWidget {
  const SearchDocumentBody({super.key});

  @override
  State<SearchDocumentBody> createState() => _SearchDocumentBodyState();
}

class _SearchDocumentBodyState extends State<SearchDocumentBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonAppBar(
          mainText: 'SEARCH DOCUMENT',
          subText: '',
          height: 0.2,
          isBack: false,
          isBlogTextField: false,
          isSearch: false,
          isFilter: false,
          isButton: false,
          isTextfield: true,
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
              height: 0.6.sh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CommonTextWidget(
                    //     color: allColors.blackColor,
                    //     size: 13.sp,
                    //     text: 'Terms of Use (as updated on 12/03/2024)',
                    //     weight: FontWeight.w500,
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, top: 30.h)),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 16.h, right: 0.91.sw),
                    //   child: Divider(
                    //     color: allColors.primaryColor,
                    //     thickness: 1.w,
                    //   ),
                    // ),
                    // SizedBox(height: 5.h),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Please read these Terms thoroughly before accessing or using the Website. If you do not agree to these Terms, do not use the Website.',
                    //     padding: EdgeInsets.only(
                    //       left: 16.h,
                    //       right: 16.h,
                    //       bottom: 10.h,
                    //     )),
                    // CommonTextWidget(
                    //     color: allColors.blackColor,
                    //     size: 13.sp,
                    //     text: 'Contractual Relationship',
                    //     weight: FontWeight.w500,
                    //     padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 16.h, right: 0.91.sw),
                    //   child: Divider(
                    //     color: allColors.primaryColor,
                    //     thickness: 1.w,
                    //   ),
                    // ),
                    // SizedBox(height: 5.h),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Welcome to kanoony.com (the “Website”). The owner and operator of the Website are KANOONY CORPORATE SERVICES PROVIDERS L.L.C, a Limited Liability Company – Single Owner (LLC – SO) registered in the United Arab Emirates (“Kanoony”, “We”, “Us”, “Our”).',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'These Terms of Use (the “Terms”) govern the access to and/or use by you, from within any country in the world of the Website, its content and services, including but not limited to, electronic signature, downloads and uploads, display, delivery, acknowledgment, and storage for documents and other materials and instruments (the “Services”).',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Individuals under the age of 18 ("Minors") are not permitted to register as users or conduct transactions on this Website.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Usage of this Website affirms you are 18 years of age or older; any breach may result in immediate termination of your account.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.blackColor,
                    //     size: 13.sp,
                    //     text: 'Payment Terms',
                    //     weight: FontWeight.w500,
                    //     padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 16.h, right: 0.91.sw),
                    //   child: Divider(
                    //     color: allColors.primaryColor,
                    //     thickness: 1.w,
                    //   ),
                    // ),
                    // SizedBox(height: 5.h),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Payment: We accept Visa, MasterCard and American Express payments in the United Arab Emirates Dirham (AED).',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Currency: Payments in other currencies will be converted by your card provider, and we\'re not responsible for any losses from currency conversion.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Charges: We may apply a surcharge for Visa, MasterCard or American Express use, communicated to you before completing the payment.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Authorization: By agreeing to these terms, you authorize us to charge your card upon order confirmation.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 10.h)),
                    // CommonTextWidget(
                    //     color: allColors.textColor,
                    //     size: 13.sp,
                    //     weight: FontWeight.w400,
                    //     align: TextAlign.start,
                    //     text:
                    //         'Security: We use secure encryption to protect your card data.',
                    //     padding: EdgeInsets.only(
                    //         left: 16.h, right: 16.h, bottom: 30.h)),
                    // CommonButton(
                    //   padding: EdgeInsets.only(left: 16.h, right: 16.h),
                    //   text: "Request a Call Back",
                    //   onPressed: () {},
                    //   backgroundColor: allColors.primaryColor,
                    //   height: 38.h,
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
