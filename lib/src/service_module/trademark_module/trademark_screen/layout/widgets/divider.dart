import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/values.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding26,
      child: Divider(
        thickness: 1.w,
        color: allColors.dividerColor,
      ),
    );
  }
}
