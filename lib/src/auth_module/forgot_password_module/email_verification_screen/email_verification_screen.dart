// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/email_verification_screen/layout/body.dart';

class EmailVerificationScreen extends StatelessWidget {
  String email;
  static const String emailVerificationRoute = "/EmailVerificationScreen";
  EmailVerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: EmailVerificationBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
