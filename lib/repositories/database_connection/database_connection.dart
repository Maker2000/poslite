import 'package:poslite/models/checkout/checkout.dart';

import '../../models/shop_item/shop_item.dart';
import '../../models/store_transaction/store_transaction.dart';
import '../../models/user/user.dart';
import 'util.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  DatabaseConnection._inst();
  static final DatabaseConnection _instance = DatabaseConnection._inst();
  static DatabaseConnection get instance => _instance;
  Database? database;
  static Future<String> get _dbPath async =>
      "${(await getDatabasesPath())}inventory.db";
  Future<void> initDatabase() async {
    var path = await _dbPath;
    await deleteDatabase(path);
    database ??= await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db
            .execute(DatabaseHelper.createTableFromObject(ShopItem.empty()));
        await db.execute(
            DatabaseHelper.createTableFromObject(StoreTransaction.empty()));
        await db.execute(DatabaseHelper.createTableFromObject(User.empty()));
        await db.execute(
            DatabaseHelper.createTableFromObject(CheckOutDatabaseItem.empty()));
      },
    );
  }
}
