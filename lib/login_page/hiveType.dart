import 'package:hive/hive.dart';
part 'hiveType.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  User(this.password, this.username);
}
