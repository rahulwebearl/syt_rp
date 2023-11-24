// class update_profile {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   update_profile(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   update_profile.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     message = json['message'];
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.metadata != null) {
//       data['metadata'] = this.metadata!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Metadata {
//   int? length;
//
//   Metadata({this.length});
//
//   Metadata.fromJson(Map<String, dynamic> json) {
//     length = json['length'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['length'] = this.length;
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   String? name;
//   String? emailAddress;
//   String? mobileNumber;
//   String? password;
//   String? referalCode;
//   String? gender;
//   String? state;
//   String? city;
//   String? status;
//   int? iV;
//
//   Data(
//       {this.sId,
//         this.name,
//         this.emailAddress,
//         this.mobileNumber,
//         this.password,
//         this.referalCode,
//         this.gender,
//         this.state,
//         this.city,
//         this.status,
//         this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     emailAddress = json['email_address'];
//     mobileNumber = json['mobile_number'];
//     password = json['password'];
//     referalCode = json['referal_code'];
//     gender = json['gender'];
//     state = json['state'];
//     city = json['city'];
//     status = json['status'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['email_address'] = this.emailAddress;
//     data['mobile_number'] = this.mobileNumber;
//     data['password'] = this.password;
//     data['referal_code'] = this.referalCode;
//     data['gender'] = this.gender;
//     data['state'] = this.state;
//     data['city'] = this.city;
//     data['status'] = this.status;
//     data['__v'] = this.iV;
//     return data;
//   }
//
//    Map<String, dynamic> toJsonEdit() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     // data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['email_address'] = this.emailAddress;
//     // data['mobile_number'] = this.mobileNumber;
//     // data['password'] = this.password;
//     // data['referal_code'] = this.referalCode;
//     // data['gender'] = this.gender;
//     data['state'] = this.state;
//     data['city'] = this.city;
//     // data['status'] = this.status;
//     // data['__v'] = this.iV;
//     return data;
//   }
// }
class update_profile {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  update_profile(
      {this.code, this.status, this.message, this.metadata, this.data});

  update_profile.fromJson(Map<String, dynamic> json) {
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
  bool? acknowledged;
  int? modifiedCount;
  Null? upsertedId;
  int? upsertedCount;
  int? matchedCount;

  Data(
      {this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acknowledged'] = this.acknowledged;
    data['modifiedCount'] = this.modifiedCount;
    data['upsertedId'] = this.upsertedId;
    data['upsertedCount'] = this.upsertedCount;
    data['matchedCount'] = this.matchedCount;
    return data;
  }
}
