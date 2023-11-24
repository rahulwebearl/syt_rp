class BlogDetailsModel {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  BlogDetailsModel(
      {this.code, this.status, this.message, this.metadata, this.data});

  BlogDetailsModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? blogTitlePoints;
  String? blogCategory;
  String? blogTitlePhoto;
  String? blogContent;
  String? bloggerSytId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<BloggerSytDetails>? bloggerSytDetails;

  Data(
      {this.sId,
        this.blogTitle,
        this.blogTitlePoints,
        this.blogCategory,
        this.blogTitlePhoto,
        this.blogContent,
        this.bloggerSytId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.bloggerSytDetails});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    blogTitle = json['blog_title'];
    blogTitlePoints = json['blog_title_points'].cast<String>();
    blogCategory = json['blog_category'];
    blogTitlePhoto = json['blog_title_photo'];
    blogContent = json['blog_content'];
    bloggerSytId = json['blogger_syt_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['blogger_syt_details'] != null) {
      bloggerSytDetails = <BloggerSytDetails>[];
      json['blogger_syt_details'].forEach((v) {
        bloggerSytDetails!.add(new BloggerSytDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['blog_title'] = this.blogTitle;
    data['blog_title_points'] = this.blogTitlePoints;
    data['blog_category'] = this.blogCategory;
    data['blog_title_photo'] = this.blogTitlePhoto;
    data['blog_content'] = this.blogContent;
    data['blogger_syt_id'] = this.bloggerSytId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.bloggerSytDetails != null) {
      data['blogger_syt_details'] =
          this.bloggerSytDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloggerSytDetails {
  String? sId;
  String? blogOwnerName;
  String? blogOwnerPhoto;
  int? mobileNumber;
  String? emaiId;
  String? city;
  String? state;
  String? country;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BloggerSytDetails(
      {this.sId,
        this.blogOwnerName,
        this.blogOwnerPhoto,
        this.mobileNumber,
        this.emaiId,
        this.city,
        this.state,
        this.country,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BloggerSytDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    blogOwnerName = json['blog_owner_name'];
    blogOwnerPhoto = json['blog_owner_photo'];
    mobileNumber = json['mobile_number'];
    emaiId = json['emai_id'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['blog_owner_name'] = this.blogOwnerName;
    data['blog_owner_photo'] = this.blogOwnerPhoto;
    data['mobile_number'] = this.mobileNumber;
    data['emai_id'] = this.emaiId;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
