import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/store/models/models.dart';
import 'package:http/http.dart' as http;

List<GasSensorReading> parseGasReading(String responseBody) {
  var list = json.decode(responseBody) as Map<String, dynamic>;
  print(responseBody);
  var results = list["results"] as List<dynamic>;
  List<GasSensorReading> readings =
      results.map((e) => GasSensorReading.fromJson(e)).toList();
  return readings;
}

Future<List<GasSensorReading>> fetchGasRead() async {
  var tokenBox = Hive.box("token");
  Token token = tokenBox.get("token");
  var response = await http.get(
      Uri.parse(
          "$hostUrl/household/aksam/device/?resourcetype=GasSensorReading"),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        "Authorization": "Token ${token.token}"
      });
  return parseGasReading(response.body);
}

final gasReadingFuture =
    FutureProvider.autoDispose<List<GasSensorReading>>(((ref) async {
  return fetchGasRead();
}));
