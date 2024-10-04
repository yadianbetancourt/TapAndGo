import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({super.key});

  @override
  AppBarComponentState createState() => AppBarComponentState();
}

class AppBarComponentState extends State<AppBarComponent> {
  final WidgetStateProperty<Icon?> _thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(
          Icons.delete_rounded,
          color: Color(0xFFFFFFFF),
        );
      }
      return const Icon(Icons.check_rounded);
    },
  );
  bool deleteOrder = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf2f4f7),
      padding: const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF3561a8),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Transform.scale(
            scale: 1.5,
            child: Switch(
              thumbIcon: _thumbIcon,
              activeColor: const Color(0xFFe04661),
              value: deleteOrder,
              onChanged: (bool value) {
                setState(() {
                  deleteOrder = value;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
