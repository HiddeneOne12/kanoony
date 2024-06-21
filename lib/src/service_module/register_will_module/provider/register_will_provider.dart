// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';

import 'package:kanoony/src/service_module/register_will_module/service/register_will_service.dart';

import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/routing/routing_config.dart';

class WillNotifier extends StateNotifier<WillState> {
  WillNotifier({required this.registerWillService}) : super(WillState.init());

  RegisterWillService registerWillService;

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode executorNameFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController executerNameController = TextEditingController();
  TextEditingController beneficialController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final willFormKey = GlobalKey<FormState>();

  clearData() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    childrenController.clear();
    statusController.clear();
    executerNameController.clear();
    beneficialController.clear();
    state.controllerList.clear();
  }

  void showNumberPopupMenu(bool isChildren) async {
    final selected = await showDialog<String>(
      context: RoutesUtils.context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: allColors.canvasColor,
          backgroundColor: allColors.canvasColor,
          title: CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: isChildren ? 'NUMBER OF CHILDREN' : 'NUMBER OF BENEFICIAL',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.numberList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          color: isChildren
                              ? childrenController.text == choice
                                  ? allColors.primaryColor
                                  : allColors.textColor
                              : beneficialController.text == choice
                                  ? allColors.primaryColor
                                  : allColors.textColor,
                          size: 16.sp,
                          text: choice,
                          align: TextAlign.center,
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(
                              left: 0.h, right: 10.h, top: 5.h)),
                      if (isChildren
                          ? childrenController.text == choice
                          : beneficialController.text == choice) ...[
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
      if (isChildren) {
        childrenController.text = selected;
      } else {
        List<BeneficialFieldsModel> list = [];
        beneficialController.text = selected;
        var num = int.tryParse(beneficialController.text) ?? 0;
        for (var i = 0; i < num; i++) {
          var value = BeneficialFieldsModel(
              TextEditingController(), TextEditingController());
          list.add(value);
        }
        state = state.copyWith(controllerList: list);
      }
    }
  }

  void checkSum() async {
    double sum = 0;
    for (var controller in state.controllerList) {
      double value = double.tryParse(controller.percentage!.text) ?? 0;
      sum += value;
    }
    if (sum != 100) {
      showSnackBarMessage(
          content: "Sum of all percentages should be equal to 100!",
          backgroundColor: allColors.errorColor,
          contentColor: allColors.canvasColor);
    } else {
      await sendRequest();
    }
  }

  void showStatusPopupMenu() async {
    final selected = await showDialog<String>(
      context: RoutesUtils.context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: allColors.canvasColor,
          backgroundColor: allColors.canvasColor,
          title: CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: 'PLEASE SELECT A STATUS',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.statusList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          color: statusController.text == choice
                              ? allColors.primaryColor
                              : allColors.textColor,
                          size: 16.sp,
                          text: choice,
                          align: TextAlign.start,
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(
                              left: 0.h, right: 10.h, top: 5.h)),
                      if (statusController.text == choice) ...[
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
      statusController.text = selected;
    }
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    List<String> nameList = [];
    List<int> percentageList = [];
    for (var i = 0; i < state.controllerList.length; i++) {
      nameList.add(state.controllerList[i].name!.text);
      percentageList.add(int.parse(state.controllerList[i].percentage!.text));
    }
    var response = await registerWillService.postRegisterWillRequest(
        state.selectedType!,
        nameController.text,
        emailController.text,
        phoneController.text,
        addressController.text,
        statusController.text,
        childrenController.text,
        executerNameController.text,
        nameList,
        percentageList,
        beneficialController.text);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'Called Successfully',
          isLoading: ValueNotifier(false));
      logger.i(data);
      await clearData();
      willFormKey.currentState!.reset();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = WillState.error(
          isError: true, message: "Error in posting data please try again");
    }
  }
}

class WillState extends Equatable {
  bool isLoaded = true;
  String? selectedType;
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  List<BeneficialFieldsModel> controllerList = [];
  List<String> numberList = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  List<String> statusList = const [
    'Never married',
    'Currently married',
    'Widow/Widower',
    'Divorced',
    'Separated'
  ];

  bool isError = false;

  String message;

  WillState({
    required this.isError,
    this.controllerList = const [],
    this.statusList = const [
      'Never married',
      'Currently married',
      'Widow/Widower',
      'Divorced',
      'Separated'
    ],
    this.numberList = const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
    required this.selectedType,
    required this.isLoading,
    required this.message,
    this.isLoaded = false,
  });

  WillState.init({this.message = '', this.isError = false});

  WillState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  WillState copyWith({
    bool? isError,
    String? message,
    List<BeneficialFieldsModel>? controllerList,
    List<String>? statusList,
    String? selectedType,
    ValueNotifier<bool>? isLoading,
    bool? isLoaded,
    List<String>? numberList,
  }) {
    return WillState(
        controllerList: controllerList ?? this.controllerList,
        selectedType: selectedType ?? this.selectedType,
        statusList: statusList ?? this.statusList,
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        numberList: numberList ?? this.numberList);
  }
}

class BeneficialFieldsModel {
  TextEditingController? name;
  TextEditingController? percentage;
  BeneficialFieldsModel(this.name, this.percentage);
}
