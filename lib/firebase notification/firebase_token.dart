//
// class FirebaseToken{
//   String? Token;
//   Data? data;
//
//   FirebaseToken({
//     this.Token,
//     this.data
// });
//
//
//   FirebaseToken.fromJson(Map<String, dynamic> json) {
//    Token = json['token'];
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.Token;
//     if (this.data != null) {
//       data['token'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
// class Data{
//   String? title;
//   String? description;
//   Data({
//     this.title,
//     this.description
// });
//   Data.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     description = json['description'];
//   }
// }