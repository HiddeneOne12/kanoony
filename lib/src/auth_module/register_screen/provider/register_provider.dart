import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/helpers/logger.dart';
import '../service/register_service.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({required this.registerService})
      : super(RegisterState.init());

  RegisterService registerService;
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode numberNode = FocusNode();

  clearData() {
    state = state.copyWith(isLoading: ValueNotifier(false));
    passwordController.clear();
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    confirmPasswordController.clear();
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await registerService.postRegisterRequest(
        emailController.text,
        nameController.text,
        phoneController.text,
        passwordController.text,
        confirmPasswordController.text);

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
      state = RegisterState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoading: ValueNotifier(false));
    passwordController.clear();
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    confirmPasswordController.clear();
  }
}

class RegisterState extends Equatable {
  ValueNotifier<bool>? isLoading = ValueNotifier(false);

  bool isError = false;
  String message;

  bool obscureText = true;
  bool obscureText2 = true;
  RegisterState(
      {required this.isLoading,
      required this.isError,
      required this.message,
      required this.obscureText,
      required this.obscureText2});

  RegisterState.init({this.message = '', this.isError = false});

  RegisterState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  RegisterState copyWith({
    ValueNotifier<bool>? isLoading,
    bool? isError,
    String? message,
    bool? obscureText,
    bool? obscureText2,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      message: message ?? this.message,
      obscureText2: obscureText2 ?? this.obscureText2,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
