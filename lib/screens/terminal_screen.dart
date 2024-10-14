import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/components/item_terminal.dart';
import 'package:tap_and_go/screens/payment_screen.dart';


import '../providers/cart_provider.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  TerminalScreenState createState() => TerminalScreenState();
}

class TerminalScreenState extends State<TerminalScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                        onPressed: () {},
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
            if (cartProvider.itemsInCart.isEmpty)
              Lottie.asset('assets/lottie/hey.json', height: 300)
            else
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          itemCount: cartProvider.itemsInCart.length,
                          itemBuilder: (context, index) {
                            return ListTileItemComponent(
                                item: cartProvider.itemsInCart[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
