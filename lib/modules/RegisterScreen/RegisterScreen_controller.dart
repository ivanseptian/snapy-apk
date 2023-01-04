import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/register_model.dart';
import 'package:markaz_snappy/models/test.dart';

import 'package:markaz_snappy/modules/RegisterScreen/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';

class RegisterScreenController extends GetxController {

  final RegisterScreenService _service;

  RegisterScreenController(this._service);

  GlobalKey<FormFieldState> inputTxtNamaLengkapKey = GlobalKey<FormFieldState>();
  var inputTxtNamaLengkap = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtPhoneNumberKey = GlobalKey<FormFieldState>();
  var inputTxtPhoneNumber = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtEmailKey = GlobalKey<FormFieldState>();
  var inputTxtEmail = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtPasswordKey = GlobalKey<FormFieldState>();
  var inputTxtPassword = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtConfirmPasswordKey = GlobalKey<FormFieldState>();
  var inputTxtConfirmPassword = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  var isObsecurePass = true.obs;
  var isObsecureConfirmPass = true.obs;

  void showHidePassword(){
    isObsecurePass.value = !isObsecurePass.value;
    print("show_hide_pass");
  }

  void showHideConfirmPassword(){
    isObsecureConfirmPass.value = !isObsecureConfirmPass.value;
    print("show_hide_pass");
  }

  Future<void> submitRegister() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      register_model? registerModel = await _service.registerUser(inputTxtNamaLengkap.value.text, inputTxtEmail.value.text,
      inputTxtPassword.value.text, inputTxtPhoneNumber.value.text);
      Get.back();
      if(registerModel!=null) {
        String? message = registerModel.message.toString();
        String? token = registerModel.accessToken;

        if(token!=null && token.isNotEmpty) {
          setSharePreferences(token, registerModel.data!);
        } else {
          Functions.checkErrorPopup(message);
        }
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      Get.back();
      Functions.checkErrorPopup(e);
    }
  }

  Future<void> setSharePreferences(String token, Data data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(StringValue.sessionTokenStr, token);
    // await prefs.setString(StringValue.sessionAddressStr, data.address??"");
    await prefs.setString(StringValue.sessionEmailStr, data.loginEmail??"");
    // await prefs.setString(StringValue.sessionExpiredStr, data.expiredDate??"");
    await prefs.setString(StringValue.sessionLoginIdStr, data.loginId??"");
    await prefs.setString(StringValue.sessionNameStr, data.loginName??"");
    await prefs.setString(StringValue.sessionPhoneStr, data.loginPhone??"");
    // await prefs.setString(StringValue.sessionPointStr, (data.point??0).toString());
    // Get.offAllNamed(Routes.mainScreen);
    Get.toNamed(Routes.otpScreen);
  }

}