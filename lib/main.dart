import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_and_go/screens/home_screen.dart';
import 'package:tap_and_go/screens/splash_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  runApp(TapAndGoApp(isFirstLaunch: isFirstLaunch));
}

class TapAndGoApp extends StatelessWidget {
  const TapAndGoApp({super.key, required this.isFirstLaunch});
  final bool isFirstLaunch;

  @override
  Widget build(BuildContext context) {
    Widget redirectTo = isFirstLaunch ? const SplashScreen() : const HomeScreen();

    return MaterialApp(
      title: 'TapAndGo!',
      // theme: TapAndGoTheme.lightTheme,
      // darkTheme: TapAndGoTheme.darkTheme,
      home: redirectTo,
    );
  }
}