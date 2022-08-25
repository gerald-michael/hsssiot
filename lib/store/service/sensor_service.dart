import 'package:dio/dio.dart';

class SensorService {
  get hostUrl => null;

  getGasSensorReading() async {
    var dio = Dio();
    // try {
    //   var response = await dio.post("$hostUrl/accounts/auth/login/",
    //       data: {"email": email, "password": password});
    //   Token token = Token.fromJson(response.data);
    //   return token;
    // } on DioError catch (e) {
    //   throw e;
    // }
  }
}
