import '../models/store_transaction/store_transaction.dart';
import 'generic_repos.dart';
import '../util/secrets.dart';

class StoreTransactionRepository extends IGenericRepository<StoreTransaction> {
  StoreTransactionRepository._inst();
  static final StoreTransactionRepository _instance =
      StoreTransactionRepository._inst();
  static StoreTransactionRepository get instance => _instance;
  @override
  Future<void> addItem(StoreTransaction item, [String? docId]) async {}

  @override
  Future<void> deleteItem(String docId) {
    throw UnimplementedError();
  }

  @override
  Future<StoreTransaction?> getItem(String documentId) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem(StoreTransaction item, String docId) {
    throw UnimplementedError();
  }

  @override
  Future<List<StoreTransaction>> get getAllItems => throw UnimplementedError();

  @override
  Future<List<StoreTransaction>> getItemsPaginated(int skip, int count) {
    // TODO: implement getItemsPaginated
    throw UnimplementedError();
  }
}
