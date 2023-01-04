import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/no_data.dart';

import 'package:markaz_snappy/modules/OtpScreen/OtpScreen.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';

class OtpScreenController extends GetxController {

  GlobalKey<FormFieldState> inputTxtOTPKey = GlobalKey<FormFieldState>();
  var inputTxtOTP = TextEditingController().obs;

  final OtpScreenService _service;

  OtpScreenController(this._service);

  @override
  void onInit() {
    requestOTP();
    super.onInit();

  }

  Future<void> requestOTP() async {
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );

      NoData? noData = await _service.otpRequest();
      // Get.back();
      if(noData!=null) {
        CoolAlert.show(context: Get.context!, type: CoolAlertType.info, text: noData.message);
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      // Get.back();
      Functions.checkErrorPopup(e);
    }
  }

  Future<void> verficationOTP() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      NoData? noData = await _service.otpVerification(inputTxtOTP.value.text);
      Get.back();
      if(noData!=null) {
        if(noData.message == "Verifikasi nomor handphone berhasil"){
          Get.offAllNamed(Routes.mainScreen);
        } else {
          CoolAlert.show(context: Get.context!, type: CoolAlertType.info, text: noData.message);
        }
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      Get.back();
      Functions.checkErrorPopup(e);
    }
  }

}