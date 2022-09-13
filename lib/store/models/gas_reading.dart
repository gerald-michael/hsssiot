class GasSensorReading {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? status;
  double? value;

  GasSensorReading({
    this.id,
    this.dateCreated,
    this.dateUpdated,
    this.value,
  });

  GasSensorReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    status = json['status'];
    value = double.tryParse(json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['value'] = this.value;
    data['status'] = this.status;
    return data;
  }
}
