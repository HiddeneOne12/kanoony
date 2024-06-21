// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonSizeBoxWidget extends StatelessWidget {
  double height;
  double width;
  CommonSizeBoxWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
