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
const List<String> paymentMethods = <String>[
  'Payment Method',
  'Cash',
  'Visa',
  'Paypal',
  'CashApp',
  'Stripe'
];

class OrderComponentState extends State<OrderComponent> {
  List<String> orderItems = [];
  double subtotal = 0;
  double discount = 0;
  double tps = 0.05;
  double tvq = 0.09975;
  double provincialTax = 0;
  double federalTax = 0;
  double total = 0;

  String selectedOrderType = orderType.first;
  String selectedTable = tables.first;
  String selectedPaymentMethod = paymentMethods.first;

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
    final double componentWidth = MediaQuery.of(context).size.width / 3;

    return Container(
      width: componentWidth,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0x1a3561a8)),
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
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0x1a3561a8)),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownMenu<String>(
                initialSelection: orderType.first,
                trailingIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Symbols.arrow_drop_down,
                    color: Color(0xFF000000),
                  ),
                ),
                selectedTrailingIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Symbols.arrow_drop_up,
                    color: Color(0xFF000000),
                  ),
                ),
                textStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7b7b7b)),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: const Color(0xFFfafafa),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                ),
                menuStyle: const MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xFFFFFFFF),
                  ),
                ),
                onSelected: (String? value) {
                  setState(() {
                    selectedOrderType = value!;
                  });
                },
                dropdownMenuEntries:
                    orderType.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    labelWidget: Text(value,
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000))),
                  );
                }).toList(),
              ),
              const SizedBox(width: 10),
              DropdownMenu<String>(
                initialSelection: tables.first,
                trailingIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Symbols.arrow_drop_down,
                    color: Color(0xFF000000),
                  ),
                ),
                selectedTrailingIcon: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Symbols.arrow_drop_up,
                    color: Color(0xFF000000),
                  ),
                ),
                textStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7b7b7b)),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: const Color(0xFFfafafa),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                ),
                menuStyle: const MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xFFFFFFFF),
                  ),
                ),
                onSelected: (String? value) {
                  setState(() {
                    selectedTable = value!;
                  });
                },
                dropdownMenuEntries:
                    tables.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    labelWidget: Text(value,
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000))),
                  );
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
                      })
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
                  child:
                      DottedLine(dashColor: Color(0xFF7b7b7b), dashLength: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total : '.toUpperCase(),
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
                        width: componentWidth / 2.2,
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
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          const Color(0xFFFFFFFF)),
                                ),
                                icon: const Icon(
                                  Symbols.sell,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: componentWidth / 2,
                        height: 40,
                        child: DropdownMenu<String>(
                          initialSelection: paymentMethods.first,
                          trailingIcon: const Visibility(
                            visible: false,
                            child: Icon(
                              Symbols.money_bag,
                              color: Color(0xFF000000),
                            ),
                          ),
                          selectedTrailingIcon: const Visibility(
                            visible: false,
                            child: Icon(
                              Symbols.money_bag,
                              color: Color(0xFF000000),
                            ),
                          ),
                          textStyle: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF000000)),
                          inputDecorationTheme: InputDecorationTheme(
                            filled: true,
                            fillColor: const Color(0xFFfafafa),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Color(0xFF000000))),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                          ),
                          menuStyle: const MenuStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFFFFFFFF),
                            ),
                          ),
                          expandedInsets: const EdgeInsets.all(0),
                          onSelected: (String? value) {
                            setState(() {
                              selectedPaymentMethod = value!;
                            });
                          },
                          dropdownMenuEntries: paymentMethods
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                              labelWidget: Text(value,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF000000))),
                            );
                          }).toList(),
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
