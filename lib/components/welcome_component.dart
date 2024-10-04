import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';

class WelcomeComponent extends StatefulWidget {
  const WelcomeComponent(
      {super.key,
      required this.color,
      required this.lottie,
      required this.title,
      required this.subtitle,
      required this.isLast});

  final Color color;
  final String lottie;
  final String title;
  final String subtitle;
  final bool isLast;

  @override
  WelcomeComponentState createState() => WelcomeComponentState();
}

class WelcomeComponentState extends State<WelcomeComponent> {

  void setFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_launch', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                    'assets/lottie/${widget.lottie}'
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title,
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF)
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.subtitle,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)
                          ),
                          textAlign: TextAlign.justify),
                    ),
                    const SizedBox(height: 16.0),
                    if (widget.isLast)
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          onPressed: () async {
                            setFirstLaunch();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)
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
        ));
  }
}
