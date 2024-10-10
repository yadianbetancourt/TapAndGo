import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/item.dart';

class ItemCardComponent extends StatelessWidget {
  final Item item;

  const ItemCardComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   ItemDetailsScreen.routeName,
        //   arguments: item,
        // );
      },
      child: Card(
        color: const Color(0xFFFFFFFF),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(item.imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0x1a3561a8),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      item.category,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF3561a8)
                      ),
                    ),
                  ),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
