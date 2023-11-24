import 'package:cloud_firestore/cloud_firestore.dart';

class FireUser {
  String? title;
  String? description;
  String? dateandtime;

  FireUser({this.title, this.description, this.dateandtime});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'timestamp': description,
      };

  static FireUser fromJson(Map<String, dynamic> json) => FireUser(
        title: json['title'],
        description: json['description'],
        dateandtime: json['description'],
      );
}

// class TokenModel {
//   String? token;
//
//   FieldValue? createdAt;
//
//   TokenModel({
//     this.token,
//     this.createdAt,
//   });
//
//   TokenModel.fromData(Map<String, dynamic> data)
//       : token = data['token'],
//         createdAt = data['createdAt'];
//
//   static TokenModel? fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;
//
//     return TokenModel(
//       token: map['token'],
//       createdAt: map['createdAt'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'token': token,
//       'createdAt': createdAt,
//     };
//   }
// }

class FireToken{

}