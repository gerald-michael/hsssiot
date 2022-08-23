import 'package:dio/dio.dart';
import 'package:hsssiot/store/states/login_states.dart';
import 'package:hsssiot/store/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();

    try {
      await ref.read(authRepositoryProvider).login(email, password);
      print('success');
      state = const LoginStateSuccess();
    } on DioError catch (e) {
      print("error in controller");
      print(e.response);
      state = LoginStateError(e.toString());
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
