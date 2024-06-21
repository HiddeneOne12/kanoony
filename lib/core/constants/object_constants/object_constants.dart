import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kanoony/core/constants/translations/translations.dart';
import 'package:kanoony/core/helpers/payment_helper.dart';
import 'package:kanoony/core/helpers/user_profile_helper.dart';
import 'package:logger/web.dart';

import '../../helpers/api_helper.dart';
import '../all_screen_providers_list/all_screen_providers_list.dart';
import '../all_screen_services_list/all_screen_services_list.dart';
import '../app_theme/app_theme.dart';
import '../colors_constants/color_constants.dart';

var appTheme = AppTheme();
var allColors = ColorConstants();
var dioApiHelper = DioApiHelper();
var logger = Logger();
var allServicesList = AllScreenServicesList();
var allProviderList = AllScreenProvidersList();
var userProfileHelper = UserProfileHelper();
var googleLoginIn = GoogleSignIn();
var googleAccount = ValueNotifier<GoogleSignInAccount?>(null);
var translation = StaticTextTranslations();
var paymentHelper = PaymentHelper();
