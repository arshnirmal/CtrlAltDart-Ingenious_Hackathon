import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  FireStoreService._();
  static final instance = FireStoreService._();

  Future<void> setData(String path, Map<String, dynamic> data) async {
    final reference = FirebaseFirestore.instance.collection("Users").doc(path);
    print('$path: $data');
    await reference.set(data);
  }

  // Future<void> deleteData({String path}) async {
  //   final reference = FirebaseFirestore.instance.doc(path);
  //   print('DELETE: $path');
  //   await reference.delete();
  // }

  // Stream<List<T>> collectionStream<T>({
  //    String path,
  //   T Function(Map<String, dynamic> data, String documentId) builder,
  // }) {
  //   final reference = FirebaseFirestore.instance.collection(path);
  //   final snapshots = reference.snapshots();
  //   return snapshots.map((snapshot) => snapshot.docs
  //       .map((snapshot) => builder(snapshot.data(), snapshot.id))
  //       .toList());
  // }
}
