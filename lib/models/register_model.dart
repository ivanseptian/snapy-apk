class register_model {
  Data? data;
  String? accessToken;
  String? tokenType;

  register_model({this.data, this.accessToken, this.tokenType});

  register_model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class Data {
  String? loginId;
  String? loginName;
  String? loginEmail;
  String? loginPhone;

  Data({this.loginId, this.loginName, this.loginEmail, this.loginPhone});

  Data.fromJson(Map<String, dynamic> json) {
    loginId = json['LoginId'];
    loginName = json['LoginName'];
    loginEmail = json['LoginEmail'];
    loginPhone = json['LoginPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginId'] = this.loginId;
    data['LoginName'] = this.loginName;
    data['LoginEmail'] = this.loginEmail;
    data['LoginPhone'] = this.loginPhone;
    return data;
  }
}
