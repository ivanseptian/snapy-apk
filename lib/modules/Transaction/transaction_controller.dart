import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:markaz_snappy/models/transaction_model.dart';
import 'package:markaz_snappy/modules/Transaction/transaction_service.dart';

import '../../config/strings.dart';
import '../../routes/routes.dart';
import '../../utils/function.dart';
import '../../utils/prefs.dart';

class TransactionController extends GetxController {

  final TransactionService _transactionService;

  TransactionController(this._transactionService);

  var isLoading = false.obs;
  var listTransaction = <DataTransaction>[].obs;
  int totalPage = 0;
  ScrollController scrollController = ScrollController();

  int limitLoadPage = 20;
  int pageActive = 1;

  @override
  Future<void> onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    String token = await Prefs.getString(StringValue.sessionTokenStr)??"";
    String? isTokenVerified = await Prefs.getString(StringValue.sessionTokenIsVerified);
    if (isTokenVerified == "1") {
      if (token.isNotEmpty) {
        getData();
      }
    }
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading.value) {
      loadMoreData();
    }
  }

  void loadMoreData() {
    if (pageActive < totalPage) {
      pageActive++;
      getData(isLoadMore: true);
    }
  }

  Future<void> getData({bool isLoadMore = false}) async{
    try {
      isLoading.value = true;
      Transaction? dataTransaction = await _transactionService.transaction(pageActive.toString(), limitLoadPage.toString());
      isLoading.value = false;
      if(dataTransaction!=null) {
        if(dataTransaction.message?.toLowerCase() == "unauthenticated."){
          Prefs.clear();
          Get.offAllNamed(Routes.root);
        } else {
          if (dataTransaction.data != null) {
            totalPage = dataTransaction.totalPage??0;
            if (isLoadMore) {
              listTransaction.addAll(dataTransaction.data!);
            } else {
              listTransaction.value = dataTransaction.data!;
            }
          } else {
            Functions.checkErrorPopup("");
          }
        }
      }
    } catch (e) {
      isLoading.value = false;
      Functions.checkErrorPopup(e);
    }
  }

}