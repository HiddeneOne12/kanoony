import 'package:flutter/material.dart';


import 'layout/body.dart';

class RegisterScreen extends StatelessWidget {
  static const String registerRoute = "/RegisterScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: RegisterBody(),
        ),
      ),
    );
  }
}
