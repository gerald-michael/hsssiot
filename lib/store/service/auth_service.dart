import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hsssiot/constants.dart';
import 'package:hsssiot/store/models/models.dart';

import '../../utils/in_memory_store.dart';

class AuthService {
  final _authState = InMemoryStore<Token?>(null);
  var tokenBox = Hive.box("token");
  Future<Token> login(String email, String password) async {
    var dio = Dio();
    try {
      var response = await dio.post("$hostUrl/accounts/auth/login/",
          data: {"email": email, "password": password});
      Token token = Token.fromJson(response.data);
      tokenBox.put("token", token);
      _authState.value = token;
      return token;
    } on DioError catch (e) {
      throw e;
    }
  }

  // Token? get currentUser => tokenBox.get("token");
  Token? get currentUser => _authState.value;

  Future<void> logout() async {
    tokenBox.delete("token");
  }

  Stream<Token?> authStateChanges() => _authState.stream;

  // Stream<Token?> authStateChanges() =>
  //     tokenBox.watch(key: "token").map((event) {
  //       if (event.value == null) null;
  //       return event.value;
  //     });
  void dispose() => tokenBox.close();
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
