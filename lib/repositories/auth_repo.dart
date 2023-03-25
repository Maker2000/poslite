import 'package:poslite/models/user/user.dart';
import 'package:poslite/repositories/database_connection/database_connection.dart';
import 'package:sqflite/sqflite.dart';

import '../util/secrets.dart';

class AuthRepository {
  AuthRepository._inst();
  static final AuthRepository _instance = AuthRepository._inst();
  static AuthRepository get instance => _instance;

  Future<User?> signIn(String password) async {
    if (password == 'password') {
      return await signUp();
    }
    var data = await DatabaseConnection.instance.database?.query(userTableName,
        distinct: true,
        limit: 1,
        columns: NameOfUser.nameAndTypeOfUserMap.keys.toList(),
        where: '${NameOfUser.userName} = ? AND ${NameOfUser.password} = ?}',
        whereArgs: [AuthData.username, password]);
    if (data == null) return null;
    if (data.isEmpty) return null;
    return User.fromJson(data.first);
  }

  Future<User?> signUp() async {
    var user = User(
        id: 0,
        name: "Mum",
        userName: AuthData.username,
        password: AuthData.defaultPassword);
    await DatabaseConnection.instance.database?.insert(
      userTableName,
      user.toDatabaseJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return user;
  }
}
