import 'package:hsssiot/store/models/profile.dart';

class User {
  final String email;
  final String username;
  final Profile userProfile;
  User({
    required this.email,
    required this.username,
    required this.userProfile,
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
