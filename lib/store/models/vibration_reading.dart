class VibrationSensorReading {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? image;

  VibrationSensorReading(
      {this.id, this.dateCreated, this.dateUpdated, this.image});

  VibrationSensorReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['image'] = this.image;
    return data;
  }
}
