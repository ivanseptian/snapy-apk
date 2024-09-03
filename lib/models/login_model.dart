class login_model {
  String? message;
  String? accessToken;
  String? tokenType;
  Data? data;

  login_model({this.message, this.accessToken, this.tokenType, this.data});

  login_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? loginName;
  String? loginEmail;
  String? loginPhone;
  String? loginId;
  String? address;
  int? point;
  String? expiredDate;
  String? type;
  String? memberTypeDesc;
  String? idTypeMembership;
  String? imageCardUrl;
  String? nextMembership;
  int? year;
  int? totalTransactionThisYear;
  int? remainingTransaction;
  int? targetTransaction;
  int? totalQtyTransaction;
  int? remainingQtyTransaction;

  Data(
      {this.loginName,
        this.loginEmail,
        this.loginPhone,
        this.loginId,
        this.address,
        this.point,
        this.expiredDate,
      this.type,
      this.idTypeMembership,
      this.memberTypeDesc,
        this.nextMembership,
        this.imageCardUrl,
      this.year,
      this.totalTransactionThisYear,
      this.remainingTransaction,
      this.targetTransaction,
      this.totalQtyTransaction,
      this.remainingQtyTransaction});

  Data.fromJson(Map<String, dynamic> json) {
    loginName = json['LoginName'];
    loginEmail = json['LoginEmail'];
    loginPhone = json['LoginPhone'];
    loginId = json['LoginId'];
    address = json['address'];
    point = json['point'];
    nextMembership = json['nextMembership'];
    expiredDate = json['expiredDate'];
    type = json['type'].toString();
    idTypeMembership = json['idTypeMembership'];
    imageCardUrl = json['ImageUrl'];
    memberTypeDesc = json['memberTypeDesc'];
    year = json['year'];
    totalTransactionThisYear = json['totalTransactionThisYear'];
    remainingTransaction = json['remainingTransaction'];
    targetTransaction = json['targetTransaction'];
    totalQtyTransaction = json['totalQtyTransaction'];
    remainingQtyTransaction = json['remainingQtyTransaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginName'] = this.loginName;
    data['LoginEmail'] = this.loginEmail;
    data['LoginPhone'] = this.loginPhone;
    data['LoginId'] = this.loginId;
    data['address'] = this.address;
    data['point'] = this.point;
    data['expiredDate'] = this.expiredDate;
    return data;
  }
}