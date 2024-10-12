import 'package:dotted_line/dotted_line.dart';
import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/item.dart';

class ListTileItemComponent extends StatefulWidget {
  const ListTileItemComponent({super.key, required this.item});

  final Item item;

  @override
  ListTileItemComponentState createState() => ListTileItemComponentState();
}

class ListTileItemComponentState extends State<ListTileItemComponent> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  widget.item.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  Text(
                    '\$${widget.item.price.toStringAsFixed(2)}',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7b7b7b),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DottedLine(dashColor: Color(0xFF7b7b7b), dashLength: 5),
          ),
        ],
      ),
    );
  }
}
