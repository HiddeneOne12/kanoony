// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/auth_module/login_screen/login_screen.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:kanoony/src/dashboard_screen/services/dashboard_service.dart';
import 'package:kanoony/src/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../user_profile_screen/model/get_user_detail_model.dart';
import '../model/home_contents_model.dart';
import '../model/menu_content_model.dart';
import '../model/quick_link_model.dart';
import '../model/search_home_docs_model.dart';
import '../model/static_content_model.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({required this.dashboardService})
      : super(DashboardState.init());

  DashboardService dashboardService;

  TextEditingController searchController = TextEditingController();

  sendGetStaticContentRequest() async {
    state = state.copyWith(areLoaded: true, staticData: null);
    var response = await dashboardService.getAllStaticContentRequest();
    var data = response!.toOption().toNullable();

    if (response.isRight()) {
      state = state.copyWith(
        isError: false,
        message: 'fetched Successfully',
        staticData: data,
        searchedDoc: [],
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(areLoaded: false);
      state = DashboardState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendGetQuickLinkCategoriesRequest() async {
    //state = state.copyWith(areLoaded: true);
    var response = await dashboardService.getDocCategoriesRequest();
    var data = response!.toOption().toNullable();

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'fetched Successfully',
          quickLinks: data,
          searchedDoc: [],
          areLoaded: false);
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(areLoaded: false);
      state = DashboardState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendGetMenuContentRequest() async {
    // state = state.copyWith(areLoaded: true);
    var response = await dashboardService.getAllStaticMenuContentRequest();
    var data = response!.toOption().toNullable();

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'fetched Successfully',
          menuContent: data,
          searchedDoc: [],
          areLoaded: false);
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(areLoaded: false);
      state = DashboardState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendGetHomeSearchDocRequest(String input) async {
    var response = await dashboardService.getHomeSearchRequest(input);
    var data = response!.toOption().toNullable()?.categories.first.data;

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'fetched Successfully',
          searchedDoc: data,
          isLoaded: false);
      dp(msg: "Response", arg: data.toString());
    }
  }

  sendGetHomeContentRequest() async {
    state = state.copyWith(
      isLoaded: true,
    );
    var response = await dashboardService.getAllHomeContentRequest();
    var data = response!.toOption().toNullable()?.packages;
    var blogs = response.toOption().toNullable()?.blogs.data;
    var news = response.toOption().toNullable()?.news.data;
    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'fetched Successfully',
          allPackages: data,
          blogs: blogs,
          searchedDoc: [],
          areLoaded: false,
          news: news,
          isLoaded: false);
      dp(msg: "Response", arg: blogs.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = DashboardState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendNotificationPostRequest() async {
    try {
      var response = await dashboardService.postNotificationRequest();
      var data = response!.toOption().toNullable()?.message;
      if (response.isRight()) {
        state = state.copyWith(
            isError: false,
            searchedDoc: [],
            message: 'Notification Pushed Successfully');
        dp(msg: "Notifications", arg: data.toString());
        logger.i("Notifications: ${data.toString()}");
      } else {
        state = DashboardState.error(
            isError: true, message: "Error in posting data please try again");
      }
    } on Exception catch (e) {
      state = DashboardState.error(
          isError: true, message: "Error in loading data please try again");
      logger.e(e.toString());
    }
  }

  changeLanguage(bool isArabic) async {
    state = state.copyWith(allPackages: [], staticData: null, quickLinks: []);
    index = 0;
    RoutesUtils.context.pop();
    final localStorage = await SharedPreferences.getInstance();
    await localStorage.setString("is_arabic", isArabic.toString());
    RoutesUtils.context.go(SplashScreen.splashRoute);
  }

  logOutRequest() async {
    final localStorage = await SharedPreferences.getInstance();

    localStorage.remove("login_value");
    localStorage.remove("token_key");
    localStorage.remove("userData");
    localStorage.remove("doc_detail");
    userProfileHelper.userData = UserDetailModel(
        id: '',
        name: '',
        email: '',
        mobile: '',
        emailVerified: '',
        dummyProfile: '',
        packageDetailAr: '',
        remainingDocument: '',
        packageDetailEn: '',
        subscriptionStatus: '',
        packageExpiry: '',
        packageName: '',
        packagePrice: '',
        hasPackage: '',
        isPackageOnTrail: '',
        packageId: '',
        numDays: '',
        signature: '',
        status: '',
        type: '',
        campaignCode: '',
        profilePhotoUrl: '');
    var isGoogle = localStorage.getString("is_google");
    if (isGoogle == "true") {
      await googleLoginIn.signOut();
      localStorage.remove("is_google");
    }
    state = state.copyWith(allPackages: [], staticData: null, quickLinks: []);
    RoutesUtils.context.go(LoginScreen.loginRoute);
    showSnackBarMessage(
        content: translation.loggedOutSuccess,
        backgroundColor: allColors.successColor,
        contentColor: allColors.canvasColor);
  }
}

class DashboardState extends Equatable {
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  bool areLoaded = false;
  bool isLoaded = false;
  StaticContentModel? staticData;
  List<Package> allPackages = [];
  List<Datum> blogs = [];
  List<Datum> news = [];
  bool isError = false;
  List<HomeSearchDoc> searchedDoc = [];
  List<DrawerContentModel> menuContent = [];
  List<QuickLinkModel>? quickLinks = [];
  String message;
  int id = 0;

  DashboardState(
      {required this.isLoading,
      required this.isError,
      required this.message,
      this.isLoaded = false,
      this.menuContent = const [],
      this.searchedDoc = const [],
      this.quickLinks = const [],
      this.blogs = const [],
      this.news = const [],
      this.allPackages = const [],
      this.areLoaded = true,
      this.id = 0,
      required this.staticData});

  DashboardState.init({this.message = '', this.isError = false});

  DashboardState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  DashboardState copyWith(
      {ValueNotifier<bool>? isLoading,
      List<DrawerContentModel>? menuContent,
      bool? isError,
      String? message,
      bool? areLoaded,
      bool? isLoaded,
      List<HomeSearchDoc>? searchedDoc,
      List<QuickLinkModel>? quickLinks,
      List<Package>? allPackages,
      List<Datum>? blogs,
      List<Datum>? news,
      int? id,
      StaticContentModel? staticData}) {
    return DashboardState(
        areLoaded: areLoaded ?? this.areLoaded,
        allPackages: allPackages ?? this.allPackages,
        news: news ?? this.news,
        id: id ?? this.id,
        isLoaded: isLoaded ?? this.isLoaded,
        isLoading: isLoading ?? this.isLoading,
        isError: isError ?? this.isError,
        searchedDoc: searchedDoc ?? this.searchedDoc,
        message: message ?? this.message,
        quickLinks: quickLinks ?? this.quickLinks,
        menuContent: menuContent ?? this.menuContent,
        blogs: blogs ?? this.blogs,
        staticData: staticData ?? this.staticData);
  }
}
