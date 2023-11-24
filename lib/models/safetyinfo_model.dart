class safetyinfo_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  safetyinfo_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  safetyinfo_model.fromJson(Map<String, dynamic> json) {
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
  Info? info;
  List<Safetyinfo>? safetyinfo;

  Data({this.info, this.safetyinfo});

  Data.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['safetyinfo'] != null) {
      safetyinfo = <Safetyinfo>[];
      json['safetyinfo'].forEach((v) {
        safetyinfo!.add(new Safetyinfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.safetyinfo != null) {
      data['safetyinfo'] = this.safetyinfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? sId;
  String? description;
  int? iV;

  Info({this.sId, this.description, this.iV});

  Info.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}

class Safetyinfo {
  String? sId;
  String? safetyinfoPhoto;
  String? safetyinfoTitle;
  String? descriptionId;
  int? iV;

  Safetyinfo(
      {this.sId,
        this.safetyinfoPhoto,
        this.safetyinfoTitle,
        this.descriptionId,
        this.iV});

  Safetyinfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    safetyinfoPhoto = json['safetyinfo_photo'];
    safetyinfoTitle = json['safetyinfo_title'];
    descriptionId = json['description_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['safetyinfo_photo'] = this.safetyinfoPhoto;
    data['safetyinfo_title'] = this.safetyinfoTitle;
    data['description_id'] = this.descriptionId;
    data['__v'] = this.iV;
    return data;
  }
}
