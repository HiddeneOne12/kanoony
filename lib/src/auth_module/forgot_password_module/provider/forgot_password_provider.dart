import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/service/forgot_password_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/helpers/logger.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier({required this.forgotPasswordService})
      : super(ForgotPasswordState.init());

  ForgotPasswordService forgotPasswordService;
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  clearData() {
    state = state.copyWith(isLoading: ValueNotifier(false));
    passwordController.clear();
    emailController.clear();
    confirmPasswordController.clear();
    otpController.clear();
  }

  sendForgotPasswordRequest(email) async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await forgotPasswordService.postForgotRequest(
      email,
    );

    if (response!.isRight()) {
      var data = response.toOption().toNullable()?.message;

      state =
          state.copyWith(isError: false, message: 'Registered Successfully');
      dp(msg: "Message", arg: data.toString());

      await clearData();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = ForgotPasswordState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoading: ValueNotifier(false));
  }

  sendVerifyEmailRequest(email) async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await forgotPasswordService.postVerifyRequest(
        email, otpController.text);

    if (response!.isRight()) {
      var data = response.toOption().toNullable()?.message;

      state =
          state.copyWith(isError: false, message: 'Registered Successfully');
      dp(msg: "Message", arg: data.toString());

      await clearData();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = ForgotPasswordState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoading: ValueNotifier(false));
  }

  sendResetPasswordRequest(email) async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await forgotPasswordService.postResetPasswordRequest(
        email, passwordController.text, confirmPasswordController.text);

    if (response!.isRight()) {
      var data = response.toOption().toNullable()?.user;
      var token = response.toOption().toNullable()?.token;
      state =
          state.copyWith(isError: false, message: 'Registered Successfully');
      dp(msg: "Message", arg: data.toString());
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setString("token_key", token!);

      await clearData();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = ForgotPasswordState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoading: ValueNotifier(false));
  }
}

class ForgotPasswordState extends Equatable {
  ValueNotifier<bool>? isLoading = ValueNotifier(false);

  bool isError = false;
  String message;

  bool obscureText = true;
  bool obscureText2 = true;
  ForgotPasswordState(
      {required this.isLoading,
      required this.isError,
      required this.message,
      required this.obscureText,
      required this.obscureText2});

  ForgotPasswordState.init({this.message = '', this.isError = false});

  ForgotPasswordState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  ForgotPasswordState copyWith({
    ValueNotifier<bool>? isLoading,
    bool? isError,
    String? message,
    bool? obscureText,
    bool? obscureText2,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      message: message ?? this.message,
      obscureText2: obscureText2 ?? this.obscureText2,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
