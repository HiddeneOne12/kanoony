// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/reset_password_screen/layout/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  String email;
  static const String resetPasswordPasswordRoute = "/ResetPasswordScreen";
  ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ResetPasswordBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
