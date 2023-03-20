import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poslite/models/shop_item/shop_item.dart';

abstract class DatabaseItem<T> {
  String get tableName;

  Map<String, dynamic> toDatabaseJson();

  Map<String, Type> createDatabaseMap();
}

class DatabaseHelper {
  static final Map<Type, String> _datebaseTypeDictionary = {
    String: "TEXT",
    DateTime: "TEXT",
    int: "INTEGER",
    double: "REAL",
    Enum: "TEXT",
  };

  static String createTableFromObject(DatabaseItem item) {
    var data =
        '''CREATE TABLE IF NOT EXISTS ${item.tableName} (id INTEGER PRIMARY KEY autoincrement, 
    ${_getTableColumns(item.createDatabaseMap())}
    )''';
    return data;
  }

  static String _getTableColumns(Map<String, Type> keys) {
    List<String> stringToReturn = [];
    for (var key in keys.entries) {
      var data = _datebaseTypeDictionary[key.value];
      if (data != null) stringToReturn.add('${key.key} $data');
    }
    return stringToReturn.join(', ');
  }
}

class DatabaseQueryBuilder {
  String query;
  bool hasParams = false;
  DatabaseQueryBuilder(this.query, this.hasParams);
  DatabaseQueryBuilder addToQuery(String data) =>
      DatabaseQueryBuilder('$query $data', true);
  static DatabaseQueryBuilder SelectAllFrom(String tableName) =>
      DatabaseQueryBuilder("SELECT * FROM $tableName", false);

  DatabaseQueryBuilder valEq(String column, num number) =>
      addToQuery("${hasParams ? 'AND' : 'WHERE'} $column == $number");

  DatabaseQueryBuilder stringEq(String column, String number) =>
      addToQuery("${hasParams ? 'AND' : 'WHERE'} $column == $number");
}
