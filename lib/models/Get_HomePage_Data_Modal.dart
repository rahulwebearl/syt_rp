class Get_HomePage_Data_Model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Get_HomePage_Data_Model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Get_HomePage_Data_Model.fromJson(Map<String, dynamic> json) {
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
  List<VisaOnArrival>? visaOnArrival;
  List<DestinationData>? destinationData;
  List<MostLovaedDestionation>? mostLovaedDestionation;
  List<Saftyinformation>? saftyinformation;
  List<HotelData>? hotelData;

  Data(
      {this.visaOnArrival,
      this.destinationData,
      this.mostLovaedDestionation,
      this.saftyinformation,
      this.hotelData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['visa_on_Arrival'] != null) {
      visaOnArrival = <VisaOnArrival>[];
      json['visa_on_Arrival'].forEach((v) {
        visaOnArrival!.add(new VisaOnArrival.fromJson(v));
      });
    }
    if (json['DestinationData'] != null) {
      destinationData = <DestinationData>[];
      json['DestinationData'].forEach((v) {
        destinationData!.add(new DestinationData.fromJson(v));
      });
    }
    if (json['most_lovaed_destionation'] != null) {
      mostLovaedDestionation = <MostLovaedDestionation>[];
      json['most_lovaed_destionation'].forEach((v) {
        mostLovaedDestionation!.add(new MostLovaedDestionation.fromJson(v));
      });
    }
    if (json['Saftyinformation'] != null) {
      saftyinformation = <Saftyinformation>[];
      json['Saftyinformation'].forEach((v) {
        saftyinformation!.add(new Saftyinformation.fromJson(v));
      });
    }
    if (json['hotel_data'] != null) {
      hotelData = <HotelData>[];
      json['hotel_data'].forEach((v) {
        hotelData!.add(new HotelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.visaOnArrival != null) {
      data['visa_on_Arrival'] =
          this.visaOnArrival!.map((v) => v.toJson()).toList();
    }
    if (this.destinationData != null) {
      data['DestinationData'] =
          this.destinationData!.map((v) => v.toJson()).toList();
    }
    if (this.mostLovaedDestionation != null) {
      data['most_lovaed_destionation'] =
          this.mostLovaedDestionation!.map((v) => v.toJson()).toList();
    }
    if (this.saftyinformation != null) {
      data['Saftyinformation'] =
          this.saftyinformation!.map((v) => v.toJson()).toList();
    }
    if (this.hotelData != null) {
      data['hotel_data'] = this.hotelData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisaOnArrival {
  String? sId;
  List<String>? destinationId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Destinations>? destinations;

  VisaOnArrival(
      {this.sId,
      this.destinationId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.destinations});

  VisaOnArrival.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationId = json['destination_id'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['destinations'] != null) {
      destinations = <Destinations>[];
      json['destinations'].forEach((v) {
        destinations!.add(new Destinations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_id'] = this.destinationId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.destinations != null) {
      data['destinations'] = this.destinations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destinations {
  String? sId;
  String? destinationName;
  List<String>? destinationCategoryId;
  String? howToReach;
  String? aboutDestination;
  String? bestTimeForVisit;
  bool? status;
  int? iV;
  bool? mostLovedDestionation;
  List<Null>? destinations;

  Destinations(
      {this.sId,
      this.destinationName,
      this.destinationCategoryId,
      this.howToReach,
      this.aboutDestination,
      this.bestTimeForVisit,
      this.status,
      this.iV,
      this.mostLovedDestionation,
      this.destinations});

  Destinations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationName = json['destination_name'];
    destinationCategoryId = json['destination_category_id'].cast<String>();
    howToReach = json['how_to_reach'];
    aboutDestination = json['about_destination'];
    bestTimeForVisit = json['best_time_for_visit'];
    status = json['status'];
    iV = json['__v'];
    mostLovedDestionation = json['most_loved_destionation'];
    // if (json['destinations'] != null) {
    //   destinations = <Null>[];
    //   json['destinations'].forEach((v) {
    //     destinations!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_name'] = this.destinationName;
    data['destination_category_id'] = this.destinationCategoryId;
    data['how_to_reach'] = this.howToReach;
    data['about_destination'] = this.aboutDestination;
    data['best_time_for_visit'] = this.bestTimeForVisit;
    data['status'] = this.status;
    data['__v'] = this.iV;
    data['most_loved_destionation'] = this.mostLovedDestionation;
    // if (this.destinations != null) {
    //   data['destinations'] = this.destinations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class DestinationData {
  String? sId;
  String? categoryName;
  String? photo;
  bool? status;
  int? iV;

  DestinationData(
      {this.sId, this.categoryName, this.photo, this.status, this.iV});

  DestinationData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['category_name'];
    photo = json['photo'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_name'] = this.categoryName;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class MostLovaedDestionation {
  String? sId;
  String? destinationName;
  String? placeToVisits;

  MostLovaedDestionation({this.sId, this.destinationName, this.placeToVisits});

  MostLovaedDestionation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationName = json['destination_name'];
    placeToVisits = json['place_to_visits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_name'] = this.destinationName;
    data['place_to_visits'] = this.placeToVisits;
    return data;
  }
}

class Saftyinformation {
  Info? info;
  List<Safetyinfo>? safetyinfo;

  Saftyinformation({this.info, this.safetyinfo});

  Saftyinformation.fromJson(Map<String, dynamic> json) {
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

class HotelData {
  String? sId;
  String? userId;
  String? hotelName;
  String? hotelAddress;
  String? hotelDescription;
  List<String>? hotelHighlights;
  List<String>? hotelPhoto;
  int? hotelType;
  String? city;
  String? state;
  List<String>? other;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  HotelData(
      {this.sId,
      this.userId,
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
      this.iV});

  HotelData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    hotelName = json['hotel_name'];
    hotelAddress = json['hotel_address'];
    hotelDescription = json['hotel_description'];
    hotelHighlights = json['hotel_highlights'].cast<String>();
    hotelPhoto = json['hotel_photo'].cast<String>();
    hotelType = json['hotel_type'];
    city = json['city'];
    state = json['state'];
    other = json['other'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['hotel_name'] = this.hotelName;
    data['hotel_address'] = this.hotelAddress;
    data['hotel_description'] = this.hotelDescription;
    data['hotel_highlights'] = this.hotelHighlights;
    data['hotel_photo'] = this.hotelPhoto;
    data['hotel_type'] = this.hotelType;
    data['city'] = this.city;
    data['state'] = this.state;
    data['other'] = this.other;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}






// class Get_HomePage_Data_Model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   Get_HomePage_Data_Model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   Get_HomePage_Data_Model.fromJson(Map<String, dynamic> json) {
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
//   List<Slider>? slider;
//   List<DestinationData>? destinationData;
//   List<MostLovaedDestionation>? mostLovaedDestionation;
//   List<Saftyinformation>? saftyinformation;
//
//   Data(
//       {this.slider,
//         this.destinationData,
//         this.mostLovaedDestionation,
//         this.saftyinformation});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['slider'] != null) {
//       slider = <Slider>[];
//       json['slider'].forEach((v) {
//         slider!.add(new Slider.fromJson(v));
//       });
//     }
//     if (json['DestinationData'] != null) {
//       destinationData = <DestinationData>[];
//       json['DestinationData'].forEach((v) {
//         destinationData!.add(new DestinationData.fromJson(v));
//       });
//     }
//     if (json['most_lovaed_destionation'] != null) {
//       mostLovaedDestionation = <MostLovaedDestionation>[];
//       json['most_lovaed_destionation'].forEach((v) {
//         mostLovaedDestionation!.add(new MostLovaedDestionation.fromJson(v));
//       });
//     }
//     if (json['Saftyinformation'] != null) {
//       saftyinformation = <Saftyinformation>[];
//       json['Saftyinformation'].forEach((v) {
//         saftyinformation!.add(new Saftyinformation.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.slider != null) {
//       data['slider'] = this.slider!.map((v) => v.toJson()).toList();
//     }
//     if (this.destinationData != null) {
//       data['DestinationData'] =
//           this.destinationData!.map((v) => v.toJson()).toList();
//     }
//     if (this.mostLovaedDestionation != null) {
//       data['most_lovaed_destionation'] =
//           this.mostLovaedDestionation!.map((v) => v.toJson()).toList();
//     }
//     if (this.saftyinformation != null) {
//       data['Saftyinformation'] =
//           this.saftyinformation!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Slider {
//   String? sId;
//   List<String>? photo;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Slider({this.sId, this.photo, this.createdAt, this.updatedAt, this.iV});
//
//   Slider.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     photo = json['photo'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['photo'] = this.photo;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class DestinationData {
//   String? sId;
//   String? categoryName;
//   String? photo;
//   bool? status;
//   int? iV;
//
//   DestinationData(
//       {this.sId, this.categoryName, this.photo, this.status, this.iV});
//
//   DestinationData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     categoryName = json['category_name'];
//     photo = json['photo'];
//     status = json['status'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['category_name'] = this.categoryName;
//     data['photo'] = this.photo;
//     data['status'] = this.status;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class MostLovaedDestionation {
//   String? sId;
//   String? destinationName;
//   String? placeToVisits;
//
//   MostLovaedDestionation({this.sId, this.destinationName, this.placeToVisits});
//
//   MostLovaedDestionation.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     destinationName = json['destination_name'];
//     placeToVisits = json['place_to_visits'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['destination_name'] = this.destinationName;
//     data['place_to_visits'] = this.placeToVisits;
//     return data;
//   }
// }
//
// class Saftyinformation {
//   Info? info;
//   List<Safetyinfo>? safetyinfo;
//
//   Saftyinformation({this.info, this.safetyinfo});
//
//   Saftyinformation.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? new Info.fromJson(json['info']) : null;
//     if (json['safetyinfo'] != null) {
//       safetyinfo = <Safetyinfo>[];
//       json['safetyinfo'].forEach((v) {
//         safetyinfo!.add(new Safetyinfo.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.info != null) {
//       data['info'] = this.info!.toJson();
//     }
//     if (this.safetyinfo != null) {
//       data['safetyinfo'] = this.safetyinfo!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Info {
//   String? sId;
//   String? description;
//   int? iV;
//
//   Info({this.sId, this.description, this.iV});
//
//   Info.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     description = json['description'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['description'] = this.description;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class Safetyinfo {
//   String? sId;
//   String? safetyinfoPhoto;
//   String? safetyinfoTitle;
//   String? descriptionId;
//   int? iV;
//
//   Safetyinfo(
//       {this.sId,
//         this.safetyinfoPhoto,
//         this.safetyinfoTitle,
//         this.descriptionId,
//         this.iV});
//
//   Safetyinfo.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     safetyinfoPhoto = json['safetyinfo_photo'];
//     safetyinfoTitle = json['safetyinfo_title'];
//     descriptionId = json['description_id'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['safetyinfo_photo'] = this.safetyinfoPhoto;
//     data['safetyinfo_title'] = this.safetyinfoTitle;
//     data['description_id'] = this.descriptionId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
