import 'package:flutter/material.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class HomeCarporateServicesWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const HomeCarporateServicesWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius6,
        color: context.onPrimaryColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(text, style: context.titleMedium,),
      ),
    );
  }
}
