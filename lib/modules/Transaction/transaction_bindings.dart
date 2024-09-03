import 'package:get/get.dart';
import 'package:markaz_snappy/modules/Transaction/transaction_controller.dart';
import 'package:markaz_snappy/modules/Transaction/transaction_service.dart';

class TransactionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController(TransactionService()));
  }
}