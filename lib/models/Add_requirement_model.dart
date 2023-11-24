class Add_requirement_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  Add_requirement_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Add_requirement_model.fromJson(Map<String, dynamic> json) {
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
  String? departure;
  String? destination;
  List<String>? category;
  int? totalAdult;
  int? totalChild;
  int? infant;
  bool? personalCare;
  List<String>? travelBy;
  String? startDate;
  String? endDate;
  int? totalTravelDays;
  List<int>? hotelType;
  List<String>? mealRequire;
  String? mealType;
  List<String>? additionalRequirement;
  String? userId;
  String? fullName;
  String? emailAddress;
  String? mobileNo;
  String? city;
  int? budgetPerPerson;
  String? status;
  String? sId;
  int? iV;

  Data(
      {this.departure,
        this.destination,
        this.category,
        this.totalAdult,
        this.totalChild,
        this.infant,
        this.personalCare,
        this.travelBy,
        this.startDate,
        this.endDate,
        this.totalTravelDays,
        this.hotelType,
        this.mealRequire,
        this.mealType,
        this.additionalRequirement,
        this.userId,
        this.fullName,
        this.emailAddress,
        this.mobileNo,
        this.city,
        this.budgetPerPerson,
        this.status,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    departure = json['departure'];
    destination = json['destination'];
    category = json['category'].cast<String>();
    totalAdult = json['total_adult'];
    totalChild = json['total_child'];
    infant = json['Infant'];
    personalCare = json['personal_care'];
    travelBy = json['travel_by'].cast<String>();
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalTravelDays = json['total_travel_days'];
    hotelType = json['hotel_type'].cast<int>();
    mealRequire = json['meal_require'].cast<String>();
    mealType = json['meal_type'];
    additionalRequirement = json['additional_requirement'].cast<String>();
    userId = json['user_id'];
    fullName = json['full_name'];
    emailAddress = json['email_address'];
    mobileNo = json['mobile_no'];
    city = json['city'];
    budgetPerPerson = json['budget_per_person'];
   // status = json['status'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departure'] = this.departure;
    data['destination'] = this.destination;
    data['category'] = this.category;
    data['total_adult'] = this.totalAdult;
    data['total_child'] = this.totalChild;
    data['Infant'] = this.infant;
    data['personal_care'] = this.personalCare;
    data['travel_by'] = this.travelBy;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['total_travel_days'] = this.totalTravelDays;
    data['hotel_type'] = this.hotelType;
    data['meal_require'] = this.mealRequire;
    data['meal_type'] = this.mealType;
    data['additional_requirement'] = this.additionalRequirement;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['email_address'] = this.emailAddress;
    data['mobile_no'] = this.mobileNo;
    data['city'] = this.city;
    data['budget_per_person'] = this.budgetPerPerson;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
