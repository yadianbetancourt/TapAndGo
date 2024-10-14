import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_and_go/screens/terminal_screen.dart';
import 'package:tap_and_go/screens/welcome_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late bool isFirstLaunch;
  late Widget redirectTo;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    fadeIn();
    defineRedirect();

    Future.delayed(const Duration(seconds: 4), () {
      if (!context.mounted) return;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => redirectTo));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  void fadeIn() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  void defineRedirect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLaunch = prefs.getBool('first_launch') ?? true;

    if(isFirstLaunch){
      setState(() {
        redirectTo = const WelcomeScreen();
      });
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo info = await deviceInfo.iosInfo;
      if (info.model.toLowerCase().contains("ipad")) {
        setState(() {
          redirectTo = const HomeScreen();
        });
      }
      else{
        setState(() {
          redirectTo = const TerminalScreen();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Color(0xFF25a978),
            Color(0xFF5bc4e2),
            Color(0xFF3561a8),
            Color(0xFFe04661),
            Color(0xFFf58435),
            Color(0xFFffba3b),
          ],
        ),
      ),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(seconds: 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                  width: 200,
                  height: 200,
                  image: AssetImage('assets/images/rounded_icon.png')),
              const SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('TapAndGo!',
                      textStyle: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700),
                      speed: const Duration(milliseconds: 200))
                ],
                totalRepeatCount: 1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
