import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../../../../core/constants/values.dart';

class VisaDivider extends StatelessWidget {
  const VisaDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding16,
      child: Divider(
        thickness: 1.w,
        color: context.onPrimaryColor,
      ),
    );
  }
}
