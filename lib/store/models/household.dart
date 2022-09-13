class Household {
  int? id;
  String? name;
  bool? isActive;
  String? created;
  String? modified;
  String? slug;
  String? email;
  String? lat;
  String? long;
  String? address;
  String? phoneNumber;
  String? description;

  Household({
    this.id,
    this.name,
    this.isActive,
    this.created,
    this.modified,
    this.slug,
    this.email,
    this.lat,
    this.long,
    this.address,
    this.phoneNumber,
    this.description,
  });

  Household.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    created = json['created'];
    modified = json['modified'];
    slug = json['slug'];
    email = json['email'];
    lat = json['lat'];
    long = json['long'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['description'] = this.description;
    return data;
  }
}
