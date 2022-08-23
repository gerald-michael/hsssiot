import 'package:hsssiot/store/models/models.dart';

class Token {
  final String key;
  final User user;

  Token({
    required this.key,
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
      : key = parsedJson['key'],
        user = User.fromJson(parsedJson['user']);
}
