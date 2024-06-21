import 'package:flutter/material.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/fogot_password_screen/layout/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String forgotPasswordRoute = "/ForgotPasswordScreen";
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: ForgotPasswordBody(),
        ),
      ),
    );
  }
}
