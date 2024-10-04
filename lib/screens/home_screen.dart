import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:tap_and_go/components/appbar_component.dart';
import 'package:tap_and_go/components/category_component.dart';
import 'package:tap_and_go/components/sidenav_component.dart';

import '../components/order_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f4f7),
      drawer: const SideNavComponent(),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const AppBarComponent(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 800,
                          child: TextField(
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF000000)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Search any product here',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF797978)),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xFFFFFFFF),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(
                                      const Color(0xFF3561a8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_alt_rounded,
                            color: Color(0xFFededed),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                const Color(0xFF3561a8)),
                            shape: WidgetStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryComponent(icon: Symbols.restaurant, title: 'All Menu', subtitle: '110 Items'),
                      CategoryComponent(icon: Symbols.bakery_dining, title: 'Breakfast', subtitle: '20 Items'),
                      CategoryComponent(icon: Symbols.lunch_dining, title: 'Lunch', subtitle: '20 Items'),
                      CategoryComponent(icon: Symbols.ramen_dining, title: 'Diner', subtitle: '20 Items'),
                      CategoryComponent(icon: Symbols.icecream, title: 'Dessert', subtitle: '20 Items'),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'All Menu',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  const Text('menu_here'),
                ],
              ),
            ),
            const OrderComponent(),
          ],
        ),
      ),
    );
  }
}
