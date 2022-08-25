import 'package:dio/dio.dart';
import 'package:hsssiot/constants.dart';

class HouseholdService {
  getGasSensorReading() async {
    var dio = Dio();
    try {
      var response = await dio.get("$hostUrl/accounts/auth/login/");
    } on DioError catch (e) {
      throw e;
    }
  }
}
