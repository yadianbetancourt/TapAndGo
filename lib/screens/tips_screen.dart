import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  TipsScreenState createState() => TipsScreenState();
}

class TipsScreenState extends State<TipsScreen> {
  String selectedTip = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFffffff),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tip',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1a1a1a),
              ),
            ),
            Text(
              'Your current total is \$0.00',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTipOption('15%', '0.00', selectedTip),
                buildTipOption('20%', '0.00', selectedTip),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTipOption('25%', '0.00', selectedTip),
                buildTipOption('30%', '0.00', selectedTip),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTipOption('Custom', '', selectedTip),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTip = 'No Tip';
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: selectedTip == 'No Tip'
                          ? const Color(0x1ae04661)
                          : const Color(0xFFf2f4f7),
                      border: Border.all(
                        color: selectedTip == 'No Tip'
                            ? const Color(0xFFe04661)
                            : const Color(0xFFcccccc),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Tip',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: selectedTip == 'No Tip'
                                ? const Color(0xFFe04661)
                                : const Color(0xFF1a1a1a),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            IconButton(
              onPressed: selectedTip != ''
                  ? () {
                      Navigator.of(context).pop();
                    }
                  : null,
              disabledColor: const Color(0xFFf2f4f7),
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0x1a25a978)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  fixedSize: WidgetStateProperty.all<Size>(const Size(50, 50))),
              icon: const Icon(
                Symbols.check,
                color: Color(0xFF25a978),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTipOption(String percentage, String? amount, String selected) {
    bool isSelected = percentage == selected;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTip = percentage;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1a25a978) : const Color(0xFFf2f4f7),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF25a978) : const Color(0xFFcccccc),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              percentage,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? const Color(0xFF25a978)
                    : const Color(0xFF1a1a1a),
              ),
            ),
            if (amount != '')
              Text(
                '(\$$amount)',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFF25a978)
                      : const Color(0xFF1a1a1a),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
