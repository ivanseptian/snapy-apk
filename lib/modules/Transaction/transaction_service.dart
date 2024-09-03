

import 'package:flutter/cupertino.dart';

import '../../data/network/api.dart';
import '../../models/transaction_model.dart';

class TransactionService {

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