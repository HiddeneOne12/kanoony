// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/trademark_module/service/trademark_service.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/common_widgets/common_text_widget.dart';

class TradeMarkNotifier extends StateNotifier<TradeMarkState> {
  TradeMarkNotifier({required this.trademarkService})
      : super(TradeMarkState.init());

  TrademarkService trademarkService;

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode messageFocus = FocusNode();
  FocusNode trademarkNameFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController trademarkNameController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final tradeMarkFormKey = GlobalKey<FormState>();

  clearData() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
    countryController.clear();
    ownerController.clear();
    trademarkNameController.clear();
    attachmentController.clear();
    state = state.copyWith(attachment: null);
  }

  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Download and open logic
    } else {
      // Handle permission denial
      print('Storage permission denied. Requesting again.');
      await Permission.storage.request();
    }
  }

  Future<void> downloadFile(String path) async {
    await requestPermissions();
    if (path.contains("pdf")) {
      state = state.copyWith(isLoading: ValueNotifier(true));
    } else {
      state = state.copyWith(isLoading2: ValueNotifier(true));
    }

    state = state.copyWith(isLoaded: true);
    try {
      logger.i("path file $path");
      final File? file = await FileDownloader.downloadFile(
        notificationType: NotificationType.all,
        url: path,
      );

      logger.i('FILE: ${file?.path}');
      if (file != null) {
        showSnackBarMessage(
            content: "Document downloaded successfully!",
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
      } else {
        showSnackBarMessage(
            content: "Document not found!",
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
      }
    } catch (e) {
      logger.e('Error: $e');
      showSnackBarMessage(
          content: "Downloading failed!",
          backgroundColor: allColors.errorColor,
          contentColor: allColors.canvasColor);
    }

    if (path.contains("pdf")) {
      state = state.copyWith(isLoading: ValueNotifier(false));
    } else {
      state = state.copyWith(isLoading2: ValueNotifier(false));
    }
  }

  void pickAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      var selectedFile = File(result.files.single.path!);
      var fileName = path.basename(selectedFile.path);
      attachmentController.text = fileName;
      attachmentController.text = selectedFile.path;
      state = state.copyWith(attachment: selectedFile);
    }
  }

  void showPopupMenu() async {
    final selected = await showDialog<String>(
      context: RoutesUtils.context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: allColors.canvasColor,
          backgroundColor: allColors.canvasColor,
          title: CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: 'PLEASE SELECT AN OWNER',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.ownerList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          color: ownerController.text == choice
                              ? allColors.primaryColor
                              : allColors.textColor,
                          size: 16.sp,
                          text: choice,
                          align: TextAlign.start,
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(
                              left: 0.h, right: 10.h, top: 5.h)),
                      if (ownerController.text == choice) ...[
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
      ownerController.text = selected;
    }
  }

  void showCountryPickerPopup() {
    showCountryPicker(
      context: RoutesUtils.context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryController.text = country.name;
      },
    );
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await trademarkService.postRegisterTradeMarkRequest(
        state.selectedType!,
        state.attachment,
        nameController.text,
        emailController.text,
        phoneController.text,
        messageController.text,
        trademarkNameController.text,
        countryController.text,
        state.selectedServiceOrProduct!,
        state.selectedTrademarkType!,
        ownerController.text);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
          isError: false,
          message: 'Called Successfully',
          isLoading: ValueNotifier(false));
      logger.i(data);
      await clearData();
      tradeMarkFormKey.currentState!.reset();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = TradeMarkState.error(
          isError: true, message: "Error in posting data please try again");
    }
  }
}

class TradeMarkState extends Equatable {
  bool isLoaded = true;
  String? selectedType;
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  ValueNotifier<bool>? isLoading2 = ValueNotifier(false);
  List<String> ownerList = const [
    'Trademark owner',
    'Individual',
    'Company in UAE',
    'Company outside UAE'
  ];
  String? selectedServiceOrProduct;
  String? selectedTrademarkType;
  bool isError = false;
  File? attachment;
  String message;

  TradeMarkState({
    required this.isError,
    this.ownerList = const [
      'Trademark owner',
      'Individual',
      'Company in UAE',
      'Company outside UAE'
    ],
    required this.selectedType,
    required this.isLoading,
    required this.selectedServiceOrProduct,
    required this.isLoading2,
    required this.selectedTrademarkType,
    required this.attachment,
    required this.message,
    this.isLoaded = false,
  });

  TradeMarkState.init({this.message = '', this.isError = false});

  TradeMarkState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  TradeMarkState copyWith({
    bool? isError,
    String? message,
    List<String>? ownerList,
    String? selectedType,
    String? selectedServiceOrProduct,
    File? attachment,
    ValueNotifier<bool>? isLoading,
    ValueNotifier<bool>? isLoading2,
    String? selectedTrademarkType,
    bool? isLoaded,
  }) {
    return TradeMarkState(
      ownerList: ownerList ?? this.ownerList,
      attachment: attachment ?? this.attachment,
      isLoading2: isLoading2 ?? this.isLoading2,
      selectedServiceOrProduct:
          selectedServiceOrProduct ?? this.selectedServiceOrProduct,
      selectedTrademarkType:
          selectedTrademarkType ?? this.selectedTrademarkType,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      selectedType: selectedType ?? this.selectedType,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
