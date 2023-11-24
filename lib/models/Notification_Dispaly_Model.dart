class Notification_dispaly_Model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Notification_dispaly_Model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Notification_dispaly_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? length;

  Metadata({this.length});

  Metadata.fromJson(Map<String, dynamic> json) {
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? text;
  String? userId;
  String? userType;
  String? dateAndTime;
  int? iV;

  Data(
      {this.sId,
        this.title,
        this.text,
        this.userId,
        this.userType,
        this.dateAndTime,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    text = json['text'];
    userId = json['user_id'];
    userType = json['user_type'];
    dateAndTime = json['date_and_time'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['date_and_time'] = this.dateAndTime;
    data['__v'] = this.iV;
    return data;
  }
}
