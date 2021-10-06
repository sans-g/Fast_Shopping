import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String _name, String _date, bool archived) async {
  await Firestore.instance
      .collection("Shopping_lists")
      .add({'List_name': _name, 'date': _date, 'archived': archived});
}

Future<void> editProduct(String id, bool archived) async {
  await Firestore.instance
      .collection("Shopping_lists")
      .document(id)
      .updateData({
    'archived': !archived,
  });
}
Future<void> editListName(String id, String listName) async {
  await Firestore.instance
      .collection("Shopping_lists")
      .document(id)
      .updateData({
    'List_name':listName
  });
}


Future<void> deleteProduct(DocumentSnapshot doc) async {
  await Firestore.instance
      .collection("Shopping_lists")
      .document(doc.documentID)
      .delete();
}
