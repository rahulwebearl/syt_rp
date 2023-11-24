// class display_userbid_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   display_userbid_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   display_userbid_model.fromJson(Map<String, dynamic> json) {
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
//   int? price;
//   String? date;
//   String? agency;
//
//   Data({this.sId, this.price, this.date, this.agency});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     price = json['Price'];
//     date = json['Date'];
//     agency = json['Agency'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['Price'] = this.price;
//     data['Date'] = this.date;
//     data['Agency'] = this.agency;
//     return data;
//   }
// }

import 'package:flutter/cupertino.dart';

class display_userbid_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  display_userbid_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  display_userbid_model.fromJson(Map<String, dynamic> json) {
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
  int? price;
  String? date;
  String? agency;

  Data({this.sId, this.price, this.date, this.agency});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['Price'];
    date = json['Date'];
    agency = json['Agency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Price'] = this.price;
    data['Date'] = this.date;
    data['Agency'] = this.agency;
    return data;
  }
}
