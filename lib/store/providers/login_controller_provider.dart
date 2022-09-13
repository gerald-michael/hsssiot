import 'package:dio/dio.dart';
import 'package:hsssiot/store/states/login_states.dart';
import 'package:hsssiot/store/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).login(email, password);
      state = const LoginStateSuccess();
    } on DioError catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  Token? getCurrentUser() {
    return ref.read(authRepositoryProvider).currentUser;
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
