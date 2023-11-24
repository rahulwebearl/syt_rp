//
// class Get_custom_requirementtt_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   List<Data>? data;
//
//   Get_custom_requirementtt_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   Get_custom_requirementtt_model.fromJson(Map<String, dynamic> json) {
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
//   String? tripId;
//   String? departure;
//   String? arival;
//   String? onDate;
//   CustomRequirement? customRequirement;
//
//   Data(
//       {this.tripId,
//         this.departure,
//         this.arival,
//         this.onDate,
//         this.customRequirement});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     tripId = json['Trip_id'];
//     departure = json['departure'];
//     arival = json['Arival'];
//     onDate = json['On_Date'];
//     // customRequirement = json['custom_requirement'] != null
//     //     ? new CustomRequirement.fromJson(json['custom_requirement'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Trip_id'] = this.tripId;
//     data['departure'] = this.departure;
//     data['Arival'] = this.arival;
//     data['On_Date'] = this.onDate;
//     if (this.customRequirement != null) {
//       data['custom_requirement'] = this.customRequirement!.toJson();
//     }
//     return data;
//   }
// }
//
// class CustomRequirement {
//   String? sId;
//   String? departure;
//   String? destination;
//   int? totalAdult;
//   int? totalChild;
//   int? infant;
//   bool? personalCare;
//   String? travelBy;
//   int? totalTravelDays;
//   String? hotelType;
//   String? mealRequire;
//   String? mealType;
//   String? additionalRequirement;
//   String? destinationCategory;
//   String? startDate1;
//   String? endDate1;
//
//   CustomRequirement(
//       {this.sId,
//         this.departure,
//         this.destination,
//         this.totalAdult,
//         this.totalChild,
//         this.infant,
//         this.personalCare,
//         this.travelBy,
//         this.totalTravelDays,
//         this.hotelType,
//         this.mealRequire,
//         this.mealType,
//         this.additionalRequirement,
//         this.destinationCategory,
//         this.startDate1,
//         this.endDate1});
//
//   CustomRequirement.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     departure = json['departure'];
//     destination = json['destination'];
//     totalAdult = json['total_adult'];
//     totalChild = json['total_child'];
//     infant = json['Infant'];
//     personalCare = json['personal_care'];
//     travelBy = json['travel_by'];
//     totalTravelDays = json['total_travel_days'];
//     hotelType = json['hotel_type'];
//     mealRequire = json['meal_require'];
//     mealType = json['meal_type'];
//     additionalRequirement = json['additional_requirement'];
//     destinationCategory = json['Destination_category'];
//     startDate1 = json['start_date1'];
//     endDate1 = json['end_date1'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['departure'] = this.departure;
//     data['destination'] = this.destination;
//     data['total_adult'] = this.totalAdult;
//     data['total_child'] = this.totalChild;
//     data['Infant'] = this.infant;
//     data['personal_care'] = this.personalCare;
//     data['travel_by'] = this.travelBy;
//     data['total_travel_days'] = this.totalTravelDays;
//     data['hotel_type'] = this.hotelType;
//     data['meal_require'] = this.mealRequire;
//     data['meal_type'] = this.mealType;
//     data['additional_requirement'] = this.additionalRequirement;
//     data['Destination_category'] = this.destinationCategory;
//     data['start_date1'] = this.startDate1;
//     data['end_date1'] = this.endDate1;
//     return data;
//   }
// }


class Get_custom_requirementtt_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Get_custom_requirementtt_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Get_custom_requirementtt_model.fromJson(Map<String, dynamic> json) {
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
  String? tripId;
  String? departure;
  String? arival;
  String? onDate;
  CustomRequirement? customRequirement;

  Data(
      {this.tripId,
        this.departure,
        this.arival,
        this.onDate,
        this.customRequirement});

  Data.fromJson(Map<String, dynamic> json) {
    tripId = json['Trip_id'];
    departure = json['departure'];
    arival = json['Arival'];
    onDate = json['On_Date'];
    customRequirement = json['custom_requirement'] != null
        ? new CustomRequirement.fromJson(json['custom_requirement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Trip_id'] = this.tripId;
    data['departure'] = this.departure;
    data['Arival'] = this.arival;
    data['On_Date'] = this.onDate;
    if (this.customRequirement != null) {
      data['custom_requirement'] = this.customRequirement!.toJson();
    }
    return data;
  }
}

class CustomRequirement {
  String? sId;
  String? departure;
  String? destination;
  int? totalAdult;
  int? totalChild;
  int? infant;
  bool? personalCare;
  String? travelBy;
  int? totalTravelDays;
  String? hotelType;
  String? mealRequire;
  String? mealType;
  List<String>? additionalRequirement;
  String? status;
  String? destinationCategory;
  String? startDate1;
  String? endDate1;

  CustomRequirement(
      {this.sId,
        this.departure,
        this.destination,
        this.totalAdult,
        this.totalChild,
        this.infant,
        this.personalCare,
        this.travelBy,
        this.totalTravelDays,
        this.hotelType,
        this.mealRequire,
        this.mealType,
        this.additionalRequirement,
        this.status,
        this.destinationCategory,
        this.startDate1,
        this.endDate1});

  CustomRequirement.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    departure = json['departure'];
    destination = json['destination'];
    totalAdult = json['total_adult'];
    totalChild = json['total_child'];
    infant = json['Infant'];
    personalCare = json['personal_care'];
    travelBy = json['travel_by'];
    totalTravelDays = json['total_travel_days'];
    hotelType = json['hotel_type'];
    mealRequire = json['meal_require'];
    mealType = json['meal_type'];
    additionalRequirement = json['additional_requirement'].cast<String>();
    status = json['status'];
    destinationCategory = json['Destination_category'];
    startDate1 = json['start_date1'];
    endDate1 = json['end_date1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['departure'] = this.departure;
    data['destination'] = this.destination;
    data['total_adult'] = this.totalAdult;
    data['total_child'] = this.totalChild;
    data['Infant'] = this.infant;
    data['personal_care'] = this.personalCare;
    data['travel_by'] = this.travelBy;
    data['total_travel_days'] = this.totalTravelDays;
    data['hotel_type'] = this.hotelType;
    data['meal_require'] = this.mealRequire;
    data['meal_type'] = this.mealType;
    data['additional_requirement'] = this.additionalRequirement;
    data['status'] = this.status;
    data['Destination_category'] = this.destinationCategory;
    data['start_date1'] = this.startDate1;
    data['end_date1'] = this.endDate1;
    return data;
  }
}
