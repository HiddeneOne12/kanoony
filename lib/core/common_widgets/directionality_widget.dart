import 'package:flutter/material.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

class CommonDirectionality extends StatelessWidget {
  final Widget child;
  const CommonDirectionality({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );
  }
}
