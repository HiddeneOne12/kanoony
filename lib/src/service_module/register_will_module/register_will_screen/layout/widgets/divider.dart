import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';

import '../../../../../../core/constants/object_constants/object_constants.dart';

class WillDivider extends StatelessWidget {
  const WillDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding16,
      child: Divider(
        thickness: 1.w,
        color: allColors.borderColor,
      ),
    );
  }
}
