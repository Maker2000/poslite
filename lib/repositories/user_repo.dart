import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';
import 'generic_repos.dart';

class UserRepository implements IRepository<User> {
  UserRepository._inst();
  static final UserRepository _instance = UserRepository._inst();

  static UserRepository get instance => _instance;
  @override
  CollectionReference<User> get getAllItems =>
      FirebaseFirestore.instance.collection('user').withConverter(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (User model, _) => model.toJson(),
          );

  @override
  Future<User?> getItem(String documentId) async =>
      (await getAllItems.doc(documentId).get()).data();
  @override
  Future<void> addItem(User item) async => await getAllItems.add(item);
  @override
  Future<void> updateItem(User item, String docId) async =>
      await getAllItems.doc(docId).update(item.toJson());
  @override
  Future<void> deleteItem(String docId) async =>
      await getAllItems.doc(docId).delete();
}
