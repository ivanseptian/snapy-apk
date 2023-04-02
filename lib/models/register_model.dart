class register_model {
  Data? data;
  String? accessToken;
  String? tokenType;
  String? message;
  Errors? errors;

  register_model({this.data, this.accessToken, this.tokenType, this.message});

  register_model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    message = json['message'];
    errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
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

class Errors {
  List<String>? loginEmail;
  List<String>? loginPhone;

  Errors({this.loginEmail, this.loginPhone});

  Errors.fromJson(Map<String, dynamic> json) {
    loginEmail = json['LoginEmail'] != null ? json['LoginEmail'].cast<String>() : null;
    loginPhone = json['LoginPhone'] != null ? json['LoginPhone'].cast<String>() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginEmail'] = loginEmail;
    data['LoginPhone'] = loginPhone;
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
