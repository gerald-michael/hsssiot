import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/store/models/models.dart';

class AuthService {
  Future<Token> login(String email, String password) async {
    var dio = Dio();
    try {
      var response = await dio.post("$hostUrl/accounts/auth/login/",
          data: {"email": email, "password": password});
      Token token = Token.fromJson(response.data);
      return token;
    } on DioError catch (e) {
      throw e;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
