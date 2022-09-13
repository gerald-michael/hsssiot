import 'package:hive_flutter/hive_flutter.dart';
import 'package:hsssiot/store/models/profile.dart';
part 'user.g.dart';

@HiveType(typeId: 1, adapterName: "UserAdapter")
class User extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final Profile? userProfile;
  User({
    required this.email,
    required this.username,
    this.userProfile,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.email == email && other.username == username;
  }

  @override
  int get hashCode => email.hashCode ^ username.hashCode;

  User.fromJson(Map<String, dynamic> parsedJson)
      : email = parsedJson['email'],
        username = parsedJson['username'],
        userProfile = Profile.fromJson(parsedJson['user_profile']);
}
