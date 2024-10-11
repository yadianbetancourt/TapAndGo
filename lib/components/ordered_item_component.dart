import 'package:dotted_line/dotted_line.dart';
import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/item.dart';

class OrderedItemComponent extends StatefulWidget {
  const OrderedItemComponent({super.key, required this.item});

  final Item item;

  @override
  OrderedItemComponentState createState() => OrderedItemComponentState();
}

class OrderedItemComponentState extends State<OrderedItemComponent> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final double componentWidth = MediaQuery.of(context).size.width / 3;

    return Container(
      width: componentWidth,
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
              const Spacer(),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                        iconSize: 20,
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xFFFFFFFF)),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.all(0.0)),
                        ),
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF7b7b7b),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      quantity.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        iconSize: 20,
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xFFFFFFFF)),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.all(0.0)),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
