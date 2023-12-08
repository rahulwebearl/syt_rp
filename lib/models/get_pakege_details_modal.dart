class get_pakege_details_modal {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  get_pakege_details_modal(
      {this.code, this.status, this.message, this.metadata, this.data});

  get_pakege_details_modal.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? pricePerPerson;
  int? totalDays;
  int? totalNights;
  String? destination;
  List<String>? destinationCategoryId;
  List<String>? mealRequired;
  String? mealType;
  String? travelBy;
  List<String>? hotelType;
  String? moreDetails;
  String? placeToVisitId;
  List<IncludeService>? includeService;
  List<ExcludeService>? excludeService;
  String? sightseeing;
  List<Place>? place;
  List<Itinaries>? itinaries;
  String? day;

  Data(
      {this.sId,
      this.name,
      this.pricePerPerson,
      this.totalDays,
      this.totalNights,
      this.destination,
      this.destinationCategoryId,
      this.mealRequired,
      this.mealType,
      this.travelBy,
      this.hotelType,
      this.moreDetails,
      this.placeToVisitId,
      this.includeService,
      this.excludeService,
      this.sightseeing,
      this.place,
      this.itinaries,
      this.day});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    pricePerPerson = json['price_per_person'];
    totalDays = json['total_days'];
    totalNights = json['total_nights'];
    destination = json['destination'];
    destinationCategoryId = json['destination_category_id'].cast<String>();
    mealRequired = json['meal_required'].cast<String>();
    mealType = json['meal_type'] ?? '';
    travelBy = json['travel_by'] ?? '';
    hotelType = json['hotel_type'].cast<String>();
    moreDetails = json['more_details'];
    placeToVisitId = json['place_to_visit_id'];
    if (json['include_service'] != null) {
      includeService = <IncludeService>[];
      json['include_service'].forEach((v) {
        includeService!.add(new IncludeService.fromJson(v));
      });
    }
    if (json['exclude_service'] != null) {
      excludeService = <ExcludeService>[];
      json['exclude_service'].forEach((v) {
        excludeService!.add(new ExcludeService.fromJson(v));
      });
    }
    sightseeing = json['sightseeing'];
    if (json['Place'] != null) {
      place = <Place>[];
      json['Place'].forEach((v) {
        place!.add(new Place.fromJson(v));
      });
    }
    if (json['Itinaries'] != null) {
      itinaries = <Itinaries>[];
      json['Itinaries'].forEach((v) {
        itinaries!.add(new Itinaries.fromJson(v));
      });
    }
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price_per_person'] = this.pricePerPerson;
    data['total_days'] = this.totalDays;
    data['total_nights'] = this.totalNights;
    data['destination'] = this.destination;
    data['destination_category_id'] = this.destinationCategoryId;
    data['meal_required'] = this.mealRequired;
    data['meal_type'] = this.mealType;
    data['travel_by'] = this.travelBy;
    data['hotel_type'] = this.hotelType;
    data['more_details'] = this.moreDetails;
    data['place_to_visit_id'] = this.placeToVisitId;
    if (this.includeService != null) {
      data['include_service'] =
          this.includeService!.map((v) => v.toJson()).toList();
    }
    if (this.excludeService != null) {
      data['exclude_service'] =
          this.excludeService!.map((v) => v.toJson()).toList();
    }
    data['sightseeing'] = this.sightseeing;
    if (this.place != null) {
      data['Place'] = this.place!.map((v) => v.toJson()).toList();
    }
    if (this.itinaries != null) {
      data['Itinaries'] = this.itinaries!.map((v) => v.toJson()).toList();
    }
    data['day'] = this.day;
    return data;
  }
}

class ExcludeService {
  String? serviceName;

  ExcludeService({this.serviceName});

  ExcludeService.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    return data;
  }
}

class IncludeService {
  String? serviceName;

  IncludeService({this.serviceName});

  IncludeService.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    return data;
  }
}

class Place {
  String? photo;

  Place({this.photo});

  Place.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    return data;
  }
}

class Itinaries {
  String? sId;
  String? packageId;
  String? title;
  int? day;
  String? activity;
  String? photo;
  String? hotelName;
  int? iV;

  Itinaries(
      {this.sId,
      this.packageId,
      this.title,
      this.day,
      this.activity,
      this.photo,
      this.hotelName,
      this.iV});

  Itinaries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    packageId = json['package_id'];
    title = json['title'];
    day = json['day'];
    activity = json['activity'];
    photo = json['photo'];
    hotelName = json['hotel_name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['package_id'] = this.packageId;
    data['title'] = this.title;
    data['day'] = this.day;
    data['activity'] = this.activity;
    data['photo'] = this.photo;
    data['hotel_name'] = this.hotelName;
    data['__v'] = this.iV;
    return data;
  }
}

// class get_pakege_details_modal {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;

