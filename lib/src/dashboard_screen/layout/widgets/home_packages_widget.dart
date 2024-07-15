import 'package:flutter/material.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class HomePackagesWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String price;
  final String title;
  final String description;
   final String fifty;
  const HomePackagesWidget({super.key, required this.onTap, required this.price, required this.title, required this.description , required this.fifty});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: kContainerPadding,
        decoration: BoxDecoration(color: context.onPrimaryColor,
        borderRadius: kBorderRadius6,
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("AED $price /$title",style: context.headlineSmall ,),
            const SizedBox(height:2,),
            Text(fifty,
            textAlign: TextAlign.center,
            style: context.headlineSmall!.copyWith(color: context.primaryColor),),
          ],
        ),
      )
    );
  }
}