class get_destinationdata_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  get_destinationdata_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  get_destinationdata_model.fromJson(Map<String, dynamic> json) {
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
  Destination? destination;
  List<Packages>? packages;
  List<PlaceToVisit>? placeToVisit;

  Data({this.destination, this.packages, this.placeToVisit});

  Data.fromJson(Map<String, dynamic> json) {
    destination = json['destination'] != null
        ? new Destination.fromJson(json['destination'])
        : null;
    if (json['Packages'] != null) {
      packages = <Packages>[];
      json['Packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    if (json['Place_to_Visit'] != null) {
      placeToVisit = <PlaceToVisit>[];
      json['Place_to_Visit'].forEach((v) {
        placeToVisit!.add(new PlaceToVisit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.destination != null) {
      data['destination'] = this.destination!.toJson();
    }
    if (this.packages != null) {
      data['Packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    if (this.placeToVisit != null) {
      data['Place_to_Visit'] =
          this.placeToVisit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destination {
  String? sId;
  String? destinationName;
  String? howToReach;
  String? aboutDestination;
  String? bestTimeForVisit;
  String? photo;

  Destination(
      {this.sId,
        this.destinationName,
        this.howToReach,
        this.aboutDestination,
        this.bestTimeForVisit,
        this.photo});

  Destination.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationName = json['destination_name'];
    howToReach = json['how_to_reach'];
    aboutDestination = json['about_destination'];
    bestTimeForVisit = json['best_time_for_visit'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_name'] = this.destinationName;
    data['how_to_reach'] = this.howToReach;
    data['about_destination'] = this.aboutDestination;
    data['best_time_for_visit'] = this.bestTimeForVisit;
    data['photo'] = this.photo;
    return data;
  }
}

class Packages {
  String? sId;
  int? pricePerPerson;
  String? mealRequired;
  String? travelBy;
  String? hotelType;
  String? sightseeing;
  String? place;
  String? days;

  Packages(
      {this.sId,
        this.pricePerPerson,
        this.mealRequired,
        this.travelBy,
        this.hotelType,
        this.sightseeing,
        this.place,
        this.days});

  Packages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    pricePerPerson = json['price_per_person'];
    mealRequired = json['meal_required'];
    travelBy = json['travel_by'];
    hotelType = json['hotel_type'];
    sightseeing = json['sightseeing'];
    place = json['Place'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price_per_person'] = this.pricePerPerson;
    data['meal_required'] = this.mealRequired;
    data['travel_by'] = this.travelBy;
    data['hotel_type'] = this.hotelType;
    data['sightseeing'] = this.sightseeing;
    data['Place'] = this.place;
    data['days'] = this.days;
    return data;
  }
}

class PlaceToVisit {
  String? sId;
  String? destinationId;
  String? photo;
  String? name;
  String? description;
  int? iV;

  PlaceToVisit(
      {this.sId,
        this.destinationId,
        this.photo,
        this.name,
        this.description,
        this.iV});

  PlaceToVisit.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationId = json['destination_id'];
    photo = json['photo'];
    name = json['name'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_id'] = this.destinationId;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}
