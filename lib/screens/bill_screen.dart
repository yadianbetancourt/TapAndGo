import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/cart_provider.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  BillScreenState createState() => BillScreenState();
}

class BillScreenState extends State<BillScreen> {
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

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFf2f4f7),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Icon(
                Symbols.verified,
                size: 100,
                color: Color(0xFF25a978),
              ),
              Text('Payment Successful',
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000))),
              const SizedBox(height: 10),
              Text('Amount'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF7b7b7b))),
              Text('\$${cartProvider.total.toStringAsFixed(2)}',
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()),
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7b7b7b)),
                  ),
                  Text(
                    ' - ',
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7b7b7b)),
                  ),
                  Text(
                    'Bill ID : #123456',
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7b7b7b)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFFcccccc)),
                      left: BorderSide(color: Color(0xFFcccccc)),
                      right: BorderSide(color: Color(0xFFcccccc)),
                      bottom: BorderSide(color: Color(0xFFcccccc)),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Payment Details'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF000000))),
                        ),
                      ),
                      const Divider(color: Color(0xFFcccccc)),
                      ExpansionTile(
                        title: Row(
                          children: [
                            const Icon(
                              Symbols.bakery_dining,
                              color: Color(0xFF7b7b7b),
                              size: 20,
                              weight: 700,
                            ),
                            const SizedBox(width: 10),
                            Text('Breakfast (0)',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                'Total: \$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7b7b7b))),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF7b7b7b),
                        ),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                            // Set the height for the scrollable area
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: testedItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    minTileHeight: 20,
                                    title: Row(
                                      children: [
                                        Text(testedItems[index].name,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                        const Spacer(),
                                        Text(
                                            '\$${testedItems[index].price.toStringAsFixed(2)}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Row(
                          children: [
                            const Icon(
                              Symbols.lunch_dining,
                              color: Color(0xFF7b7b7b),
                              size: 20,
                              weight: 700,
                            ),
                            const SizedBox(width: 10),
                            Text('Lunch (0)',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                'Total: \$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7b7b7b))),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF7b7b7b),
                        ),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                            // Set the height for the scrollable area
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: testedItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    minTileHeight: 20,
                                    title: Row(
                                      children: [
                                        Text(testedItems[index].name,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                        const Spacer(),
                                        Text(
                                            '\$${testedItems[index].price.toStringAsFixed(2)}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Row(
                          children: [
                            const Icon(
                              Symbols.ramen_dining,
                              color: Color(0xFF7b7b7b),
                              size: 20,
                              weight: 700,
                            ),
                            const SizedBox(width: 10),
                            Text('Diner (0)',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                'Total: \$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7b7b7b))),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF7b7b7b),
                        ),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                            // Set the height for the scrollable area
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: testedItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    minTileHeight: 20,
                                    title: Row(
                                      children: [
                                        Text(testedItems[index].name,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                        const Spacer(),
                                        Text(
                                            '\$${testedItems[index].price.toStringAsFixed(2)}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Row(
                          children: [
                            const Icon(
                              Symbols.icecream,
                              color: Color(0xFF7b7b7b),
                              size: 20,
                              weight: 700,
                            ),
                            const SizedBox(width: 10),
                            Text('Dessert (0)',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                'Total: \$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7b7b7b))),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF7b7b7b),
                        ),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          SizedBox(
                            height: 150,
                            // Set the height for the scrollable area
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: testedItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    minTileHeight: 20,
                                    title: Row(
                                      children: [
                                        Text(testedItems[index].name,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                        const Spacer(),
                                        Text(
                                            '\$${testedItems[index].price.toStringAsFixed(2)}',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF000000))),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Details Transaction'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF7b7b7b))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Amount paid',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                '\$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Discount :',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                '\$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Taxes :',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            Text(
                                '\$${cartProvider.subtotal.toStringAsFixed(2)}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF000000))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Payment method',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000))),
                            const Spacer(),
                            const Icon(
                              Icons.credit_card,
                              color: Color(0xFF000000),
                            ),
                            const SizedBox(width: 10),
                            Text('Credit Card',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF000000))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.receipt_long_outlined,
                          color: Color(0xFF3561a8),
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text('Print Receipt',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF3561a8))),
                      ],
                    )),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
