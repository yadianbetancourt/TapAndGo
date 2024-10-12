import 'package:dotted_line/dotted_line.dart';
import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/components/ordered_item_component.dart';
import 'package:tap_and_go/components/payment_method_component.dart';

import '../models/item.dart';
import '../providers/cart_provider.dart';

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
final List<Item> testedItems = [
  // Breakfast items
  Item(
      name: "Buttermilk Croissant",
      category: "Breakfast",
      price: 4.00,
      imagePath: "assets/images/placeholder.png"),
  Item(
      name: "Pancake Stack",
      category: "Breakfast",
      price: 5.00,
      imagePath: "assets/images/placeholder.png"),

  // Lunch items
  Item(
      name: "Beef Burger",
      category: "Lunch",
      price: 9.25,
      imagePath: "assets/images/placeholder.png"),
  Item(
      name: "Fish Tacos",
      category: "Lunch",
      price: 8.00,
      imagePath: "assets/images/placeholder.png"),

  // Dinner items
  Item(
      name: "Chicken Alfredo",
      category: "Dinner",
      price: 13.50,
      imagePath: "assets/images/placeholder.png"),
  Item(
      name: "Lamb Chops",
      category: "Dinner",
      price: 19.00,
      imagePath: "assets/images/placeholder.png"),

  // Dessert items
  Item(
      name: "Macaron Selection",
      category: "Dessert",
      price: 4.50,
      imagePath: "assets/images/placeholder.png"),
  Item(
      name: "Fruit Tart",
      category: "Dessert",
      price: 4.00,
      imagePath: "assets/images/placeholder.png"),
];


class OrderComponentState extends State<OrderComponent> {
  String selectedOrderType = orderType.first;
  String selectedTable = tables.first;
  String selectedPaymentMethod = paymentMethods.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double componentWidth = MediaQuery.of(context).size.width / 3;
    final cartProvider = Provider.of<CartProvider>(context);

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  if (cartProvider.itemsInCart.isEmpty)
                    Text(
                      'No items in order',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7b7b7b),
                      ),
                    )
                  else
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: cartProvider.itemsInCart.length,
                        itemBuilder: (context, index) {
                          return OrderedItemComponent(
                            item: cartProvider.itemsInCart[index],
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
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
                    Text('\$${cartProvider.subtotal.toStringAsFixed(2)}',
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
                            color: const Color(0xFF25a978))),
                    Text('\$${cartProvider.discount.toStringAsFixed(2)}',
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF25a978))),
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
                    Text('\$${cartProvider.provincialTax.toStringAsFixed(2)}',
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
                    Text('\$${cartProvider.federalTax.toStringAsFixed(2)}',
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
                    Text('\$${cartProvider.total.toStringAsFixed(2)}',
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
                        width: componentWidth / 1.5,
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
                            suffixIcon: const Icon(
                              Symbols.sell,
                              color: Color(0xFF000000),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xFF3561a8)),
                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.all(10)),
                            shape: WidgetStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                          ),
                          child: Text('Apply',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF))),
                        ),
                      ),
                    ],
                  ),
                ),
                const PaymentMethodComponent(),
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
