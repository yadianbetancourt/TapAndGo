import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FirstSplash extends StatefulWidget {
  const FirstSplash({super.key});

  @override
  FirstSplashState createState() => FirstSplashState();
}

class FirstSplashState extends State<FirstSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeaf9f1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/lottie/first.json'),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 200.0,
                  child: Text('Welcome to ChatConnect!',
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
                      'Dive into endless conversations with people from around the world. Meet new friends, share experiences, and enjoy spontaneous interactions. Ready to chat?',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF171717),
                      ),
                      textAlign: TextAlign.justify
                  ),
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
