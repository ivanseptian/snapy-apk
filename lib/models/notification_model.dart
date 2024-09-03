class notification_model {
  String? title;
  String? content;
  String? datetime;

  notification_model({this.title, this.content, this.datetime});

  notification_model.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['datetime'] = this.datetime;
    return data;
  }
}
