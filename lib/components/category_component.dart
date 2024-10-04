import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryComponent extends StatefulWidget {
  const CategoryComponent({super.key, required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  CategoryComponentState createState() => CategoryComponentState();
}

class CategoryComponentState extends State<CategoryComponent> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0x1a3561a8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.icon,
                color: const Color(0xFF274883),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF797978),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
