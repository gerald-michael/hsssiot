import 'package:hive/hive.dart';
part 'profile.g.dart';

@HiveType(typeId: 3, adapterName: "ProfileAdapter")
class Profile extends HiveObject {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final String? firstName;
  @HiveField(3)
  final String? lastName;

  Profile({this.image, this.phoneNumber, this.firstName, this.lastName});

  @override
  int get hashCode =>
      image.hashCode ^
      phoneNumber.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;

  Profile.fromJson(Map<String, dynamic> parsedJson)
      : image = parsedJson['image'],
        phoneNumber = parsedJson['phone_number'],
        lastName = parsedJson['lastname'],
        firstName = parsedJson['firstname'];
}
