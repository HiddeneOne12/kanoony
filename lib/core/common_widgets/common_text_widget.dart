// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  String text;
  FontWeight weight;
  double size;
  Color color;
  EdgeInsetsGeometry padding;
  TextDecoration decoration;
  TextAlign align;
  int maxLine;

  CommonTextWidget(
      {super.key,
      required this.color,
      this.decoration = TextDecoration.none,
      this.maxLine = 100,
      required this.size,
      this.align = TextAlign.center,
      required this.text,
      required this.weight,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: weight,
              fontSize: size,
              color: color,
              decoration: decoration,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        textAlign: align,
      ),
    );
  }
}
