class policy_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  policy_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  policy_model.fromJson(Map<String, dynamic> json) {
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
  String? termAndConditionType;
  String? termAndConditionFor;
  int? iV;
  String? termAndConditionContent;

  Data(
      {this.sId,
        this.termAndConditionType,
        this.termAndConditionFor,
        this.iV,
        this.termAndConditionContent});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    termAndConditionType = json['term_and_condition_type'];
    termAndConditionFor = json['term_and_condition_for'];
    iV = json['__v'];
    termAndConditionContent = json['term_and_condition_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['term_and_condition_type'] = this.termAndConditionType;
    data['term_and_condition_for'] = this.termAndConditionFor;
    data['__v'] = this.iV;
    data['term_and_condition_content'] = this.termAndConditionContent;
    return data;
  }
}




// class policy_model {
//   int? code;
//   String? status;
//   String? message;
//   Metadata? metadata;
//   Data? data;
//
//   policy_model(
//       {this.code, this.status, this.message, this.metadata, this.data});
//
//   policy_model.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     message = json['message'];
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
//       data['data'] = this.data!.toJson();
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
//   List<PolicyData>? policyData;
//   List<TermAndCondition>? termAndCondition;
//
//   Data({this.policyData, this.termAndCondition});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['policyData'] != null) {
//       policyData = <PolicyData>[];
//       json['policyData'].forEach((v) {
//         policyData!.add(new PolicyData.fromJson(v));
//       });
//     }
//     if (json['term_and_condition'] != null) {
//       termAndCondition = <TermAndCondition>[];
//       json['term_and_condition'].forEach((v) {
//         termAndCondition!.add(new TermAndCondition.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.policyData != null) {
//       data['policyData'] = this.policyData!.map((v) => v.toJson()).toList();
//     }
//     if (this.termAndCondition != null) {
//       data['term_and_condition'] =
//           this.termAndCondition!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class PolicyData {
//   String? sId;
//   String? policyType;
//   String? policyFor;
//   String? policyContent;
//   int? iV;
//
//   PolicyData(
//       {this.sId, this.policyType, this.policyFor, this.policyContent, this.iV});
//
//   PolicyData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     policyType = json['policy_type'];
//     policyFor = json['policy_for'];
//     policyContent = json['policy_content'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['policy_type'] = this.policyType;
//     data['policy_for'] = this.policyFor;
//     data['policy_content'] = this.policyContent;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class TermAndCondition {
//   String? sId;
//   String? termAndConditionType;
//   String? termAndConditionFor;
//   String? termAndConditionContent;
//   int? iV;
//
//   TermAndCondition(
//       {this.sId,
//         this.termAndConditionType,
//         this.termAndConditionFor,
//         this.termAndConditionContent,
//         this.iV});
//
//   TermAndCondition.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     termAndConditionType = json['term_and_condition_type'];
//     termAndConditionFor = json['term_and_condition_for'];
//     termAndConditionContent = json['term_and_condition_content'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['term_and_condition_type'] = this.termAndConditionType;
//     data['term_and_condition_for'] = this.termAndConditionFor;
//     data['term_and_condition_content'] = this.termAndConditionContent;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
