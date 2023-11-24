class updateBidStatus_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  updateBidStatus_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  updateBidStatus_model.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? agencyId;
  String? customRequirementId;
  int? pricePerPerson;
  String? bidDate;
  int? totalDays;
  List<String>? travelBy;
  String? sightseeing;
  List<String>? hotelTypes;
  List<String>? mealRequired;
  List<String>? mealTypes;
  String? otherServices;
  List<String>? includeDetails;
  String? startDate;
  String? endDate;
  List<String>? destinationCategory;
  List<String>? includeServices;
  List<String>? excludeServices;
  bool? bidStatus;
  int? totalAmount;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
      this.includeDetails,
      this.startDate,
      this.endDate,
      this.destinationCategory,
      this.includeServices,
      this.excludeServices,
      this.bidStatus,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agencyId = json['agency_id'];
    customRequirementId = json['custom_requirement_id'];
    pricePerPerson = json['price_per_person'];
    bidDate = json['bid_date'];
    totalDays = json['total_days'];
    travelBy = json['travel_by'].cast<String>();
    sightseeing = json['sightseeing'];
    hotelTypes = json['hotel_types'].cast<String>();
    mealRequired = json['meal_required'].cast<String>();
    mealTypes = json['meal_types'].cast<String>();
    otherServices = json['other_Services'];
    includeDetails = json['include_details'].cast<String>();
    startDate = json['start_date'];
    endDate = json['end_date'];
    destinationCategory = json['destination_category'].cast<String>();
    includeServices = json['include_services'].cast<String>();
    excludeServices = json['exclude_services'].cast<String>();
    if (json['bid_status'] is bool) {
      bidStatus = json['bid_status'];
    } else if (json['bid_status'] is String) {
      bidStatus =
          json['bid_status'] == 'true'; // Convert string to boolean if needed
    } else {
      bidStatus =
          null; // Handle the case where the 'bid_status' is neither bool nor string
    }
    totalAmount = json['total_amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    data['include_details'] = this.includeDetails;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['destination_category'] = this.destinationCategory;
    data['include_services'] = this.includeServices;
    data['exclude_services'] = this.excludeServices;
    data['bid_status'] = this.bidStatus;
    data['total_amount'] = this.totalAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
