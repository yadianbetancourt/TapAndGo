import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodComponent extends StatefulWidget {
  const PaymentMethodComponent({super.key});


  @override
  PaymentMethodComponentState createState() => PaymentMethodComponentState();
}

class PaymentMethodComponentState extends State<PaymentMethodComponent> {
  String selectedMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x1a7b7b7b),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPaymentOption('Credit Card', Icons.credit_card_rounded, selectedMethod),
          buildPaymentOption('Pay Later', Icons.receipt_long_outlined, selectedMethod),
          buildPaymentOption('Cash', Icons.attach_money_rounded, selectedMethod),
        ],
      ),
    );
  }

  Widget buildPaymentOption(String method, IconData icon, String selected) {
    bool isSelected = method == selected;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFFFFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF3561a8) : const Color(0xFF7b7b7b)),
            const SizedBox(height: 4),
            Text(
              method,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: isSelected ? const Color(0xFF3561a8) : const Color(0xFF7b7b7b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
