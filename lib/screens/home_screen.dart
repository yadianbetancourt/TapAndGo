import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/components/appbar_component.dart';
import 'package:tap_and_go/components/category_component.dart';
import 'package:tap_and_go/components/sidenav_component.dart';

import '../components/item_card_component.dart';
import '../components/order_component.dart';
import '../models/item.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
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
    Item(
        name: "Egg and Cheese Muffin",
        category: "Breakfast",
        price: 3.75,
        imagePath: "assets/images/Egg and Cheese Muffin.png"),
    Item(
        name: "Caesar Salad",
        category: "Lunch",
        price: 6.00,
        imagePath: "assets/images/Caesar Salad.png"),
    Item(
        name: "Beef Burger",
        category: "Lunch",
        price: 9.25,
        imagePath: "assets/images/Beef Burger.png"),
    Item(
        name: "Steak Frites",
        category: "Dinner",
        price: 18.75,
        imagePath: "assets/images/Steak Frites.png"),
    Item(
        name: "Chocolate Lava Cake",
        category: "Dessert",
        price: 5.00,
        imagePath: "assets/images/Chocolate Lava Cake.png"),
    Item(
        name: "Pancake Stack",
        category: "Breakfast",
        price: 5.00,
        imagePath: "assets/images/Pancake Stack.png"),
    Item(
        name: "Pasta Carbonara",
        category: "Dinner",
        price: 14.50,
        imagePath: "assets/images/Pasta Carbonara.png"),
    Item(
        name: "Chicken Alfredo",
        category: "Dinner",
        price: 13.50,
        imagePath: "assets/images/Chicken Alfredo.png"),
    Item(
        name: "Egg Tart",
        category: "Dessert",
        price: 3.25,
        imagePath: "assets/images/Egg Tart.png"),
    Item(
        name: "Avocado Toast",
        category: "Breakfast",
        price: 6.25,
        imagePath: "assets/images/Avocado Toast.png"),
    Item(
        name: "Fish Tacos",
        category: "Lunch",
        price: 8.00,
        imagePath: "assets/images/Fish Tacos.png"),
    Item(
        name: "Lamb Chops",
        category: "Dinner",
        price: 19.00,
        imagePath: "assets/images/Lamb Chops.png"),
    Item(
        name: "Macaron Selection",
        category: "Dessert",
        price: 4.50,
        imagePath: "assets/images/Macaron Selection.png"),
    Item(
        name: "Fruit Tart",
        category: "Dessert",
        price: 4.00,
        imagePath: "assets/images/Fruit Tart.png"),
    Item(
      name: "Oatmeal",
      category: "Breakfast",
      price: 3.00,
      imagePath: "assets/images/Oatmeal.png",
    ),
    Item(
      name: "Grilled Cheese",
      category: "Lunch",
      price: 6.00,
      imagePath: "assets/images/Grilled Cheese.png",
    ),
    Item(
      name: "Chicken Sandwich",
      category: "Lunch",
      price: 8.00,
      imagePath: "assets/images/Chicken Sandwich.png",
    ),
    Item(
      name: "Turkey Wrap",
      category: "Lunch",
      price: 8.50,
      imagePath: "assets/images/Turkey Wrap.png",
    ),


    // Without Image
    Item(
      name: "Vegetable Soup",
      category: "Lunch",
      price: 5.00,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Salmon",
      category: "Dinner",
      price: 14.00,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Spaghetti",
      category: "Dinner",
      price: 10.00,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Chicken Alfredo",
      category: "Dinner",
      price: 12.00,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Beef Tacos",
      category: "Dinner",
      price: 9.00,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Ice Cream Sundae",
      category: "Dessert",
      price: 3.50,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Apple Pie",
      category: "Dessert",
      price: 4.50,
      imagePath: "assets/images/placeholder.png",
    ),
    Item(
      name: "Cheesecake",
      category: "Dessert",
      price: 6.00,
      imagePath: "assets/images/placeholder.png",
    ),
  ];
  bool showFilters = false;

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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 700,
                          child: TextField(
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF000000)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide.none,
                              ),
                              labelText: 'Search any Item here',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF797978)),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xFFFFFFFF),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          const Color(0xFF3561a8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showFilters = !showFilters;
                            });
                          },
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
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showFilters)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryComponent(
                            icon: Symbols.restaurant,
                            title: 'All Menu',
                            subtitle: '110 Items'),
                        CategoryComponent(
                            icon: Symbols.bakery_dining,
                            title: 'Breakfast',
                            subtitle: '20 Items'),
                        CategoryComponent(
                            icon: Symbols.lunch_dining,
                            title: 'Lunch',
                            subtitle: '20 Items'),
                        CategoryComponent(
                            icon: Symbols.ramen_dining,
                            title: 'Diner',
                            subtitle: '20 Items'),
                        CategoryComponent(
                            icon: Symbols.icecream,
                            title: 'Dessert',
                            subtitle: '20 Items'),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: showFilters ? 10.0 : 0.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Provider.of<CartProvider>(context, listen: false).addItemToCart(items[index]);
                              },
                              child: ItemCardComponent(item: items[index])
                          );
                        },
                      ),
                    ),
                  ),
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
