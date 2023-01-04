import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:markaz_snappy/modules/ForgetPassword/ForgetPassword.dart';

import '../../config/strings.dart';
import '../../models/no_data.dart';
import '../../utils/function.dart';

class ForgetPasswordController extends GetxController {

  final ForgetPasswordService _service;

  ForgetPasswordController(this._service);

  GlobalKey<FormFieldState> inputTxtEmailKey = GlobalKey<FormFieldState>();
  var inputTxtEmail = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

  Future<void> sendLupaPassword() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      NoData? noData = await _service.sendForgetPasswordVerification(inputTxtEmail.value.text);
      Get.back();
      if(noData!=null) {
        CoolAlert.show(context: Get.context!, type: CoolAlertType.info, text: "Check your email inbox!");
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      Get.back();
      Functions.checkErrorPopup(e);
    }
  }

}