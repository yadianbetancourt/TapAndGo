import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/components/list_tile_item_terminal.dart';
import 'package:tap_and_go/screens/payment_screen.dart';
import 'package:tap_and_go/screens/tips_screen.dart';


import '../models/item.dart';
import '../providers/cart_provider.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  TerminalScreenState createState() => TerminalScreenState();
}

class TerminalScreenState extends State<TerminalScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<Item> testedItems = [
    // Mixed items
    Item(
        name: "Buttermilk Croissant",
        category: "Breakfast",
        price: 4.00,
        imagePath: "assets/images/Buttermilk Croissant.png"),
    Item(
        name: "Classic Club Sandwich",
        category: "Lunch",
        price: 8.50,
        imagePath: "assets/images/Classic Club Sandwich.png"),
    Item(
        name: "Grilled Salmon",
        category: "Dinner",
        price: 15.50,
        imagePath: "assets/images/Grilled Salmon.png"),
    Item(
        name: "Cheesy Cheesecake",
        category: "Dessert",
        price: 3.75,
        imagePath: "assets/images/Cheesy Cheesecake.png"),
    Item(
        name: "Cereal Cream Donut",
        category: "Breakfast",
        price: 2.45,
        imagePath: "assets/images/Cereal Cream Donut.png"),
    Item(
        name: "Grilled Chicken Wrap",
        category: "Lunch",
        price: 7.50,
        imagePath: "assets/images/Grilled Chicken Wrap.png"),

    // Breakfast items
    Item(
        name: "Egg and Cheese Muffin",
        category: "Breakfast",
        price: 3.75,
        imagePath: "assets/images/placeholder.png"),
    Item(
        name: "Pancake Stack",
        category: "Breakfast",
        price: 5.00,
        imagePath: "assets/images/placeholder.png"),
    Item(
        name: "Avocado Toast",
        category: "Breakfast",
        price: 6.25,
        imagePath: "assets/images/placeholder.png"),

    // Lunch items
    Item(
        name: "Caesar Salad",
        category: "Lunch",
        price: 6.00,
        imagePath: "assets/images/placeholder.png"),
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
        name: "Steak Frites",
        category: "Dinner",
        price: 18.75,
        imagePath: "assets/images/placeholder.png"),
    Item(
        name: "Pasta Carbonara",
        category: "Dinner",
        price: 14.50,
        imagePath: "assets/images/placeholder.png"),
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
        name: "Chocolate Lava Cake",
        category: "Dessert",
        price: 5.00,
        imagePath: "assets/images/placeholder.png"),
    Item(
        name: "Egg Tart",
        category: "Dessert",
        price: 3.25,
        imagePath: "assets/images/placeholder.png"),
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
  void initState() {
    super.initState();
    // Listen to Firestore changes in the 'devices/iPhone' document
    firestore.collection('devices').doc('iPhone').snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        var data = docSnapshot.data();
        if (data != null && data['redirectTo'] == 'PayScreen') {
          // Redirect to PayScreen if 'redirectTo' is 'PayScreen'
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PaymentScreen()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFf2f4f7),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFffffff),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFf2f4f7),
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cashier',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFF000000))),
                        Text('CodeWithY',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF000000))),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => const TipsScreen()
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFFf2f4f7)),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        icon: const Icon(Symbols.savings))
                  ],
                ),
              ),
            ),
            Text('Total'.toUpperCase(),
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000))),
            Text('\$${cartProvider.total.toStringAsFixed(2)}',
                style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000))),
            if (testedItems.isEmpty)
              Lottie.asset('assets/lottie/hey.json', height: 300)
            else
              Expanded(
                child: ListView.builder(
                  itemCount: testedItems.length,
                  itemBuilder: (context, index) {
                    return ListTileItemComponent(
                        item: testedItems[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
