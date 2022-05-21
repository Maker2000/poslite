import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poslite/models/store_transaction/store_transaction.dart';
import 'package:poslite/repositories/generic_repos.dart';
import 'package:poslite/util/magic_strings.dart';

class StoreTransactionRepository extends IGenericRepository<StoreTransaction> {
  StoreTransactionRepository._inst();
  static final StoreTransactionRepository _instance =
      StoreTransactionRepository._inst();
  static StoreTransactionRepository get instance => _instance;
  @override
  Future<void> addItem(StoreTransaction item, [String? docId]) async {
    getAllItems.add(item);
  }

  @override
  Future<void> deleteItem(String docId) {
    throw UnimplementedError();
  }

  @override
  CollectionReference<StoreTransaction> get getAllItems =>
      FirebaseFirestore.instance
          .collection(DatabaseCollection.storeTransactions)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                StoreTransaction.fromJson(snapshot.data()!),
            toFirestore: (StoreTransaction model, _) => model.toJson(),
          );

  @override
  Future<StoreTransaction?> getItem(String documentId) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem(StoreTransaction item, String docId) {
    throw UnimplementedError();
  }
}
