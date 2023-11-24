class bid_pakege_comper_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  bid_pakege_comper_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  bid_pakege_comper_model.fromJson(Map<String, dynamic> json) {
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
  String? agencyId;
  String? customRequirementId;
  int? pricePerPerson;
  String? bidDate;
  int? totalDays;
  String? travelBy;
  String? sightseeing;
  String? hotelTypes;
  String? mealRequired;
  String? mealTypes;
  String? otherServices;
  String? destinationCategory;
  List<IncludeServices>? includeServices;
  List<ExcludeServices>? excludeServices;
  String? bidStatus;
  List<Itineries>? itineries;
  String? startDate1;
  String? endDate1;

  Data(
      {this.sId,
        this.agencyId,
        this.customRequirementId,
        this.pricePerPerson,
        this.bidDate,
        this.totalDays,
        this.travelBy,
        this.sightseeing,
        this.hotelTypes,
        this.mealRequired,
        this.mealTypes,
        this.otherServices,
        this.destinationCategory,
        this.includeServices,
        this.excludeServices,
        this.bidStatus,
        this.itineries,
        this.startDate1,
        this.endDate1});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agencyId = json['agency_id'];
    customRequirementId = json['custom_requirement_id'];
    pricePerPerson = json['price_per_person'];
    bidDate = json['bid_date'];
    totalDays = json['total_days'];
    travelBy = json['travel_by'];
    sightseeing = json['sightseeing'];
    hotelTypes = json['hotel_types'];
    mealRequired = json['meal_required'];
    mealTypes = json['meal_types'];
    otherServices = json['other_Services'];
    destinationCategory = json['destination_category'];
    if (json['include_services'] != null) {
      includeServices = <IncludeServices>[];
      json['include_services'].forEach((v) {
        includeServices!.add(new IncludeServices.fromJson(v));
      });
    }
    if (json['exclude_services'] != null) {
      excludeServices = <ExcludeServices>[];
      json['exclude_services'].forEach((v) {
        excludeServices!.add(new ExcludeServices.fromJson(v));
      });
    }
    bidStatus = json['bid_status'];
    if (json['itineries'] != null) {
      itineries = <Itineries>[];
      json['itineries'].forEach((v) {
        itineries!.add(new Itineries.fromJson(v));
      });
    }
    startDate1 = json['start_date1'];
    endDate1 = json['end_date1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['agency_id'] = this.agencyId;
    data['custom_requirement_id'] = this.customRequirementId;
    data['price_per_person'] = this.pricePerPerson;
    data['bid_date'] = this.bidDate;
    data['total_days'] = this.totalDays;
    data['travel_by'] = this.travelBy;
    data['sightseeing'] = this.sightseeing;
    data['hotel_types'] = this.hotelTypes;
    data['meal_required'] = this.mealRequired;
    data['meal_types'] = this.mealTypes;
    data['other_Services'] = this.otherServices;
    data['destination_category'] = this.destinationCategory;
    if (this.includeServices != null) {
      data['include_services'] =
          this.includeServices!.map((v) => v.toJson()).toList();
    }
    if (this.excludeServices != null) {
      data['exclude_services'] =
          this.excludeServices!.map((v) => v.toJson()).toList();
    }
    data['bid_status'] = this.bidStatus;
    if (this.itineries != null) {
      data['itineries'] = this.itineries!.map((v) => v.toJson()).toList();
    }
    data['start_date1'] = this.startDate1;
    data['end_date1'] = this.endDate1;
    return data;
  }
}

class IncludeServices {
  String? includeServicesValue;

  IncludeServices({this.includeServicesValue});

  IncludeServices.fromJson(Map<String, dynamic> json) {
    includeServicesValue = json['include_services_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['include_services_value'] = this.includeServicesValue;
    return data;
  }
}

class ExcludeServices {
  String? excludeServicesValue;

  ExcludeServices({this.excludeServicesValue});

  ExcludeServices.fromJson(Map<String, dynamic> json) {
    excludeServicesValue = json['exclude_services_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exclude_services_value'] = this.excludeServicesValue;
    return data;
  }
}

class Itineries {
  String? sId;
  String? title;
  int? day;
  String? activity;
  String? photo;
  String? hotelName;
  String? bidId;
  int? iV;

  Itineries(
      {this.sId,
        this.title,
        this.day,
        this.activity,
        this.photo,
        this.hotelName,
        this.bidId,
        this.iV});

  Itineries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    day = json['day'];
    activity = json['activity'];
    photo = json['photo'];
    hotelName = json['hotel_name'];
    bidId = json['bid_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['day'] = this.day;
    data['activity'] = this.activity;
    data['photo'] = this.photo;
    data['hotel_name'] = this.hotelName;
    data['bid_id'] = this.bidId;
    data['__v'] = this.iV;
    return data;
  }
}
