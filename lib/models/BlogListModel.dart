class BlogListModel {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  BlogListModel(
      {this.code, this.status, this.message, this.metadata, this.data});

  BlogListModel.fromJson(Map<String, dynamic> json) {
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
  String? blogTitle;
  String? blogTitlePhoto;
  String? blogContent;
  String? createdAt;
  String? bloggerId;
  String? bloggerName;
  String? bloggerPhoto;

  Data(
      {this.sId,
        this.blogTitle,
        this.blogTitlePhoto,
        this.blogContent,
        this.createdAt,
        this.bloggerId,
        this.bloggerName,
        this.bloggerPhoto});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    blogTitle = json['blog_title'];
    blogTitlePhoto = json['blog_title_photo'];
    blogContent = json['blog_content'];
    createdAt = json['createdAt'];
    bloggerId = json['blogger_id'];
    bloggerName = json['blogger_name'];
    bloggerPhoto = json['blogger_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['blog_title'] = this.blogTitle;
    data['blog_title_photo'] = this.blogTitlePhoto;
    data['blog_content'] = this.blogContent;
    data['createdAt'] = this.createdAt;
    data['blogger_id'] = this.bloggerId;
    data['blogger_name'] = this.bloggerName;
    data['blogger_photo'] = this.bloggerPhoto;
    return data;
  }
}
