import 'package:markaz_snappy/models/branch_model.dart';

import '../../data/network/api.dart';

class BranchService {
  Future<List<branch_model>?> branchList() async {
    var res = await Api.branch();
    try {
      List<branch_model> dataJson;
      dataJson = List<branch_model>.from(res.map((model)=> branch_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("branchList: "+e.toString());
      return null;
    }
  }
}