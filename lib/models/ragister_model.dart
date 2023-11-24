// import 'dart:convert';
// register_model loginModelFromJson(String str) =>
//     register_model.fromJson(json.decode(str));

// String loginModelToJson(register_model data) => json.encode(data.toJson());


// class register_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   Data? data;

//   register_model(
//       {this.code, this.status, this.message, this.metadata, this.data});

//   register_model.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     message = json['message'];
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.metadata != null) {
//       data['metadata'] = this.metadata!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Metadata {
//   int? length;

//   Metadata({this.length});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     length = json['length'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['length'] = this.length;
//     return data;
//   }
// }

// class Data {
//   String? name;
//   String? emailAddress;
//   int? mobileNumber;
//   String? password;
//   // String? referalCode;
//   String? gender;
//   String? state;
//   String? city;
//   String? status;
//   String? sId;
//   int? iV;

//   Data(
//       {this.name,
//         this.emailAddress,
//         this.mobileNumber,
//         this.password,
//         // this.referalCode,
//         this.gender,
//         this.state,
//         this.city,
//         this.status,
//         this.sId,
//         this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     emailAddress = json['email_address'];
//     mobileNumber = json['phone'];
//     password = json['password'];
//     // referalCode = json['referal_code'];
//     gender = json['gender'];
//     state = json['state'];
//     city = json['city'];
//     status = json['status'];
//     sId = json['_id'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['email_address'] = this.emailAddress;
//     data['phone'] = this.mobileNumber;
//     data['password'] = this.password;
//     // data['referal_code'] = this.referalCode;
//     data['gender'] = this.gender;
//     data['state'] = this.state;
//     data['city'] = this.city;
//     data['status'] = this.status;
//     data['_id'] = this.sId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

class RegisterModel {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  RegisterModel(
      {this.code, this.status, this.message, this.metadata, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
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
  String? name;
  String? emailAddress;
  String? gender;
  String? state;
  String? city;
  int? phone;
  bool? isProfilecompleted;
  Null? notificationTokens;
  String? userId;
  String? sId;
  int? iV;

  Data(
      {this.name,
      this.emailAddress,
      this.gender,
      this.state,
      this.city,
      this.phone,
      this.isProfilecompleted,
      this.notificationTokens,
      this.userId,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    emailAddress = json['email_address'];
    gender = json['gender'];
    state = json['state'];
    city = json['city'];
    phone = json['phone'];
    isProfilecompleted = json['isProfilecompleted'];
    notificationTokens = json['notificationTokens'];
    userId = json['user_id'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email_address'] = this.emailAddress;
    data['gender'] = this.gender;
    data['state'] = this.state;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['isProfilecompleted'] = this.isProfilecompleted;
    data['notificationTokens'] = this.notificationTokens;
    data['user_id'] = this.userId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
