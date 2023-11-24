class submit_review_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  submit_review_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  submit_review_model.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? star;
  String? bookPackageId;
  String? commentBox;
  String? sId;
  int? iV;

  Data(
      {this.userId,
        this.star,
        this.bookPackageId,
        this.commentBox,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    star = json['star'];
    bookPackageId = json['book_package_id'];
    commentBox = json['comment_box'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['star'] = this.star;
    data['book_package_id'] = this.bookPackageId;
    data['comment_box'] = this.commentBox;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
