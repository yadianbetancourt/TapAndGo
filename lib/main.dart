import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_and_go/providers/cart_provider.dart';
import 'package:tap_and_go/screens/splash_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: const TapAndGoApp(),
      ),
  );
}

class TapAndGoApp extends StatelessWidget {
  const TapAndGoApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'TapAndGo!',
      // theme: TapAndGoTheme.lightTheme,
      // darkTheme: TapAndGoTheme.darkTheme,
      home: SplashScreen(),
      routes: {
        // '/': (context) => const SplashScreen(),
        // '/home': (context) => const HomeScreen(),
        // '/cart': (context) => const CartScreen(),
        // '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}