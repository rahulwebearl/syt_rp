class user_info_model {
user_info_model({this.code, this.status, this.message, this.metadata, this.data});
  
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data?>? data;

  

  user_info_model.fromJson(Map<String, dynamic> json) {
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
      data['data'] = this.data!.map((v) => v!.toJson()).toList();
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


class Data{
  Data({
    this.id,
    this.phone,
    this.password,
    this.role,
    this.v,
    this.userDetails,
  });

  String? id;
  int? phone;
  String? password;
  String? role;
  int? v;
  List<UserDetail?>? userDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        phone: json["phone"],
        password: json["password"],
        role: json["role"],
        v: json["__v"],
        userDetails: json["user_details"] == null
            ? []
            : List<UserDetail?>.from(
                json["user_details"]!.map((x) => UserDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "password": password,
        "role": role,
        "__v": v,
        "user_details": userDetails == null
            ? []
            : List<dynamic>.from(userDetails!.map((x) => x!.toJson())),
      };
}

class UserDetail {
  UserDetail({
    this.id,
    this.name,
    this.emailAddress,
    this.gender,
    this.state,
    this.city,
    this.isProfilecompleted,
    this.notificationTokens,
    this.userId,
    this.v,
    this.photo,
  });

  String? id;
  String? name;
  String? emailAddress;
  String? gender;
  String? state;
  String? city;
  bool? isProfilecompleted;
  dynamic notificationTokens;
  String? userId;
  int? v;
  String? photo;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["_id"],
        name: json["name"],
        emailAddress: json["email_address"],
        gender: json["gender"],
        state: json["state"],
        city: json["city"],
        isProfilecompleted: json["isProfilecompleted"],
        notificationTokens: json["notificationTokens"],
        userId: json["user_id"],
        v: json["__v"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email_address": emailAddress,
        "gender": gender,
        "state": state,
        "city": city,
        "isProfilecompleted": isProfilecompleted,
        "notificationTokens": notificationTokens,
        "user_id": userId,
        "__v": v,
        "photo": photo,
      };
}
