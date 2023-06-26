import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:markaz_snappy/config/config.dart';
import 'package:markaz_snappy/models/login_model.dart';
import 'package:markaz_snappy/models/no_data.dart';

import 'package:markaz_snappy/modules/ProfileScreen/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';
import '../../utils/prefs.dart';

class ProfileScreenController extends GetxController with
GetSingleTickerProviderStateMixin {

  final ProfileScreenService _service;

  ProfileScreenController(this._service);

  late TabController tabController;
  var indexTab = 0.obs;
  var name = "".obs;
  var id = "".obs;
  var email = "".obs;
  var points = "".obs;
  var expired = "".obs;
  var address = "".obs;
  var phone = "".obs;
  var qrData = "".obs;
  var memberType = "".obs;

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 2, vsync: this);
    name.value = await Prefs.getString(StringValue.sessionNameStr)??"";
    id.value = await Prefs.getString(StringValue.sessionLoginIdStr)??"";
    email.value = await Prefs.getString(StringValue.sessionEmailStr)??"";
    points.value = await Prefs.getString(StringValue.sessionPointStr)??"";
    expired.value = await Prefs.getString(StringValue.sessionExpiredStr)??"";
    address.value = await Prefs.getString(StringValue.sessionAddressStr)??"";
    phone.value = await Prefs.getString(StringValue.sessionPhoneStr)??"";
    memberType.value = await Prefs.getString(StringValue.sessionMemberTypeStr)??"";
    convertDataQr();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> logout() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      NoData? noData = await _service.logout();
      Get.back();
      if(noData!=null) {
        if(noData.message == "You have successfully logged out" || noData.message?.toLowerCase() == "unauthenticated."){
          Prefs.clear();
          Get.offAllNamed(Routes.root);
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

  Future<void> deleteAccount() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      NoData? noData = await _service.deleteAccount();
      Get.back();
      if(noData!=null) {
        if(noData.message == "Your account has been successfully deleted."){
          Get.snackbar(
            "Your account has been successfully deleted.",
            "",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.black,
            borderRadius: 10,
            backgroundColor:  Colors.white,
          );
          Prefs.clear();
          Get.offAllNamed(Routes.root);
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

  Future<void> profile() async {
    try {
      CoolAlert.show(
          context: Get.context!,
          type: CoolAlertType.loading,
          text: StringValue.loading
      );

      login_model? data = await _service.profile();
      Get.back();
      if(data!=null) {
        if(data.message?.toLowerCase() == "unauthenticated."){
          Prefs.clear();
          Get.offAllNamed(Routes.root);
        } else {
          setSharePreferences(data);
        }
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      Get.back();
      Functions.checkErrorPopup(e);
    }
  }

  Future<void> setSharePreferences(login_model it) async {
    if(it.data != null) {
      Data data = it.data!;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(StringValue.sessionAddressStr, data.address??"");
      await prefs.setString(StringValue.sessionEmailStr, data.loginEmail??"");
      await prefs.setString(StringValue.sessionExpiredStr, data.expiredDate??"");
      await prefs.setString(StringValue.sessionLoginIdStr, data.loginId??"");
      await prefs.setString(StringValue.sessionNameStr, data.loginName??"");
      await prefs.setString(StringValue.sessionPhoneStr, data.loginPhone??"");
      await prefs.setString(StringValue.sessionPointStr, (data.point??0).toString());
      await prefs.setString(StringValue.sessionMemberTypeStr, (data.memberType??"").toLowerCase());
      name.value = data.loginName??"";
      id.value = data.loginId??"";
      email.value = data.loginEmail??"";
      points.value = (data.point??0).toString();
      expired.value = data.expiredDate??"";
      address.value = data.address??"";
      phone.value = data.loginPhone??"";
      memberType.value = (data.memberType??"").toLowerCase();
      convertDataQr();
    }
  }

  void convertDataQr() {
    DateTime now = DateTime.now();
    // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = id.value;
    data['no_ex'] = null;
    data['type'] = memberType.value;
    data['displayName'] = name.value;
    data['email'] = email.value;
    data['phoneNumber'] = phone.value;
    data['date'] = now.toString();
    qrData.value = jsonEncode(data);
    print("dataqr: " +jsonEncode(data).toString());
  }

}