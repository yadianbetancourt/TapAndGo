import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/screens/bill_screen.dart';

import '../providers/cart_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  initState() {
    super.initState();
    resetCart();
    redirectToBill();
  }

  Future<void> resetCart() async {
    await firestore.collection('devices').doc('iPhone').update({
      'redirectTo': FieldValue.delete(),
    });
  }

  void redirectToBill() {
    Future.delayed(const Duration(seconds: 10), () =>
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const BillScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFf2f4f7),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xFF1b805b),
                Color(0xFF104b35),
                Color(0xFF061d15),
                Color(0xFF08261b),
                Color(0xFFFFFFFF),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/rounded_icon.png'),
                  ),
                  Icon(
                    Symbols.contactless,
                    color: Color(0xFFFFFFFF),
                    size: 40,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text('Total'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFFFFF))),
              Text('\$${cartProvider.total.toStringAsFixed(2)}',
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFFFFF))),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal :',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                   Text('\$${cartProvider.subtotal.toStringAsFixed(2)}',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                ],
              ),
              const Divider(color: Color(0xFFFFFFFF)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount :',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF25a978))),
                  Text('\$${cartProvider.discount.toStringAsFixed(2)}',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF25a978))),
                ],
              ),
              const Divider(color: Color(0xFFFFFFFF)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TPS (5%) :',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                  Text('\$${cartProvider.provincialTax.toStringAsFixed(2)}',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                ],
              ),
              const Divider(color: Color(0xFFFFFFFF)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TVQ (9.975%) :',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                  Text('\$${cartProvider.federalTax.toStringAsFixed(2)}',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF))),
                ],
              ),
              // Row(
              //   children: [
              //     SvgPicture.asset('assets/svg/visa.svg'),
              //     SvgPicture.asset('assets/svg/mastercard.svg'),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
