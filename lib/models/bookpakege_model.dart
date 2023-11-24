class bookpakege_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  bookpakege_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  bookpakege_model.fromJson(Map<String, dynamic> json) {
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
  String? userRegistrationId;
  String? bookdate;
  String? paymentType;
  String? bidPackageId;
  int? totalAdult;
  int? totalChild;
  int? totalInfant;
  int? contactNumber;
  String? emailId;
  String? approxStartDate;
  int? totaldays;
  int? totalnight;
  List<String>? meal;
  List<String>? mealType;
  String? siteseeing;
  String? transportMode;
  String? transportIncludeExclude;
  String? hoteltype;
  int? priceperperson;
  String? category;
  List<String>? bookedInclude;
  List<String>? bookedExclude;
  bool? personalCare;
  String? othereRequirement;
  String? customPackageId;
  String? departure;
  String? approxEndDate;
  String? userName;
  String? status;
  String? statusChengedBy;
  String? sId;
  int? iV;

  Data(
      {this.userRegistrationId,
        this.bookdate,
        this.paymentType,
        this.bidPackageId,
        this.totalAdult,
        this.totalChild,
        this.totalInfant,
        this.contactNumber,
        this.emailId,
        this.approxStartDate,
        this.totaldays,
        this.totalnight,
        this.meal,
        this.mealType,
        this.siteseeing,
        this.transportMode,
        this.transportIncludeExclude,
        this.hoteltype,
        this.priceperperson,
        this.category,
        this.bookedInclude,
        this.bookedExclude,
        this.personalCare,
        this.othereRequirement,
        this.customPackageId,
        this.departure,
        this.approxEndDate,
        this.userName,
        this.status,
        this.statusChengedBy,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userRegistrationId = json['user_registration_id'];
    bookdate = json['bookdate'];
    paymentType = json['payment_type'];
    bidPackageId = json['bid_package_id'];
    totalAdult = json['total_adult'];
    totalChild = json['total_child'];
    totalInfant = json['total_infant'];
    contactNumber = json['contact_number'];
    emailId = json['email_id'];
    approxStartDate = json['approx_start_date'];
    totaldays = json['totaldays'];
    totalnight = json['totalnight'];
    meal = json['meal'].cast<String>();
    mealType = json['meal_type'].cast<String>();
    siteseeing = json['siteseeing'];
    transportMode = json['transport_mode'];
    transportIncludeExclude = json['transport_include_exclude'];
    hoteltype = json['hoteltype'];
    priceperperson = json['priceperperson'];
    category = json['category'];
    bookedInclude = json['booked_include'].cast<String>();
    bookedExclude = json['booked_exclude'].cast<String>();
    personalCare = json['personal_care'];
    othereRequirement = json['othere_requirement'];
    customPackageId = json['custom_package_id'];
    departure = json['departure'];
    approxEndDate = json['approx_end_date'];
    userName = json['user_name'];
    status = json['status'];
    statusChengedBy = json['status_chenged_by'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_registration_id'] = this.userRegistrationId;
    data['bookdate'] = this.bookdate;
    data['payment_type'] = this.paymentType;
    data['bid_package_id'] = this.bidPackageId;
    data['total_adult'] = this.totalAdult;
    data['total_child'] = this.totalChild;
    data['total_infant'] = this.totalInfant;
    data['contact_number'] = this.contactNumber;
    data['email_id'] = this.emailId;
    data['approx_start_date'] = this.approxStartDate;
    data['totaldays'] = this.totaldays;
    data['totalnight'] = this.totalnight;
    data['meal'] = this.meal;
    data['meal_type'] = this.mealType;
    data['siteseeing'] = this.siteseeing;
    data['transport_mode'] = this.transportMode;
    data['transport_include_exclude'] = this.transportIncludeExclude;
    data['hoteltype'] = this.hoteltype;
    data['priceperperson'] = this.priceperperson;
    data['category'] = this.category;
    data['booked_include'] = this.bookedInclude;
    data['booked_exclude'] = this.bookedExclude;
    data['personal_care'] = this.personalCare;
    data['othere_requirement'] = this.othereRequirement;
    data['custom_package_id'] = this.customPackageId;
    data['departure'] = this.departure;
    data['approx_end_date'] = this.approxEndDate;
    data['user_name'] = this.userName;
    data['status'] = this.status;
    data['status_chenged_by'] = this.statusChengedBy;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
