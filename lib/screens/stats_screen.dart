import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:tap_and_go/components/line_chart_component.dart';
import 'package:tap_and_go/components/appbar_component.dart';
import 'package:tap_and_go/components/number_component.dart';
import 'package:tap_and_go/components/sidenav_component.dart';

import '../components/bar_chart_component.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  StatsScreenState createState() => StatsScreenState();
}

class StatsScreenState extends State<StatsScreen> {
  bool showWarning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f4f7),
      drawer: const SideNavComponent(),
      body: Center(
        child: Column(
          children: [
            const AppBarComponent(),
            if (showWarning)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Symbols.warning,
                          size: 30,
                          color: Color(0xFF3561a8),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                    color: const Color(0xFF3561a8)),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumberContainerComponent(
                    iconButton: Symbols.shopping_bag,
                    colorButton: Color(0xFF3561a8),
                    title: 'Total Orders',
                    number: 100,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xFF25a978),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    iconButton: Symbols.shopping_cart,
                    colorButton: Color(0xFF25a978),
                    title: 'Total Sales',
                    number: 100,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xFF25a978),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    iconButton: Symbols.shopping_cart,
                    colorButton: Color(0xFF25a978),
                    title: 'Total Sales',
                    number: 100,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xFF25a978),
                    percentage: '10% then yesterday',
                  ),
                  NumberContainerComponent(
                    iconButton: Symbols.shopping_cart,
                    colorButton: Color(0xFF25a978),
                    title: 'Total Sales',
                    number: 100,
                    iconStats: Symbols.trending_up,
                    colorStats: Color(0xFF25a978),
                    percentage: '10% then yesterday',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const LineChartComponent()
                  ),
                  Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const BarChartComponent()
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
