class Profile {
  final String? image;
  final String? phoneNumber;
  final String? firstName;
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
