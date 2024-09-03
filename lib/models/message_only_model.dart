class only_message_model {
  String? message;
  int? code;

  only_message_model({this.message, this.code});

  only_message_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
