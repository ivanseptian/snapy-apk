import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/login_model.dart';

import 'package:markaz_snappy/modules/LoginScreen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';

class LoginScreenController extends GetxController {

  final LoginScreenService _service;

  LoginScreenController(this._service);

  final formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> inputTxtPasswordKey = GlobalKey<FormFieldState>();
  var inputTxtPassword = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtEmailKey = GlobalKey<FormFieldState>();
  var inputTxtEmail = TextEditingController().obs;

  var isObsecurePass = true.obs;

  void showHidePassword(){
    isObsecurePass.value = !isObsecurePass.value;
    print("show_hide_pass");
  }

  Future<void> submitLogin() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      login_model? loginModel = await _service.loginUser(inputTxtEmail.value.text,
          inputTxtPassword.value.text);
      Get.back();
      if(loginModel!=null) {
        String? token = loginModel.accessToken;
        String? message = loginModel.message;
        print(message);

        if(token!=null && token.isNotEmpty) {
          setSharePreferences(token, loginModel.data!);
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
    await prefs.setString(StringValue.sessionAddressStr, data.address??"");
    await prefs.setString(StringValue.sessionEmailStr, data.loginEmail??"");
    await prefs.setString(StringValue.sessionExpiredStr, data.expiredDate??"");
    await prefs.setString(StringValue.sessionLoginIdStr, data.loginId??"");
    await prefs.setString(StringValue.sessionNameStr, data.loginName??"");
    await prefs.setString(StringValue.sessionPhoneStr, data.loginPhone??"");
    await prefs.setString(StringValue.sessionPointStr, (data.point??0).toString());
    await prefs.setString(StringValue.sessionMemberTypeStr, (data.memberType??"reguler").toLowerCase());
    Get.offAllNamed(Routes.mainScreen);
  }

}