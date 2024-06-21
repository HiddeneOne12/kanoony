import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/service/forgot_password_service.dart';
import 'package:kanoony/src/document_module/menu_document_screen/service/menu_doc_service.dart';
import 'package:kanoony/src/faq_screen/service/faq_service.dart';
import 'package:kanoony/src/document_module/free_document_screen/service/free_document_service.dart';
import 'package:kanoony/src/packages_screen/service/package_service.dart';
import 'package:kanoony/src/privacy_policy_screen/service/privacy_policy_service.dart';
import 'package:kanoony/src/service_module/business_service_module/service/business_service.dart';
import 'package:kanoony/src/service_module/document_translate_screen/service/translate_doc_service.dart';
import 'package:kanoony/src/service_module/register_will_module/service/register_will_service.dart';
import 'package:kanoony/src/service_module/trademark_module/service/trademark_service.dart';
import 'package:kanoony/src/terms_of_use/service/terms_of_use_service.dart';

import '../../../src/dashboard_screen/services/dashboard_service.dart';
import '../../../src/auth_module/login_screen/service/login_service.dart';
import '../../../src/auth_module/register_screen/service/register_service.dart';
import '../../../src/document_module/document_details_screen/service/doc_detail_service.dart';
import '../../../src/favorite_screen/services/fav_doc_services.dart';
import '../../../src/document_module/my_documents_screen/service/my_document_service.dart';
import '../../../src/document_module/paid_document_screen/service/paid_doc_service.dart';
import '../../../src/service_module/golden_visa_screen/service/golden_visa_service.dart';
import '../../../src/user_profile_screen/user_profile_service/user_profile_service.dart';

class AllScreenServicesList {
  /// Login Services
  final loginService = Provider<LoginService>((ref) => LoginService());

  /// Register Services
  final registerService = Provider<RegisterService>((ref) => RegisterService());

  /// User Profile Services
  final userProfileService =
      Provider<UserProfileService>((ref) => UserProfileService());

  /// Dashboard Services
  final dashboardService =
      Provider<DashboardService>((ref) => DashboardService());

  /// Privacy Policy Services
  final privacyPolicyService =
      Provider<PrivacyPolicyService>((ref) => PrivacyPolicyService());

  /// Terms Of Use Services
  final termsOfUseService =
      Provider<TermsOfUseService>((ref) => TermsOfUseService());

  /// Faqs Services
  final faqsService = Provider<FaqService>((ref) => FaqService());

  /// Free Doc Services
  final freeDocService =
      Provider<FreeDocumentService>((ref) => FreeDocumentService());

  /// Paid Doc Services
  final paidDocService = Provider<PaidDocService>((ref) => PaidDocService());

  /// My Doc Services
  final myDocService = Provider<MyDocService>((ref) => MyDocService());

  /// Fav Doc Services
  final favDocService = Provider<FavDocService>((ref) => FavDocService());

  /// Doc Detail Services
  final docDetailService =
      Provider<DocDetailService>((ref) => DocDetailService());

  /// Package  Services
  final packageService = Provider<PackageService>((ref) => PackageService());

  /// Trademark  Services
  final tradeMarkService =
      Provider<TrademarkService>((ref) => TrademarkService());

  /// Will  Services
  final willService =
      Provider<RegisterWillService>((ref) => RegisterWillService());

  /// Menu Doc  Services
  final menuDocService = Provider<MenuDocService>((ref) => MenuDocService());

  /// Translate Doc  Services
  final translateDocService =
      Provider<TranslateDocService>((ref) => TranslateDocService());

  /// Business  Services
  final businessService = Provider<BusinessService>((ref) => BusinessService());

  /// Golden Visa  Services
  final goldenVisaService =
      Provider<GoldenVisaService>((ref) => GoldenVisaService());

  /// Forgot Password  Services
  final forgotPasswordService =
      Provider<ForgotPasswordService>((ref) => ForgotPasswordService());
}
