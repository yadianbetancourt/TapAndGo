import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class TransactionHistoryComponent extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "id": 10322,
      "time": "01:45 PM",
      "date": "Today",
      "amount": 45.95,
      "status": "Success",
    },
    {
      "id": 10321,
      "time": "12:00 PM",
      "date": "Today",
      "amount": 50.95,
      "status": "Success",
    },
    {
      "id": 10320,
      "time": "12:00 PM",
      "date": "Today",
      "amount": 30.25,
      "status": "Success",
    },
  ];

  TransactionHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 410,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(
            color: const Color(0xFFcccccc),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 16.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transaction History',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFcccccc),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true, // Allows ListView inside Column
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0x1a25a978),
                              child: Icon(
                                Symbols.check,
                                color: Color(0xFF25a978),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment from #${transaction["id"]}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                                Text(
                                  '${transaction["date"]}, ${transaction["time"]}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF7b7b7b),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '+\$${transaction["amount"].toStringAsFixed(2)}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0x1a25a978),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                transaction["status"],
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF25a978),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFf5f5f5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View All Transactions',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3561a8),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Symbols.keyboard_arrow_down,
                    size: 20,
                    color: Color(0xFF3561a8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
