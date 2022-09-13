import 'package:hive/hive.dart';
import 'package:hsssiot/store/models/token.dart';
import 'package:hsssiot/store/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);
  Stream<Token?> authStateChanges() => _authService.authStateChanges();
  Token? get currentUser => _authService.currentUser;

  Future<Token> login(String email, String password) async {
    return _authService.login(email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authServiceProvider));
});

final authStateChangeProvider = StreamProvider.autoDispose<Token?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
