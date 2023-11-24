//import 'package:flutter/material.dart';

class MostLovedDisplayModel {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  MostLovedDisplayModel(
      {this.code, this.status, this.message, this.metadata, this.data});

  MostLovedDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? destinationName;
  List<PlaceToVisits>? placeToVisits;

  Data({this.sId, this.destinationName, this.placeToVisits});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationName = json['destination_name'];
    if (json['place_to_visits'] != null) {
      placeToVisits = <PlaceToVisits>[];
      json['place_to_visits'].forEach((v) {
        placeToVisits!.add(new PlaceToVisits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_name'] = this.destinationName;
    if (this.placeToVisits != null) {
      data['place_to_visits'] =
          this.placeToVisits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlaceToVisits {
  String? photo;

  PlaceToVisits({this.photo});

  PlaceToVisits.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    return data;
  }
}
