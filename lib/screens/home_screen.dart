import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tap_and_go/components/sidenav_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;

  final WidgetStateProperty<Icon?> thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(
            Icons.check,
            color: Color(0xFFFFFFFF),
        );
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafafa),
      drawer: const SideNavComponent(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfafafa),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0x1a3561a8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFF274883),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()),
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000)),
                  ),
                ],
              ),
            ),
            const Text(' - '),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0x1a3561a8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.timelapse_rounded,
                      color: Color(0xFF274883),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('hh:mm a').format(DateTime.now()),
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Switch(
              thumbIcon: thumbIcon,
              activeColor: const Color(0xFF3561a8),
              value: isOnline,
              onChanged: (bool value) {
                setState(() {
                  isOnline = value;
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: [
                TextField(
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000)
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search any product here',
                  ),
                ),
                IconButton(
                    onPressed: () {},
                  color: const Color(0xFFFFFFFF),
                    icon: const Icon(Icons.search),
                )
              ],
            ),
            const Text('home_screen'),
          ],
        ),
      ),
    );
  }
}
