import 'package:flutter/material.dart';
import 'package:kanoony/src/splash_screen/layout/body.dart';

class SplashScreen extends StatelessWidget {
  static const String splashRoute = "/SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: SplashBody(),
        ),
      ),
    );
  }
}
