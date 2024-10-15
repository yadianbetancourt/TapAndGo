import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberContainerComponent extends StatelessWidget {
  const NumberContainerComponent({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.numbers,
    required this.iconStats,
    required this.colorStats,
    required this.percentage,
  });

  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final int numbers;
  final IconData iconStats;
  final Color colorStats;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 20,

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFFcccccc),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7b7b7b),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  numbers.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    iconStats,
                    size: 20,
                    color: colorStats,
                  ),
                  const SizedBox(width: 5),
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
                              borderRadius: BorderRadius.circular(5))),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          bgColor)),
                  icon: Icon(icon, color: iconColor, size: 20))),
        ],
      ),
    );
  }
}
