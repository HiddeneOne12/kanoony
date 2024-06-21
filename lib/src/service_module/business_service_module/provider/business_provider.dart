// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/routing/routing_config.dart';
import '../service/business_service.dart';

class BusinessNotifier extends StateNotifier<BusinessState> {
  BusinessNotifier({required this.businessService})
      : super(BusinessState.init());

  BusinessService businessService;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  clearData() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    companyController.clear();
    messageController.clear();
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
              text: 'COMPANY SET IN',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.companyList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          color: companyController.text == choice
                              ? allColors.primaryColor
                              : allColors.textColor,
                          size: 16.sp,
                          text: choice,
                          align: TextAlign.center,
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(
                              left: 0.h, right: 10.h, top: 5.h)),
                      if (companyController.text == choice) ...[
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
      companyController.text = selected;
    }
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));

    var response = await businessService.postBusinessSetupRequest(
      companyController.text,
      nameController.text,
      emailController.text,
      phoneController.text,
      messageController.text,
    );
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
      state = BusinessState.error(
          isError: true, message: "Error in posting data please try again");
    }
  }
}

class BusinessState extends Equatable {
  bool isLoaded = true;

  ValueNotifier<bool>? isLoading = ValueNotifier(false);

  List<String> companyList = const [
    'FREEZONE',
    'MAINLAND',
    'OFFSHORE',
    'OTHER'
  ];

  bool isError = false;

  String message;

  BusinessState({
    required this.isError,
    this.companyList = const ['FREEZONE', 'MAINLAND', 'OFFSHORE', 'OTHER'],
    required this.isLoading,
    required this.message,
    this.isLoaded = false,
  });

  BusinessState.init({this.message = '', this.isError = false});

  BusinessState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  BusinessState copyWith({
    bool? isError,
    String? message,
    ValueNotifier<bool>? isLoading,
    bool? isLoaded,
    List<String>? companyList,
  }) {
    return BusinessState(
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        companyList: companyList ?? this.companyList);
  }
}
