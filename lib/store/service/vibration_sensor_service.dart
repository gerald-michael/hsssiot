import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/store/models/models.dart';
import 'package:http/http.dart' as http;

List<VibrationSensorReading> parseVibrationReading(String responseBody) {
  var list = json.decode(responseBody) as Map<String, dynamic>;
  var results = list["results"] as List<dynamic>;
  List<VibrationSensorReading> readings =
      results.map((e) => VibrationSensorReading.fromJson(e)).toList();
  return readings;
}

Future<List<VibrationSensorReading>> fetchVibrationRead() async {
  var tokenBox = Hive.box("token");
  Token token = tokenBox.get("token");
  var response = await http.get(
      Uri.parse(
          "$hostUrl/household/aksam/device/?resourcetype=TouchSensorReading"),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        "Authorization": "Token ${token.token}"
      });
  return parseVibrationReading(response.body);
}

final vibrationReadingFuture =
    FutureProvider.autoDispose<List<VibrationSensorReading>>(((ref) async {
  return fetchVibrationRead();
}));
