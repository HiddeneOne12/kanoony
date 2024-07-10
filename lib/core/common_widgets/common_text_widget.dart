// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

class CommonTextWidget extends StatelessWidget {
  String text;
  FontWeight weight;
  double size;
  Color color;
  EdgeInsetsGeometry padding;
  TextDecoration decoration;
  TextAlign align;
  int maxLine;
  double? height;

  CommonTextWidget(
      {super.key,
      required this.color,
      
      this.decoration = TextDecoration.none,
      this.maxLine = 100,
      required this.size,
      this.align = TextAlign.center,
      required this.text,
      required this.weight,
      required this.padding,
      this.height
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text.capitalizeFirstLetter() ?? "",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              height: height,
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
