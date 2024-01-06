import 'package:cloud_firestore/cloud_firestore.dart';

class MyController {
  CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Name");
  Future addData({required String name}) async {
    UserCollection.add({"Username": name});
  }

  Future editData({
    required String Newname,
    required String id,
  }) async {
    UserCollection.doc(id).update({
      "Username": Newname,
    });
  }

  Future deleteData({required String id}) async {
    UserCollection.doc(id).delete();
  }
}
