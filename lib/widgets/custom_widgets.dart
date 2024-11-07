import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget titleText(BuildContext context, String text) {
  final TextStyle themeStyle =
      Theme.of(context).textTheme.titleLarge ?? const TextStyle();
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle:
              themeStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 22)));
}

// Custom text widget function
Widget bText(BuildContext context, String text) {
  // Get the current theme's text style for bodyLarge
  final TextStyle themeStyle =
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();

  // Combine GoogleFonts with theme text style
  return Text(
    text,
    style: GoogleFonts.poppins(
      textStyle: themeStyle.copyWith(
        // color: Colors.black, // Override color if needed
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  );
}

Widget mText(BuildContext context, String text) {
  final TextStyle themeStyle =
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();

  return Text(text,
      style: GoogleFonts.poppins(textStyle: themeStyle.copyWith(fontSize: 16)));
}

Widget m1Text(BuildContext context, String text) {
  final TextStyle themeStyle =
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
  return Text(text,
      style: GoogleFonts.poppins(
          textStyle:
              themeStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold)));
}

Widget m2Text(BuildContext context, String text) {
  final TextStyle themeStyle =
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
  return Text(text,
      style: GoogleFonts.poppins(textStyle: themeStyle.copyWith(fontSize: 12)));
}

tText(context) {
  return Text(context,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
      ));
}

pointText(context) {
  return Text(context,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 12),
      ));
}
