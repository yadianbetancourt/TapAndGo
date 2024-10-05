import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class OrderComponent extends StatefulWidget {
  const OrderComponent({super.key});

  @override
  OrderComponentState createState() => OrderComponentState();
}

class OrderComponentState extends State<OrderComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0x1a3561a8)),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(10)),
                  ),
                  icon: const Icon(
                    Symbols.receipt_long,
                    color: Color(0xFF3561a8),
                    size: 30,
                  )),
              Column(
                children: [
                  Text('Customer Name',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400)),
                  Text('Order #123456',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0x1a3561a8)),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(10)),
                  ),
                  icon: const Icon(
                    Symbols.savings,
                    color: Color(0xFF3561a8),
                    size: 30,
                  )),
            ],
          ),
          const Expanded(
              child: Column(
            children: [],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$100.00',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400)),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xff3561a8)),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(10)),
                ),
                child: const Text('View Order',
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
