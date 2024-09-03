
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/login_model.dart';
import 'package:markaz_snappy/models/message_only_model.dart';
import 'package:markaz_snappy/modules/OtpLoginScreen/OtpLoginScreen_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';

class OtpLoginScreenController extends GetxController {

  GlobalKey<FormFieldState> inputTxtOTPKey = GlobalKey<FormFieldState>();
  var inputTxtOTP = TextEditingController().obs;

  String loginPhone = "";
  var firebaseToken = "";

  final OtpLoginScreenService _service;

  OtpLoginScreenController(this._service);

  @override
  Future<void> onInit() async {
    firebaseToken = await FirebaseMessaging.instance.getToken()??"";
    debugPrint("token $firebaseToken");
    loginPhone = Get.arguments;
    super.onInit();

  }

  Future<void> requestOTP() async {
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );

      only_message_model? otpRequest = await _service.otpRequest(loginPhone);
      // Get.back();
      if(otpRequest!=null) {
        CoolAlert.show(context: Get.context!, type: CoolAlertType.info, text: otpRequest.message);
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

      login_model? loginData = await _service.otpVerification(inputTxtOTP.value.text, loginPhone, firebaseToken);
      Get.back();
      if(loginData!=null) {
        String? token = loginData.accessToken;
        String? message = loginData.message;
        print(message);

        if(token!=null && token.isNotEmpty) {
          setSharePreferences(token, loginData.data!);
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
    await prefs.setString(StringValue.sessionTokenIsVerified, '1');
    // await prefs.setString(StringValue.sessionAddressStr, data.address??"");
    // await prefs.setString(StringValue.sessionEmailStr, data.loginEmail??"");
    // await prefs.setString(StringValue.sessionExpiredStr, data.expiredDate??"");
    await prefs.setString(StringValue.sessionLoginIdStr, data.loginId??"");
    // await prefs.setString(StringValue.sessionNameStr, data.loginName??"");
    // await prefs.setString(StringValue.sessionPhoneStr, data.loginPhone??"");
    // await prefs.setString(StringValue.sessionPointStr, (data.point??0).toString());
    // await prefs.setString(StringValue.sessionMemberTypeStr, (data.type??"").toLowerCase());
    Get.offAllNamed(Routes.mainScreen);
  }

}