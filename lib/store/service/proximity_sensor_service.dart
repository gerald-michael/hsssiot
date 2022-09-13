import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hsssiot/store/models/models.dart';
import 'package:hsssiot/constants.dart';
import 'package:http/http.dart' as http;

List<ProximitySensorReading> parseProximityReading(String responseBody) {
  var list = json.decode(responseBody) as Map<String, dynamic>;
  var results = list["results"] as List<dynamic>;
  List<ProximitySensorReading> readings =
      results.map((e) => ProximitySensorReading.fromJson(e)).toList();
  return readings;
}

Future<List<ProximitySensorReading>> fetchProximityRead() async {
  var tokenBox = Hive.box("token");
  Token token = tokenBox.get("token");
  var response = await http.get(
      Uri.parse(
          "$hostUrl/household/aksam/device/?resourcetype=ProximitySensorReading"),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        "Authorization": "Token ${token.token}"
      });
  return parseProximityReading(response.body);
}

final proximityReadingFuture =
    FutureProvider.autoDispose<List<ProximitySensorReading>>(((ref) async {
  return fetchProximityRead();
}));
