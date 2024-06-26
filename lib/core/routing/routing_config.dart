import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/about_us_screen/about_us_screen.dart';
import 'package:kanoony/src/blog_module/blog_detail_screen/blog_detail_screen.dart';
import 'package:kanoony/src/blog_module/blog_listing_screen/blog_listing_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_freezone_screen/business_setup_freezone_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_mainland_screen/business_setup_mainland_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_offshore_screen/business_setup_offshore_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_screen/business_setup_screen.dart';
import 'package:kanoony/src/document_module/menu_document_screen/menu_document_screen.dart';
import 'package:kanoony/src/document_module/paid_document_screen/paid_doucment_screen.dart';
import 'package:kanoony/src/contact_us_screen/contact_us_screen.dart';
import 'package:kanoony/src/document_module/document_details_screen/document_details_screen.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/email_verification_screen/email_verification_screen.dart';
import 'package:kanoony/src/faq_screen/faq_screen.dart';
import 'package:kanoony/src/favorite_screen/favorite_screen.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/fogot_password_screen/forgot_password_screen.dart';
import 'package:kanoony/src/document_module/free_document_screen/free_document_screen.dart';
import 'package:kanoony/src/news_module/news_listing_screen/news_listing_screen.dart';
import 'package:kanoony/src/packages_screen/package_screen.dart';
import 'package:kanoony/src/privacy_policy_screen/privacy_screen.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/reset_password_screen/reset_password_screen.dart';
import 'package:kanoony/src/document_module/search_document_screen/search_document_screen.dart';
import 'package:kanoony/src/service_module/document_translate_screen/document_translate_screen.dart';
import 'package:kanoony/src/service_module/golden_visa_screen/golden_visa_screen.dart';
import 'package:kanoony/src/service_module/register_will_module/register_will_form/register_will_form.dart';
import 'package:kanoony/src/service_module/register_will_module/register_will_screen/register_will_screen.dart';
import 'package:kanoony/src/service_module/service_screen/service_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/register_trademark_screen/register_trademark_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';
import 'package:kanoony/src/terms_of_use/terms_of_use_screen.dart';
import 'package:kanoony/src/user_profile_screen/user_profile_screen.dart';

import '../../src/dashboard_screen/dashboard_screen.dart';
import '../../src/auth_module/login_screen/login_screen.dart';
import '../../src/document_module/my_documents_screen/my_document_screen.dart';
import '../../src/auth_module/register_screen/register_screen.dart';
import '../../src/splash_screen/splash_screen.dart';
import '../constants/static_constants/static_constants.dart';

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

class RoutesUtils {
  //

  static var navigatorKeyGlobalC = GlobalKey<NavigatorState>();

  static BuildContext context = navigatorKeyGlobalC.currentState!.context;
}

Future<T?> toNext<T>({required Widget widget}) => Navigator.push<T?>(
      RoutesUtils.context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );

toRemoveAll({required Widget widget}) => Navigator.pushAndRemoveUntil(
    RoutesUtils.context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
    (c) => false);

