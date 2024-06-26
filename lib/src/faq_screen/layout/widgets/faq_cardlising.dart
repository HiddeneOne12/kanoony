// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_card_widget.dart';
import 'package:kanoony/src/faq_screen/model/get_faq_listing.dart';

class FaqCardListing extends StatefulWidget {
  List<FaqsUseModel> faqs;
  FaqCardListing({super.key, required this.faqs});

  @override
  State<FaqCardListing> createState() => _FaqCardListingState();
}

class _FaqCardListingState extends State<FaqCardListing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.faqs.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 0.h),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = widget.faqs[index];
            return FaqCard(
                isNumber: true,
                answer: data.answers,
                questions: data.questions,
                number: "${index + 1}");
          },
        ),
      ],
    );
  }
}
