import 'package:flutter/material.dart';


import 'layout/body.dart';

class LoginScreen extends StatelessWidget {
  static const String loginRoute = "/LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginBody(),
        ),
      ),
    );
  }
}
