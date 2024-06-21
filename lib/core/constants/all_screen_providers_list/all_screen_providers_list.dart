import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/src/packages_screen/service/package_service.dart';
import 'package:kanoony/src/privacy_policy_screen/provider/privacy_policy_provider.dart';
import 'package:kanoony/src/privacy_policy_screen/service/privacy_policy_service.dart';
import 'package:kanoony/src/service_module/business_service_module/service/business_service.dart';
import 'package:kanoony/src/service_module/register_will_module/service/register_will_service.dart';
import '../../../src/auth_module/forgot_password_module/provider/forgot_password_provider.dart';
import '../../../src/auth_module/forgot_password_module/service/forgot_password_service.dart';
import '../../../src/dashboard_screen/provider/dashboard_provider.dart';
import '../../../src/dashboard_screen/services/dashboard_service.dart';
import '../../../src/auth_module/login_screen/provider/login_provider.dart';
import '../../../src/auth_module/login_screen/service/login_service.dart';
import '../../../src/auth_module/register_screen/provider/register_provider.dart';
import '../../../src/auth_module/register_screen/service/register_service.dart';
import '../../../src/document_module/document_details_screen/provider/doc_detail_provider.dart';
import '../../../src/document_module/document_details_screen/service/doc_detail_service.dart';
import '../../../src/document_module/menu_document_screen/provider/menu_doc_provider.dart';
import '../../../src/document_module/menu_document_screen/service/menu_doc_service.dart';
import '../../../src/faq_screen/provider/faq_provider.dart';
import '../../../src/faq_screen/service/faq_service.dart';
import '../../../src/favorite_screen/provider/fav_doc_provider.dart';
import '../../../src/favorite_screen/services/fav_doc_services.dart';
import '../../../src/document_module/free_document_screen/provider/free_documents_provider.dart';
import '../../../src/document_module/free_document_screen/service/free_document_service.dart';
import '../../../src/document_module/my_documents_screen/provider/my_doc_provider.dart';
import '../../../src/document_module/my_documents_screen/service/my_document_service.dart';
import '../../../src/packages_screen/provider/package_provider.dart';
import '../../../src/document_module/paid_document_screen/provider/paid_doc_provider.dart';
import '../../../src/document_module/paid_document_screen/service/paid_doc_service.dart';
import '../../../src/service_module/business_service_module/provider/business_provider.dart';
import '../../../src/service_module/document_translate_screen/provider/doc_translate_provider.dart';
import '../../../src/service_module/document_translate_screen/service/translate_doc_service.dart';
import '../../../src/service_module/golden_visa_screen/provider/golden_visa_provider.dart';
import '../../../src/service_module/golden_visa_screen/service/golden_visa_service.dart';
import '../../../src/service_module/register_will_module/provider/register_will_provider.dart';
import '../../../src/service_module/trademark_module/provider/trademark_provider.dart';
import '../../../src/service_module/trademark_module/service/trademark_service.dart';
import '../../../src/terms_of_use/provider/terms_of_use_provider.dart';
import '../../../src/terms_of_use/service/terms_of_use_service.dart';
import '../../../src/user_profile_screen/provider/user_profile_provider.dart';
import '../../../src/user_profile_screen/user_profile_service/user_profile_service.dart';
import '../object_constants/object_constants.dart';

class AllScreenProvidersList {
  /// Login Provider
  final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
    LoginService loginService = ref.watch(allServicesList.loginService);

