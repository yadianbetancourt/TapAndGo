import 'package:flutter/material.dart';

class SideNavComponent extends StatefulWidget {
  const SideNavComponent(
      {super.key});
  

  @override
  SideNavComponentState createState() => SideNavComponentState();
}

class SideNavComponentState extends State<SideNavComponent> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Text('drawer')
            ],
          ),
        ));
  }
}
