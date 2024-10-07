import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/stats_screen.dart';

class SideNavComponent extends StatefulWidget {
  const SideNavComponent({super.key});

  @override
  SideNavComponentState createState() => SideNavComponentState();
}

class SideNavComponentState extends State<SideNavComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: const Color(0xFFFFFFFF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Color(0xFF25a978),
                  Color(0xFF5bc4e2),
                  Color(0xFF3561a8),
                  Color(0xFFe04661),
                  Color(0xFFf58435),
                  Color(0xFFffba3b),
                ],
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/rounded_icon.png'),
                ),
                Text(
                  'Tap&Go!',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Color(0xFF25a978),
                        Color(0xFF5bc4e2),
                        Color(0xFF3561a8),
                        Color(0xFFe04661),
                        Color(0xFFf58435),
                        Color(0xFFffba3b),
                      ],
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.dashboard,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Dashboard',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.auto_graph_rounded,
                    color: Color(0xFFafa1a1),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Statistics',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.receipt_long_outlined,
                    color: Color(0xFFafa1a1),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Receipts',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
