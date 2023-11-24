
class ReviewComment {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  ReviewComment({this.code, this.status, this.message, this.metadata, this.data});

  ReviewComment.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["metadata"] is Map) {
      metadata = json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    _data["message"] = message;
    if(metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? userId;
  String? star;
  String? bookPackageId;
  String? commentBox;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.userId, this.star, this.bookPackageId, this.commentBox, this.id, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["user_id"] is String) {
      userId = json["user_id"];
    }
    if(json["star"] is String) {
      star = json["star"];
    }
    if(json["book_package_id"] is String) {
      bookPackageId = json["book_package_id"];
    }
    if(json["comment_box"] is String) {
      commentBox = json["comment_box"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["star"] = star;
    _data["book_package_id"] = bookPackageId;
    _data["comment_box"] = commentBox;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Metadata {
  int? length;

  Metadata({this.length});

  Metadata.fromJson(Map<String, dynamic> json) {
    if(json["length"] is int) {
      length = json["length"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["length"] = length;
    return _data;
  }
}