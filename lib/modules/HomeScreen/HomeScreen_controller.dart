import 'package:get/get.dart';
import 'package:markaz_snappy/models/banners_model.dart';
import 'package:markaz_snappy/models/transaction_model.dart';

import 'package:markaz_snappy/modules/HomeScreen/HomeScreen.dart';
import 'package:markaz_snappy/modules/MainScreen/MainScreen.dart';

import '../../config/strings.dart';
import '../../models/login_model.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';
import '../../utils/prefs.dart';
import '../ProfileScreen/ProfileScreen_controller.dart';

class HomeScreenController extends GetxController {

  final HomeScreenService _service;

  HomeScreenController(this._service);

  // var userName = "".obs;
  // var id = "".obs;
  // var points = "".obs;
  // var expired = "".obs;
  var token = "".obs;
  var userProfileData = Data().obs;
  var listTransaction = <DataTransaction>[].obs;
  // var memberType = "".obs;

  var isLoading = false.obs;
  var currentIndexBanner = 0.obs;
  var listBanners = <banners_model>[].obs;
  List<String>? dataNotifications = ["Notification 1", "Notification 2"];
  final mainScreenController = Get.find<MainScreenController>();

  @override
  Future<void> onInit() async {
    // isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 3));
    // isLoading.value = false;
    getData();
    super.onInit();
  }

  Future<void> getData() async{
    String? token = await Prefs.getString(StringValue.sessionTokenStr);
    String? isTokenVerified = await Prefs.getString(StringValue.sessionTokenIsVerified);
    if (isTokenVerified == "1") {
      this.token.value = token??"";
    }
    // userName.value = await Prefs.getString(StringValue.sessionNameStr)??"";
    // id.value = await Prefs.getString(StringValue.sessionLoginIdStr)??"";
    // points.value = await Prefs.getString(StringValue.sessionPointStr)??"";
    // expired.value = await Prefs.getString(StringValue.sessionExpiredStr)??"";
    // memberType.value = await Prefs.getString(StringValue.sessionMemberTypeStr)??"";
    // print("init home");
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );
      isLoading.value = true;
      login_model? dataProfile;
      Transaction? dataTransaction;

      if (isTokenVerified == "1") {
        if (token != "" && token != null && token.isNotEmpty) {
          dataProfile = await _service.profile();
          dataTransaction = await _service.transaction("1", "");
        }
      }
      List<banners_model>? banners = await _service.banners();
      isLoading.value = false;
      // Get.back();
      if(banners!=null) {
        listBanners.value = banners;
      } else {
        // Functions.checkErrorPopup("");
      }

      if(dataTransaction!=null) {
        if(dataTransaction.message?.toLowerCase() == "unauthenticated."){
          Prefs.clear();
          Get.offAllNamed(Routes.root);
        } else {
          if (dataTransaction.data != null) {
            listTransaction.value = dataTransaction.data!;
          } else {
            // Functions.checkErrorPopup("");
          }
        }
      }

      if(dataProfile!=null) {
        if(dataProfile.message?.toLowerCase() == "unauthenticated."){
          Prefs.clear();
          Get.offAllNamed(Routes.root);
        } else {
          if (dataProfile.data != null) {
            userProfileData.value = dataProfile.data!;
          } else {
            // Functions.checkErrorPopup("");
          }
          // setSharePreferences(data);
        }
      }

    } catch (e) {
      // Get.back();
      isLoading.value = false;
      Functions.checkErrorPopup(e);
    }
  }

}