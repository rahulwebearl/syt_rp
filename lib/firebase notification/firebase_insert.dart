import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_model.dart';

class NotificationInsert{
  NotificationInsert();
  Future createUser({required String title,String? description}) async {
    final docuser = FirebaseFirestore.instance.collection("user").doc();
    final user = FireUser(
      title: title,
      description: description,
      // dateandtime: age,
    );

    final json = user.toJson();
    await docuser.set(json);
  }
}