    return LoginNotifier(loginService: loginService);
  });

  /// Register Provider
  final registerProvider =
      StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
    RegisterService registerService =
        ref.watch(allServicesList.registerService);

    return RegisterNotifier(registerService: registerService);
  });

  /// User Profile Provider
  final userProfileProvider =
      StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
    UserProfileService userProfileService =
        ref.watch(allServicesList.userProfileService);

    return UserProfileNotifier(userProfileService: userProfileService);
  });

  /// Dashboard Provider
  final dashboardProvider =
      StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
    DashboardService dashboardService =
        ref.watch(allServicesList.dashboardService);

    return DashboardNotifier(dashboardService: dashboardService);
  });

  /// Privacy Policy Provider
  final privacyPolicyProvider =
      StateNotifierProvider<PrivacyPolicyNotifier, PrivacyPolicyState>((ref) {
    PrivacyPolicyService privacyPolicyService =
        ref.watch(allServicesList.privacyPolicyService);

    return PrivacyPolicyNotifier(privacyPolicyService: privacyPolicyService);
  });

  /// Terms Of Use Provider
  final termsOfUseProvider =
      StateNotifierProvider<TermsOfUseNotifier, TermsOfUseState>((ref) {
    TermsOfUseService termsOfUseService =
        ref.watch(allServicesList.termsOfUseService);

    return TermsOfUseNotifier(termsOfUseService: termsOfUseService);
  });

  /// Faqs Provider
  final faqsProvider = StateNotifierProvider<FaqsNotifier, FaqsState>((ref) {
    FaqService faqService = ref.watch(allServicesList.faqsService);

    return FaqsNotifier(faqService: faqService);
  });

  /// Free Document Provider
  final freeDocProvider =
      StateNotifierProvider<FreeDocNotifier, FreeDocState>((ref) {
    FreeDocumentService freeDocumentService =
        ref.watch(allServicesList.freeDocService);

    return FreeDocNotifier(freeDocumentService: freeDocumentService);
  });

  /// Paid Document Provider
  final paidDocProvider =
      StateNotifierProvider<PaidDocNotifier, PaidDocState>((ref) {
    PaidDocService paidDocumentService =
        ref.watch(allServicesList.paidDocService);

    return PaidDocNotifier(paidDocumentService: paidDocumentService);
  });

  /// My Document Provider
  final myDocProvider = StateNotifierProvider<MyDocNotifier, MyDocState>((ref) {
    MyDocService myDocumentService = ref.watch(allServicesList.myDocService);

    return MyDocNotifier(myDocService: myDocumentService);
  });

  /// Fav Document Provider
  final favDocProvider =
      StateNotifierProvider<FavDocNotifier, FavDocState>((ref) {
    FavDocService favDocumentService = ref.watch(allServicesList.favDocService);

    return FavDocNotifier(favDocService: favDocumentService);
  });

  /// Document DetailProvider
  final docDetailProvider =
      StateNotifierProvider<DocDetailNotifier, DocDetailState>((ref) {
    DocDetailService documentDetailService =
        ref.watch(allServicesList.docDetailService);

    return DocDetailNotifier(docDetailService: documentDetailService);
  });

  /// Package Provider
  final packageProvider =
      StateNotifierProvider<PackageNotifier, PackageState>((ref) {
    PackageService packageService = ref.watch(allServicesList.packageService);

    return PackageNotifier(packageService: packageService);
  });

  /// TradeMark Provider
  final tradeMarkProvider =
      StateNotifierProvider<TradeMarkNotifier, TradeMarkState>((ref) {
    TrademarkService trademarkService =
        ref.watch(allServicesList.tradeMarkService);

    return TradeMarkNotifier(trademarkService: trademarkService);
  });

  /// Will Provider
  final willProvider = StateNotifierProvider<WillNotifier, WillState>((ref) {
    RegisterWillService willService = ref.watch(allServicesList.willService);

    return WillNotifier(registerWillService: willService);
  });

  /// Menu Doc Provider
  final menuDocProvider =
      StateNotifierProvider<MenuDocNotifier, MenuDocState>((ref) {
    MenuDocService menuDocService = ref.watch(allServicesList.menuDocService);

    return MenuDocNotifier(menuDocService: menuDocService);
  });

  /// Translate Doc Provider
  final translateDocNotifier =
      StateNotifierProvider<TranslateDocNotifier, TranslateDocState>((ref) {
    TranslateDocService translateDocService =
        ref.watch(allServicesList.translateDocService);

    return TranslateDocNotifier(translateDocService: translateDocService);
  });

  /// Business Provider
  final businessNotifier =
      StateNotifierProvider<BusinessNotifier, BusinessState>((ref) {
    BusinessService businessService =
        ref.watch(allServicesList.businessService);

    return BusinessNotifier(businessService: businessService);
  });

  /// Golden Visa Provider
  final goldenVisaNotifier =
      StateNotifierProvider<VisaNotifier, VisaState>((ref) {
    GoldenVisaService goldenVisaService =
        ref.watch(allServicesList.goldenVisaService);

    return VisaNotifier(goldenVisaService: goldenVisaService);
  });

  /// Forgot Password Provider
  final forgotPasswordNotifier =
      StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
    ForgotPasswordService forgotPasswordService =
        ref.watch(allServicesList.forgotPasswordService);

    return ForgotPasswordNotifier(forgotPasswordService: forgotPasswordService);
  });
}
