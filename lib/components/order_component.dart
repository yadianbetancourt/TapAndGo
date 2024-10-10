import 'package:dotted_line/dotted_line.dart';
import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class OrderComponent extends StatefulWidget {
  const OrderComponent({super.key});

  @override
  OrderComponentState createState() => OrderComponentState();
}

const List<String> orderType = <String>['Order Type', 'Delivery', 'Pickup'];
const List<String> tables = <String>[
  'Select Table',
  'Table 1',
  'Table 2',
  'Table 3',
  'Table 4',
  'Table 5',
  'Table 6',
  'Table 7',
  'Table 8',
  'Table 9',
  'Table 10'
];

class OrderComponentState extends State<OrderComponent> {
  List<String> orderItems = [];
  double subtotal = 100;
  double discount = 10;
  double tps = 0.05;
  double tvq = 0.09975;
  double provincialTax = 0;
  double federalTax = 0;
  double total = 0;

  String selectedOrderType = orderType.first;
  String selectedTable = tables.first;

  @override
  void initState() {
    super.initState();
    provincialTax = subtotal * tps;
    federalTax = subtotal * tvq;
    federalTax = double.parse(federalTax.toStringAsFixed(2));
    total = subtotal - discount + (subtotal * tps) + (subtotal * tvq);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
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
          Row(
            children: [
          DropdownMenu<String>(
          initialSelection: orderType.first,
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                selectedOrderType = value!;
              });
            },
            dropdownMenuEntries: orderType.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
              DropdownMenu<String>(
                initialSelection: tables.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selectedOrderType = value!;
                  });
                },
                dropdownMenuEntries: orderType.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              orderItems.isEmpty
                ? Text('No items in order',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                    color: const Color(0xFF7b7b7b)))
                : ListView.builder(
                    itemCount: orderItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(orderItems[index],
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000))),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              orderItems.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Symbols.delete,
                            color: Color(0xFF000000),
                          ),
                        ),
                      );
                    }
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal :',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000))),
                    Text('\$$subtotal',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount :',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7b7b7b))),
                    Text('\$$discount',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7b7b7b))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TPS (5%) :',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                        color: const Color(0xFF7b7b7b))),
                    Text('\$$provincialTax',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                        color: const Color(0xFF7b7b7b))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TVQ (9.975%) :',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                        color: const Color(0xFF7b7b7b))),
                    Text('\$$federalTax',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                        color: const Color(0xFF7b7b7b))),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: DottedLine(dashLength: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total : ',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000))),
                    Text('\$$total',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF000000)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFfafafa),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: 'Code promo',
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF7b7b7b)),
                            suffixIcon: Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(
                                      const Color(0xFFFFFFFF)),
                                ),
                                icon: const Icon(
                                  Symbols.sell,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xffffffff)),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(10)),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: Color(0xFF000000)))),
                        ),
                        child: Text(
                          'Payment method',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF000000)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFF3561a8)),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(10)),
                  shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
                ),
                child: Text('Continue',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFFFFFF)))),
          )
        ],
      ),
    );
  }
}
