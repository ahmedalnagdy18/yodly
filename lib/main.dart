import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/presentation/pages/splash_screen/splash_screen.dart';
import 'package:yodly/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrance.instanc
      .initialization(sharedPreferences: await SharedPreferences.getInstance());

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
