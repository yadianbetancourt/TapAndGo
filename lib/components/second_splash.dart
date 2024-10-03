import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({super.key});

  @override
  SecondSplashState createState() => SecondSplashState();
}

class SecondSplashState extends State<SecondSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Lottie.asset('assets/lottie/second.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 200.0,
                      child: Text(
                        'Create Your Account',
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
                        'Unlock the full potential of ChatConnect by creating an account. Personalize your experience, save favorite chats, and connect with friends more easily. Join us now!',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF171717),
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
