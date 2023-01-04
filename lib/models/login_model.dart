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
  String? memberType;

  Data(
      {this.loginName,
        this.loginEmail,
        this.loginPhone,
        this.loginId,
        this.address,
        this.point,
        this.expiredDate,
      this.memberType});

  Data.fromJson(Map<String, dynamic> json) {
    loginName = json['LoginName'];
    loginEmail = json['LoginEmail'];
    loginPhone = json['LoginPhone'];
    loginId = json['LoginId'];
    address = json['address'];
    point = json['point'];
    expiredDate = json['expiredDate'];
    memberType = json['memberType'];
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