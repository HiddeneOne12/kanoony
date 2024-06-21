// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/service_module/golden_visa_screen/service/golden_visa_service.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/routing/routing_config.dart';

class VisaNotifier extends StateNotifier<VisaState> {
  VisaNotifier({required this.goldenVisaService}) : super(VisaState.init());

  GoldenVisaService goldenVisaService;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController noteController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  clearData() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    categoryController.clear();
    noteController.clear();
    occupationController.clear();
  }

  void showCompanyPopupMenu() async {
    final selected = await showDialog<String>(
      context: RoutesUtils.context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: allColors.canvasColor,
          backgroundColor: allColors.canvasColor,
          title: CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: 'CHOOSE YOUR CATEGORY',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.categoryList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CommonTextWidget(
                            color: categoryController.text == choice
                                ? allColors.primaryColor
                                : allColors.textColor,
                            size: 16.sp,
                            text: choice,
                            align: TextAlign.start,
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 0.h, right: 10.h, top: 5.h)),
                      ),
                      if (categoryController.text == choice) ...[
                        Icon(
                          Icons.check_circle,
                          color: allColors.primaryColor,
                          size: 25.h,
                        ),
                      ],
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context, choice);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selected != null) {
      categoryController.text = selected;
    }
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));

    var response = await goldenVisaService.postGoldenVisaRequest(
        nameController.text,
        emailController.text,
        phoneController.text,
        noteController.text,
        occupationController.text,
        categoryController.text);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'Called Successfully',
          isLoading: ValueNotifier(false));
      logger.i(data);
      await clearData();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = VisaState.error(
          isError: true, message: "Error in posting data please try again");
    }
  }
}

class VisaState extends Equatable {
  bool isLoaded = true;

  ValueNotifier<bool>? isLoading = ValueNotifier(false);

  List<String> categoryList = const [
    'Executive with a salary of AED 30,000 or more in the UAE',
    'Real estate investments worth AED 2 million or more in the UAE',
    'Entrepreneur & public investment investor in the UAE',
    'Outstanding/specialized talent like doctor, inventor, athlete and creative in the UAE',
    'Outstanding students in the UAE'
  ];

  bool isError = false;

  String message;

  VisaState({
    required this.isError,
    this.categoryList = const [
      'Executive with a salary of AED 30,000 or more in the UAE',
      'Real estate investments worth AED 2 million or more in the UAE',
      'Entrepreneur & public investment investor in the UAE',
      'Outstanding/specialized talent like doctor, inventor, athlete and creative in the UAE',
      'Outstanding students in the UAE'
    ],
    required this.isLoading,
    required this.message,
    this.isLoaded = false,
  });

  VisaState.init({this.message = '', this.isError = false});

  VisaState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  VisaState copyWith({
    bool? isError,
    String? message,
    ValueNotifier<bool>? isLoading,
    bool? isLoaded,
    List<String>? categoryList,
  }) {
    return VisaState(
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        categoryList: categoryList ?? this.categoryList);
  }
}