var routerConfigs = GoRouter(
  initialLocation: SplashScreen.splashRoute,
  navigatorKey: RoutesUtils.navigatorKeyGlobalC,
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: SplashScreen.splashRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashScreen());
      },
    ),
    GoRoute(
      path: LoginScreen.loginRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: RegisterScreen.registerRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RegisterScreen());
      },
    ),
    GoRoute(
      path: DashBoardScreen.dashboardRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: DashBoardScreen());
      },
    ),
    GoRoute(
      path: ForgotPasswordScreen.forgotPasswordRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ForgotPasswordScreen());
      },
    ),
    GoRoute(
      path: EmailVerificationScreen.emailVerificationRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: EmailVerificationScreen(
          email: extra?[TextUtils.email],
        ));
      },
    ),
    GoRoute(
      path: ResetPasswordScreen.resetPasswordPasswordRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: ResetPasswordScreen(
          email: extra?[TextUtils.email],
        ));
      },
    ),
    GoRoute(
      path: UserProfileScreen.profileRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: UserProfileScreen());
      },
    ),
    GoRoute(
      path: FavoriteScreen.favoriteRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: FavoriteScreen());
      },
    ),
    GoRoute(
      path: MyDocumentScreen.myDocumentRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: MyDocumentScreen());
      },
    ),
    GoRoute(
      path: PrivacyScreen.privacyRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: PrivacyScreen());
      },
    ),
    GoRoute(
      path: TermsOfUseScreen.termOfUseRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: TermsOfUseScreen());
      },
    ),
    GoRoute(
      path: BlogListingScreen.blogListingRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BlogListingScreen());
      },
    ),
    GoRoute(
      path: BlogDetailScreen.blogDetailRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BlogDetailScreen());
      },
    ),
    GoRoute(
      path: BusinessSetupScreen.businessSetupRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BusinessSetupScreen());
      },
    ),
    GoRoute(
      path: FaqScreen.faqRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: FaqScreen(
          isBusiness: extra?[TextUtils.isBusiness],
          isFreeLand: extra?[TextUtils.isFreeZone],
          isMainland: extra?[TextUtils.isMainland],
          isOffshore: extra?[TextUtils.isOffshore],
          isTrademark: extra?[TextUtils.isTrademark],
        ));
      },
    ),
    GoRoute(
      path: SearchDocumentScreen.searchDocumentRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SearchDocumentScreen());
      },
    ),
    GoRoute(
      path: DocumentDetailScreen.documentDetailRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: DocumentDetailScreen(
          slug: extra?[TextUtils.slug],
        ));
      },
    ),
    GoRoute(
      path: MenuDocumentScreen.menuDocumentRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: MenuDocumentScreen(
          slug: extra?[TextUtils.slug],
        ));
      },
    ),
    GoRoute(
      path: ContactUsScreen.contactUsRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ContactUsScreen());
      },
    ),
    GoRoute(
      path: BusinessSetupMainLandScreen.businessSetupMainLandRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BusinessSetupMainLandScreen());
      },
    ),
    GoRoute(
      path: BusinessSetupOffshoreScreen.businessSetupOffshoreRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BusinessSetupOffshoreScreen());
      },
    ),
    GoRoute(
      path: FreeDocumentScreen.freeDocumentRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: FreeDocumentScreen());
      },
    ),
    GoRoute(
      path: PaidDocumentScreen.paidDocumentRoute,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: PaidDocumentScreen(
          slug: extra?[TextUtils.slug],
        ));
      },
    ),
    GoRoute(
      path: NewsListingScreen.newsRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: NewsListingScreen());
      },
    ),
    GoRoute(
      path: BusinessSetupFreeZoneScreen.businessSetupRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BusinessSetupFreeZoneScreen());
      },
    ),
    GoRoute(
      path: PackageScreen.packageRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: PackageScreen());
      },
    ),
    GoRoute(
      path: ServiceScreen.serviceRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ServiceScreen());
      },
    ),
    GoRoute(
      path: AboutUsScreen.aboutUsRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: AboutUsScreen());
      },
    ),
    GoRoute(
      path: TradeMarkScreen.trademarkRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: TradeMarkScreen());
      },
    ),
    GoRoute(
      path: RegisterTradeMarkScreen.trademarkRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RegisterTradeMarkScreen());
      },
    ),
    GoRoute(
      path: RegisterWillScreen.willRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RegisterWillScreen());
      },
    ),
    GoRoute(
      path: RegisterWillForm.registerWillFormRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: RegisterWillForm());
      },
    ),
    GoRoute(
      path: DocTranslateScreen.docTranslateRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: DocTranslateScreen());
      },
    ),
    GoRoute(
      path: GoldenVisaScreen.visaRoute,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: GoldenVisaScreen());
      },
    ),
  ],
);
