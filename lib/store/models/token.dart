import 'package:hive/hive.dart';
import 'package:hsssiot/store/models/models.dart';
part 'token.g.dart';

@HiveType(typeId: 2, adapterName: "TokenAdapter")
class Token extends HiveObject {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final User user;

  Token({
    required this.token,
    required this.user,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Token && other.key == key && other.user == user;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode;

  Token.fromJson(Map<String, dynamic> parsedJson)
      : token = parsedJson['key'],
        user = User.fromJson(parsedJson['user']);
}
