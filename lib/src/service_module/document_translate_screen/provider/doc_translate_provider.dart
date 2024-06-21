// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/document_translate_screen/service/translate_doc_service.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../widgets/request_callback_popup.dart';

class TranslateDocNotifier extends StateNotifier<TranslateDocState> {
  TranslateDocNotifier({required this.translateDocService})
      : super(TranslateDocState.init());

  TranslateDocService translateDocService;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  clearData() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    notesController.clear();
    languageController.clear();
    state = state.copyWith(selectedFiles: []);
  }

  void showLanguagePopupMenu() async {
    final selected = await showDialog<String>(
      context: RoutesUtils.context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: allColors.canvasColor,
          backgroundColor: allColors.canvasColor,
          title: CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: 'PLEASE SELECT A LANGUAGE',
              weight: FontWeight.w700,
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h)),
          content: SingleChildScrollView(
            child: Column(
              children: state.languageList.map((String choice) {
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                          color: languageController.text == choice
                              ? allColors.primaryColor
                              : allColors.textColor,
                          size: 16.sp,
                          text: choice,
                          align: TextAlign.start,
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(
                              left: 0.h, right: 10.h, top: 5.h)),
                      if (languageController.text == choice) ...[
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
      languageController.text = selected;
    }
  }

  void removeFiles(String name) async {
    state.selectedFiles
        .removeWhere((element) => element.path.split('/').last == name);
    logger.i("Removed : ${state.selectedFiles}");
  }

  void pickFiles(ref) async {
    RoutesUtils.context.pop();
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      var selectedFiles = result.paths.map((path) => File(path!)).toList();
      state = state.copyWith(selectedFiles: selectedFiles);
      logger.i("files : ${state.selectedFiles}");
      await requestCallBackPopUp(RoutesUtils.context, ref, false, false);
    }
  }

  sendRequest() async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    var response = await translateDocService.posDocTranslateRequest(
      languageController.text,
      nameController.text,
      emailController.text,
      phoneController.text,
      notesController.text,
      state.selectedFiles,
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
      state = TranslateDocState.error(
          isError: true, message: "Error in posting data please try again");
    }
  }
}

class TranslateDocState extends Equatable {
  bool isLoaded = true;
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  List<File> selectedFiles = [];
  List<String> languageList = const [
    'ENGLISH',
    'FRENCH',
    'ARABIC',
  ];

  bool isError = false;

  String message;

  TranslateDocState({
    required this.isError,
    this.languageList = const [
      'ENGLISH',
      'FRENCH',
      'ARABIC',
    ],
    this.selectedFiles = const [],
    required this.isLoading,
    required this.message,
    this.isLoaded = false,
  });

  TranslateDocState.init({this.message = '', this.isError = false});

  TranslateDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  TranslateDocState copyWith({
    bool? isError,
    String? message,
    List<File>? selectedFiles,
    List<String>? languageList,
    ValueNotifier<bool>? isLoading,
    bool? isLoaded,
  }) {
    return TranslateDocState(
        languageList: languageList ?? this.languageList,
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        selectedFiles: selectedFiles ?? this.selectedFiles);
  }
}
