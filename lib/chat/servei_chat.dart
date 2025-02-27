import 'package:cloud_firestore/cloud_firestore.dart';

class ServeiChat {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsaris() {
    return _firestore.collection("users").snapshots().map((event) {
      return event.docs.map((doc) => doc.data()).toList();
    });
    
  }
}
