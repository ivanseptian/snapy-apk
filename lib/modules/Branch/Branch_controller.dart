import 'package:get/get.dart';
import 'package:markaz_snappy/models/branch_model.dart';

import 'package:markaz_snappy/modules/Branch/Branch.dart';

import '../../utils/function.dart';

class BranchController extends GetxController {

  final BranchService _service;

  BranchController(this._service);

  var listBranch = <branch_model>[].obs;

  @override
  void onInit() {
    loadBranch();
    super.onInit();

  }

  Future<void> loadBranch() async {
    try {
      // CoolAlert.show(
      //     context: Get.context!,
      //     type: CoolAlertType.loading,
      //     text: StringValue.loading
      // );

      List<branch_model>? branch = await _service.branchList();
      // Get.back();
      if(branch!=null) {
        listBranch.value = branch;
      } else {
        Functions.checkErrorPopup("");
      }
    } catch (e) {
      // Get.back();
      Functions.checkErrorPopup(e);
    }
  }

}