class Transaction {
  List<DataTransaction>? data;
  int? totalPage;
  int? totalData;
  String? message;

  Transaction({this.data, this.totalPage, this.totalData, this.message});

  Transaction.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataTransaction>[];
      json['data'].forEach((v) {
        data!.add(DataTransaction.fromJson(v));
      });
    }
    totalPage = json['total_page'];
    totalData = json['total_data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_page'] = totalPage;
    data['total_data'] = totalData;
    return data;
  }
}

class DataTransaction {
  int? totalTransaction;
  int? totalAmount;
  String? datetime;
  String? cabang;

  DataTransaction({this.totalTransaction, this.totalAmount, this.datetime});

  DataTransaction.fromJson(Map<String, dynamic> json) {
    totalTransaction = json['total_transaction'];
    totalAmount = json['total_amount'];
    datetime = json['datetime'];
    cabang = json['cabang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_transaction'] = totalTransaction;
    data['total_amount'] = totalAmount;
    data['datetime'] = datetime;
    return data;
  }
}
