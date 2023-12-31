
class get_bookpakege_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  get_bookpakege_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  get_bookpakege_model.fromJson(Map<String, dynamic> json) {
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
  int? totalPerson;
  int? agencyContectNo;
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
  String? destination;
  String? bidDate;
  String? bidId;
  String? agencyName;
  int? agencyprice;

  Data(
      {this.sId,
        this.userRegistrationId,
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
        this.totalPerson,
        this.agencyContectNo,
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
        this.destination,
        this.bidDate,
        this.agencyName,
        this.bidId,
        this.agencyprice});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    totalPerson = json['total_person'];
    agencyContectNo = json['agency_contect_no'];
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
    bidDate = json['bid_date'];
    bidId = json['bid_id'];
    agencyprice = json['agencyprice'];
    destination = json['destination'];
    agencyName = json['agencyname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['total_person'] = this.totalPerson;
    data['agency_contect_no'] = this.agencyContectNo;
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
    data['bid_date'] = this.bidDate;
    data['bid_id'] = this.bidId;
    data['agencyprice'] = this.agencyprice;
    data['agencyname'] = this.agencyName;
    data['destination'] = this.destination;
    return data;
  }
}







// class get_bookpakege_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   get_bookpakege_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   get_bookpakege_model.fromJson(Map<String, dynamic> json) {
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
//   String? sId;
//   String? userRegistrationId;
//   String? bookdate;
//   String? paymentType;
//   String? bidPackageId;
//   int? totalAdult;
//   int? totalChild;
//   int? totalInfant;
//   int? contactNumber;
//   String? emailId;
//   String? approxStartDate;
//   int? totaldays;
//   int? totalnight;
//   List<String>? meal;
//   List<String>? mealType;
//   String? siteseeing;
//   String? transportMode;
//   String? transportIncludeExclude;
//   String? hoteltype;
//   int? priceperperson;
//   int? totalPerson;
//   int? agencyContectNo;
//   String? category;
//   List<String>? bookedInclude;
//   List<String>? bookedExclude;
//   bool? personalCare;
//   String? othereRequirement;
//   String? customPackageId;
//   String? departure;
//   String? approxEndDate;
//   String? userName;
//   String? status;
//   String? statusChengedBy;
//   int? iV;
//
//   Data(
//       {this.sId,
//         this.userRegistrationId,
//         this.bookdate,
//         this.paymentType,
//         this.bidPackageId,
//         this.totalAdult,
//         this.totalChild,
//         this.totalInfant,
//         this.contactNumber,
//         this.emailId,
//         this.approxStartDate,
//         this.totaldays,
//         this.totalnight,
//         this.meal,
//         this.mealType,
//         this.siteseeing,
//         this.transportMode,
//         this.transportIncludeExclude,
//         this.hoteltype,
//         this.priceperperson,
//         this.totalPerson,
//         this.agencyContectNo,
//         this.category,
//         this.bookedInclude,
//         this.bookedExclude,
//         this.personalCare,
//         this.othereRequirement,
//         this.customPackageId,
//         this.departure,
//         this.approxEndDate,
//         this.userName,
//         this.status,
//         this.statusChengedBy,
//         this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     userRegistrationId = json['user_registration_id'];
//     bookdate = json['bookdate'];
//     paymentType = json['payment_type'];
//     bidPackageId = json['bid_package_id'];
//     totalAdult = json['total_adult'];
//     totalChild = json['total_child'];
//     totalInfant = json['total_infant'];
//     contactNumber = json['contact_number'];
//     emailId = json['email_id'];
//     approxStartDate = json['approx_start_date'];
//     totaldays = json['totaldays'];
//     totalnight = json['totalnight'];
//     meal = json['meal'].cast<String>();
//     mealType = json['meal_type'].cast<String>();
//     siteseeing = json['siteseeing'];
//     transportMode = json['transport_mode'];
//     transportIncludeExclude = json['transport_include_exclude'];
//     hoteltype = json['hoteltype'];
//     priceperperson = json['priceperperson'];
//     totalPerson = json['total_person'];
//     agencyContectNo = json['agency_contect_no'];
//     category = json['category'];
//     bookedInclude = json['booked_include'].cast<String>();
//     bookedExclude = json['booked_exclude'].cast<String>();
//     personalCare = json['personal_care'];
//     othereRequirement = json['othere_requirement'];
//     customPackageId = json['custom_package_id'];
//     departure = json['departure'];
//     approxEndDate = json['approx_end_date'];
//     userName = json['user_name'];
//     status = json['status'];
//     statusChengedBy = json['status_chenged_by'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['user_registration_id'] = this.userRegistrationId;
//     data['bookdate'] = this.bookdate;
//     data['payment_type'] = this.paymentType;
//     data['bid_package_id'] = this.bidPackageId;
//     data['total_adult'] = this.totalAdult;
//     data['total_child'] = this.totalChild;
//     data['total_infant'] = this.totalInfant;
//     data['contact_number'] = this.contactNumber;
//     data['email_id'] = this.emailId;
//     data['approx_start_date'] = this.approxStartDate;
//     data['totaldays'] = this.totaldays;
//     data['totalnight'] = this.totalnight;
//     data['meal'] = this.meal;
//     data['meal_type'] = this.mealType;
//     data['siteseeing'] = this.siteseeing;
//     data['transport_mode'] = this.transportMode;
//     data['transport_include_exclude'] = this.transportIncludeExclude;
//     data['hoteltype'] = this.hoteltype;
//     data['priceperperson'] = this.priceperperson;
//     data['total_person'] = this.totalPerson;
//     data['agency_contect_no'] = this.agencyContectNo;
//     data['category'] = this.category;
//     data['booked_include'] = this.bookedInclude;
//     data['booked_exclude'] = this.bookedExclude;
//     data['personal_care'] = this.personalCare;
//     data['othere_requirement'] = this.othereRequirement;
//     data['custom_package_id'] = this.customPackageId;
//     data['departure'] = this.departure;
//     data['approx_end_date'] = this.approxEndDate;
//     data['user_name'] = this.userName;
//     data['status'] = this.status;
//     data['status_chenged_by'] = this.statusChengedBy;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
