class ProximitySensorReading {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? image;
  double? distance;

  ProximitySensorReading({
    this.id,
    this.dateCreated,
    this.dateUpdated,
    this.image,
    this.distance,
  });

  ProximitySensorReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    image = json['image'];
    distance = double.parse(json['distance']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['image'] = this.image;
    data['distance'] = this.distance;
    return data;
  }
}
