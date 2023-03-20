import 'package:codemaker_annotations/codemaker_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poslite/repositories/database_connection/util.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@nameof
class User with _$User implements DatabaseItem {
  factory User({
    required int id,
    required String name,
    required String userName,
    required String password,
  }) = _User;

  User._();
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() => User(name: '', userName: '', password: '', id: 0);

  factory User.fromDatabaseJson(Map<String, dynamic> obj) => User.fromJson(obj);

  @override
  // TODO: implement tableName
  String get tableName => 'User';

  @override
  Map<String, dynamic> toDatabaseJson() => toJson();

  @override
  Map<String, Type> createDatabaseMap() {
    var data = NameOfUser.nameAndTypeOfUserMap;
    data.remove(NameOfUser.id);
    return data;
  }
}
