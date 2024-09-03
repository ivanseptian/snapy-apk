import 'package:flutter/cupertino.dart';
import 'package:markaz_snappy/models/banners_model.dart';
import 'package:markaz_snappy/models/transaction_model.dart';

import '../../data/network/api.dart';
import '../../models/login_model.dart';

class HomeScreenService {

  Future<List<banners_model>?> banners() async {
    var res = await Api.bannersData();
    try {
      List<banners_model> dataJson;
      dataJson = List<banners_model>.from(res.map((model)=> banners_model.fromJson(model)));

      return dataJson;
    } catch (e) {
      print("banners: "+e.toString());
      return null;
    }
  }

  Future<login_model?> profile() async {
    try {
      var res = await Api.profile();
      login_model dataJson;
      dataJson = login_model.fromJson(res);
      return dataJson;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Transaction?> transaction(String page, String limit) async {
    try {
      var res = await Api.transactionData(page, limit);
      Transaction dataJson;
      dataJson = Transaction.fromJson(res);
      return dataJson;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

}