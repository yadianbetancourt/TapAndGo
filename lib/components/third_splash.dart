import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_and_go/screens/board_screen.dart';

class ThirdSplash extends StatefulWidget {
  const ThirdSplash({super.key});

  @override
  ThirdSplashState createState() => ThirdSplashState();
}

class ThirdSplashState extends State<ThirdSplash> {
  void _setFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
    if (kDebugMode) {
      print('First launch done');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset('assets/lottie/third.json'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 200.0,
                      child: Text(
                        'Start Chatting',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1f2e3b),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Jump right into the action! Start chatting with random people from around the globe. Every connection is a new adventure. Let\'s get started!',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF171717),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1f2e3b),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed: () async {
                          _setFirstLaunch();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return const BoardScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
