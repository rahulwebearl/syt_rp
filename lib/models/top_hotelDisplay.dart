class HotelDisplayModel {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  HotelDisplayModel(
      {this.code, this.status, this.message, this.metadata, this.data});

  HotelDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? hotelName;
  String? hotelAddress;
  String? hotelDescription;
  List<String>? hotelHighlights;
  List<Null>? hotelPhoto;
  int? hotelType;
  String? city;
  String? state;
  List<String>? other;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Rooms>? rooms;

  Data(
      {this.sId,
        this.hotelName,
        this.hotelAddress,
        this.hotelDescription,
        this.hotelHighlights,
        this.hotelPhoto,
        this.hotelType,
        this.city,
        this.state,
        this.other,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotelName = json['hotel_name'];
    hotelAddress = json['hotel_address'];
    hotelDescription = json['hotel_description'];
    hotelHighlights = json['hotel_highlights'].cast<String>();
    // if (json['hotel_photo'] != null) {
    //   hotelPhoto = <Null>[];
    //   json['hotel_photo'].forEach((v) {
    //     hotelPhoto!.add(new Null.fromJson(v));
    //   });
    // }
    hotelType = json['hotel_type'];
    city = json['city'];
    state = json['state'];
    other = json['other'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotel_name'] = this.hotelName;
    data['hotel_address'] = this.hotelAddress;
    data['hotel_description'] = this.hotelDescription;
    data['hotel_highlights'] = this.hotelHighlights;
    // if (this.hotelPhoto != null) {
    //   data['hotel_photo'] = this.hotelPhoto!.map((v) => v.toJson()).toList();
    // }
    data['hotel_type'] = this.hotelType;
    data['city'] = this.city;
    data['state'] = this.state;
    data['other'] = this.other;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  String? sId;
  String? roomTitle;
  List<Null>? photos;
  List<String>? roomHighlights;
  int? price;
  String? hotelId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Rooms(
      {this.sId,
        this.roomTitle,
        this.photos,
        this.roomHighlights,
        this.price,
        this.hotelId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Rooms.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roomTitle = json['room_title'];
    // if (json['photos'] != null) {
    //   photos = <Null>[];
    //   json['photos'].forEach((v) {
    //     photos!.add(new Null.fromJson(v));
    //   });
    // }
    roomHighlights = json['room_highlights'].cast<String>();
    price = json['price'];
    hotelId = json['hotel_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['room_title'] = this.roomTitle;
    // if (this.photos != null) {
    //   data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    // }
    data['room_highlights'] = this.roomHighlights;
    data['price'] = this.price;
    data['hotel_id'] = this.hotelId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}