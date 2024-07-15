import 'package:flutter/material.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/routing/routing_config.dart';

//Border Roundness
BorderRadius kBorderRadius6 = BorderRadius.circular(6);
BorderRadius kBorderRadius10 = BorderRadius.circular(10);
BorderRadius kBorderRadius4 = BorderRadius.circular(4);
BorderRadius kBorderRadius16 = BorderRadius.circular(16);
BorderRadius kBorderRadius12 = BorderRadius.circular(12);

///Paddings
EdgeInsets kAllPadding9 = const EdgeInsets.all(9);
EdgeInsets kAllPadding18 = const EdgeInsets.all(18);
EdgeInsets kMainBodyPadding =
    const EdgeInsets.symmetric(horizontal: 18, vertical: 18);
EdgeInsets kContainerPadding = const EdgeInsets.all(9);
EdgeInsets kHeadlinePadding =
    const EdgeInsets.only(left: 18, right: 18, bottom: 9, top: 28);
EdgeInsets kHeadlineBottomPadding = const EdgeInsets.only(bottom: 9,);
EdgeInsets kHeadlineVerticalPadding = const EdgeInsets.only(top: 28, bottom: 9);

EdgeInsets kSubTitlePadding = const EdgeInsets.only(top: 14, bottom: 11);
EdgeInsets kSubHeadlinePadding =
    const EdgeInsets.symmetric(horizontal: 18, vertical: 9);
EdgeInsets kLeftPadding9 = const EdgeInsets.only(left: 9);
EdgeInsets kLeftPadding18 = const EdgeInsets.only(left: 18);
EdgeInsets kRightPadding9 = const EdgeInsets.only(right: 9);
EdgeInsets kRightPadding18 = const EdgeInsets.only(right: 18);
EdgeInsets kTopPadding9 = const EdgeInsets.only(top: 9);
EdgeInsets kTopPadding18 = const EdgeInsets.only(top: 18);
EdgeInsets kBottomPadding9 = const EdgeInsets.only(bottom: 9);
EdgeInsets kBottomPadding18 = const EdgeInsets.only(bottom: 18);
EdgeInsets kVerticalPadding9 = const EdgeInsets.symmetric(vertical: 9);
EdgeInsets kVerticalPadding18 = const EdgeInsets.symmetric(vertical: 18);
EdgeInsets kHorizontalPadding9 = const EdgeInsets.symmetric(horizontal: 9);
EdgeInsets kHorizontalPadding18 = const EdgeInsets.symmetric(horizontal: 18);

BoxShadow containerBoxShadow = BoxShadow(
  color: RoutesUtils.context.shaddowColor,
  blurRadius: 9,
  spreadRadius: 1.2
);