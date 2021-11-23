import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFCFCFC),
          padding: const EdgeInsets.all(24.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SelectableText.rich(
                TextSpan(
                  text: 'Hello', // default text style
                  children: <TextSpan>[
                    TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                toolbarOptions: ToolbarOptions(),
              ),
              const SizedBox(height: 48.0),
              Column(
                children: [
                  Text(
                    'Chalk',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    runSpacing: 12.0,
                    spacing: 12.0,
                    children: const [
                      ColorPalette(color: Color(0xFFABDEE6)),
                      ColorPalette(color: Color(0xFFCBAACB)),
                      ColorPalette(color: Color(0xFFFFFFB5)),
                      ColorPalette(color: Color(0xFFFFCCB6)),
                      ColorPalette(color: Color(0xFFF3B0C3)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                children: [
                  Text(
                    'Tangerine',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    runSpacing: 12.0,
                    spacing: 12.0,
                    children: const [
                      ColorPalette(color: Color(0xFFFF968A)),
                      ColorPalette(color: Color(0xFFFFAEA5)),
                      ColorPalette(color: Color(0xFFFFC5BF)),
                      ColorPalette(color: Color(0xFFFFD8B3)),
                      ColorPalette(color: Color(0xFFFFC8A2)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                children: [
                  Text(
                    'Calm Serenity',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Wrap(
                    runSpacing: 12.0,
                    spacing: 12.0,
                    children: const [
                      ColorPalette(color: Color(0xFFD4F0F0)),
                      ColorPalette(color: Color(0xFFA2E1DB)),
                      ColorPalette(color: Color(0xFF8FCACA)),
                      ColorPalette(color: Color(0xFFCCE2CB)),
                      ColorPalette(color: Color(0xFFB6CFB6)),
                      ColorPalette(color: Color(0xFF97C1A9)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPalette extends StatelessWidget {
  final Color color;

  const ColorPalette({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 32.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
