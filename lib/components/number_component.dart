import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberContainerComponent extends StatelessWidget {
  const NumberContainerComponent(
      {super.key,
      required this.iconButton,
      required this.colorButton,
      required this.title,
      required this.number,
      required this.iconStats,
      required this.colorStats,
      required this.percentage});

  final IconData iconButton;
  final Color colorButton;
  final String title;
  final int number;
  final IconData iconStats;
  final Color colorStats;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF7b7b7b),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF7b7b7b),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  number.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    iconStats,
                    size: 20,
                    color: colorStats,
                  ),
                  Text(
                    '10% then yesterday',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: colorStats,
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0x1a3561a8))),
                  icon: Icon(iconButton, color: colorButton, size: 20))),
        ],
      ),
    );
  }
}
