import 'package:flutter/material.dart';

class OrderComponent extends StatefulWidget {
  const OrderComponent({super.key});

  @override
  OrderComponentState createState() => OrderComponentState();
}

class OrderComponentState extends State<OrderComponent> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
