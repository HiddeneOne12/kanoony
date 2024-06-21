import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/auth_module/login_screen/model/login_model.dart';
import 'package:kanoony/src/auth_module/login_screen/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.loginService}) : super(LoginState.init());

  LoginService loginService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  final loginFormKey = GlobalKey<FormState>();

  void saveLogin(email, password) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString('username', email);
    storage.setString('password', password);
    storage.setBool('rememberMe', state.rememberMe);
  }

  void loadSavedLogin() async {
    final storage = await SharedPreferences.getInstance();
    final username = storage.getString('username');
    final password = storage.getString('password');
    final rememberMe = storage.getBool('rememberMe') ?? false;

    if (rememberMe) {
      emailController.text = username ?? '';
      passwordController.text = password ?? '';
      state = state.copyWith(rememberMe: rememberMe);
    }
  }

  clearData() {
    state = state.copyWith(isLoading: ValueNotifier(false));
    passwordController.clear();
    emailController.clear();
    // loginFormKey.currentState!.reset();
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await loginService.postLoginRequest(
        emailController.text, passwordController.text);
    var data = response!.toOption().toNullable()?.user;

    if (response.isRight()) {
      var token = response.toOption().toNullable()?.token;

      state = state.copyWith(
          isError: false, user: data, message: 'Logged In Successfully');
      dp(msg: "Sign In User Token", arg: state.user.toString());
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setString("token_key", token!);

      logger.i(token);
      saveLogin(data!.email, passwordController.text);
      await clearData();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = LoginState.error(
          isError: true, message: "Error in posting data please try again");
    }
    passwordController.clear();
    emailController.clear();
  }

  googleSignIn() async {
    googleAccount.value = await googleLoginIn.signIn();
    if (googleAccount.value != null) {
      state = state.copyWith(isGoogleLoading: ValueNotifier(true));
      var response = await loginService.postGoogleLoginRequest(
          googleAccount.value!.email,
          googleAccount.value!.displayName,
          googleAccount.value!.id);
      var data = response!.toOption().toNullable()?.user;

      if (response.isRight()) {
        var token = response.toOption().toNullable()?.token;

        state = state.copyWith(
            isGoogleLoading: ValueNotifier(false),
            isError: false,
            message: 'google Logged In Successfully');
        dp(msg: "Sign In User Token", arg: state.user.toString());
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("token_key", token!);

        logger.i(token);
        saveLogin(data!.email, passwordController.text);
        await clearData();
      } else {
        state = state.copyWith(isLoading: ValueNotifier(false));
        state = LoginState.error(
            isError: true, message: "Error in posting data please try again");
      }
    } else {
      showSnackBarMessage(
          content: "Failed to login!",
          backgroundColor: allColors.errorColor,
          contentColor: allColors.canvasColor);
    }
    print(googleAccount.value);
    state = state.copyWith(isLoading: ValueNotifier(false));
    passwordController.clear();
    emailController.clear();
  }
}

class LoginState extends Equatable {
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  ValueNotifier<bool>? isGoogleLoading = ValueNotifier(false);
  bool isError = false;
  bool rememberMe = false;
  String message;

  bool obscureText = true;

  User? user;
  LoginState(
      {required this.isLoading,
      required this.isError,
      required this.isGoogleLoading,
      required this.rememberMe,
      required this.message,
      required this.obscureText,
      this.user});

  LoginState.init({this.message = '', this.isError = false});

  LoginState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  LoginState copyWith({
    ValueNotifier<bool>? isLoading,
    bool? isError,
    String? message,
    bool? rememberMe,
    bool? obscureText,
    ValueNotifier<bool>? isGoogleLoading,
    User? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
      isError: isError ?? this.isError,
      rememberMe: rememberMe ?? this.rememberMe,
      message: message ?? this.message,
      obscureText: obscureText ?? this.obscureText,
      user: user ?? this.user,
    );
  }
}
