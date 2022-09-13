import 'package:hsssiot/constants.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hsssiot/screens/screens.dart';
import 'package:hsssiot/store/models/models.dart';
import 'package:hsssiot/store/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox("token");
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
      initTheme: kLightTheme,
      builder: (context, theme) {
        return MaterialApp(
          title: 'HSSSIOT',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: AuthenticationWrapper(),
        );
      },
    );
  }
}

class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    print(authState);
    return authState.maybeWhen(
      data: (token) => token != null ? const DashBoard() : const LoginScreen(),
      // TODO: Should also handle errors
      orElse: () => Scaffold(
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
