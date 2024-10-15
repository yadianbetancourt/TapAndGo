import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:tap_and_go/components/line_chart_component.dart';
import 'package:tap_and_go/components/appbar_component.dart';
import 'package:tap_and_go/components/number_component.dart';
import 'package:tap_and_go/components/sidenav_component.dart';

import '../components/transaction_history_component.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  StatsScreenState createState() => StatsScreenState();
}

class StatsScreenState extends State<StatsScreen> {
  bool showWarning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      drawer: const SideNavComponent(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AppBarComponent(),
            if (showWarning)
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x80ffba3b),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Symbols.error,
                        size: 30,
                        color: Color(0xFFe04661),
                      ),
                    ),
                    Text(
                      'Your product with code #000000 is out of stock.',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Please request new shipment',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFe04661)),
                        )),
                  ],
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumberContainerComponent(
                    icon: Symbols.shopping_bag,
                    iconColor: Color(0xFF3561a8),
                    bgColor: Color(0x1a3561a8),
                    title: 'Total Orders',
                    numbers: 220,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xcc25a978),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    icon: Symbols.schedule,
                    iconColor: Color(0xFFf58435),
                    bgColor: Color(0x1af58435),
                    title: 'Total Pending Orders',
                    numbers: 10,
                    iconStats: Symbols.trending_down,
                    colorStats: Color(0xcce04661),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    icon: Symbols.task_alt,
                    iconColor: Color(0xFF25a978),
                    bgColor: Color(0x1a25a978),
                    title: 'Total Completed Orders',
                    numbers: 210,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xcc25a978),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    icon: Symbols.menu_book,
                    iconColor: Color(0xFFe04661),
                    bgColor: Color(0x1ae04661),
                    title: 'Total Products',
                    numbers: 20,
                    iconStats: Symbols.library_add,
                    colorStats: Color(0xcc25a978),
                    percentage: '2 new products',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const LineChartComponent(),
                  const SizedBox(width: 10),
                  TransactionHistoryComponent()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
