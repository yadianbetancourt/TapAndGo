import 'package:flutter/material.dart';
import 'package:tap_and_go/screens/splash_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TapAndGoApp());
}

class TapAndGoApp extends StatelessWidget {
  const TapAndGoApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'TapAndGo!',
      // theme: TapAndGoTheme.lightTheme,
      // darkTheme: TapAndGoTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}