//   get_pakege_details_modal(
//       {this.code, this.status, this.message, this.metadata, this.data});

//   get_pakege_details_modal.fromJson(Map<String, dynamic> json) {
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

// class Metadata {
//   int? length;

//   Metadata({this.length});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     length = json['length'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['length'] = this.length;
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   String? name;
//   int? pricePerPerson;
//   int? totalDays;
//   int? totalNights;
//   String? mealRequired;
//   String? travelBy;
//   String? hotelType;
//   String? moreDetails;
//   List<IncludeService>? includeService;
//   List<ExcludeService>? excludeService;
//   String? sightseeing;
//   List<Place>? place;
//   List<Itinaries>? itinaries;
//   String? day;

//   Data(
//       {this.sId,
//       this.name,
//       this.pricePerPerson,
//       this.totalDays,
//       this.totalNights,
//       this.mealRequired,
//       this.travelBy,
//       this.hotelType,
//       this.moreDetails,
//       this.includeService,
//       this.excludeService,
//       this.sightseeing,
//       this.place,
//       this.itinaries,
//       this.day});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     pricePerPerson = json['price_per_person'];
//     totalDays = json['total_days'];
//     totalNights = json['total_nights'];
//     mealRequired = json['meal_required'];
//     travelBy = json['travel_by'];
//     hotelType = json['hotel_type'];
//     moreDetails = json['more_details'];
//     if (json['include_service'] != null) {
//       includeService = <IncludeService>[];
//       json['include_service'].forEach((v) {
//         includeService!.add(new IncludeService.fromJson(v));
//       });
//     }
//     if (json['exclude_service'] != null) {
//       excludeService = <ExcludeService>[];
//       json['exclude_service'].forEach((v) {
//         excludeService!.add(new ExcludeService.fromJson(v));
//       });
//     }
//     sightseeing = json['sightseeing'];
//     if (json['Place'] != null) {
//       place = <Place>[];
//       json['Place'].forEach((v) {
//         place!.add(new Place.fromJson(v));
//       });
//     }
//     if (json['Itinaries'] != null) {
//       itinaries = <Itinaries>[];
//       json['Itinaries'].forEach((v) {
//         itinaries!.add(new Itinaries.fromJson(v));
//       });
//     }
//     day = json['day'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['price_per_person'] = this.pricePerPerson;
//     data['total_days'] = this.totalDays;
//     data['total_nights'] = this.totalNights;
//     data['meal_required'] = this.mealRequired;
//     data['travel_by'] = this.travelBy;
//     data['hotel_type'] = this.hotelType;
//     data['more_details'] = this.moreDetails;
//     if (this.includeService != null) {
//       data['include_service'] =
//           this.includeService!.map((v) => v.toJson()).toList();
//     }
//     if (this.excludeService != null) {
//       data['exclude_service'] =
//           this.excludeService!.map((v) => v.toJson()).toList();
//     }
//     data['sightseeing'] = this.sightseeing;
//     if (this.place != null) {
//       data['Place'] = this.place!.map((v) => v.toJson()).toList();
//     }
//     if (this.itinaries != null) {
//       data['Itinaries'] = this.itinaries!.map((v) => v.toJson()).toList();
//     }
//     data['day'] = this.day;
//     return data;
//   }
// }

// class IncludeService {
//   String? serviceName;

//   IncludeService({this.serviceName});

//   IncludeService.fromJson(Map<String, dynamic> json) {
//     serviceName = json['service_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['service_name'] = this.serviceName;
//     return data;
//   }
// }

// class ExcludeService {
//   String? serviceName;

//   ExcludeService({this.serviceName});

//   ExcludeService.fromJson(Map<String, dynamic> json) {
//     serviceName = json['service_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['service_name'] = this.serviceName;
//     return data;
//   }
// }

// class Place {
//   String? photo;

//   Place({this.photo});

//   Place.fromJson(Map<String, dynamic> json) {
//     photo = json['photo'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['photo'] = this.photo;
//     return data;
//   }
// }

// class Itinaries {
//   String? sId;
//   String? packageId;
//   String? title;
//   int? day;
//   String? activity;
//   String? photo;
//   String? hotelName;
//   int? iV;

//   Itinaries(
//       {this.sId,
//       this.packageId,
//       this.title,
//       this.day,
//       this.activity,
//       this.photo,
//       this.hotelName,
//       this.iV});

//   Itinaries.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     packageId = json['package_id'];
//     title = json['title'];
//     day = json['day'];
//     activity = json['activity'];
//     photo = json['photo'];
//     hotelName = json['hotel_name'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['package_id'] = this.packageId;
//     data['title'] = this.title;
//     data['day'] = this.day;
//     data['activity'] = this.activity;
//     data['photo'] = this.photo;
//     data['hotel_name'] = this.hotelName;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
