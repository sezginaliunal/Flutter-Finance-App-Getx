import 'package:flutter/material.dart';
import 'package:finance_app/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.poppins(
      color: ColorItems.navyBlue,
      fontWeight: FontWeight.w500,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  cardTheme: const CardTheme(),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: kTextColor,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: kTextColor, // Alt başlık metni rengi
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: kTextColor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: kTextColor,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: kTextColor, // Düğme metni rengi
    ),
  ),
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kShadowColor3,
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.poppins(
      color: ColorItems.navyBlue,
      fontWeight: FontWeight.w500,
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  cardTheme: const CardTheme(),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: kLineColor,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: kLineColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: kLineColor,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: kLineColor, // Alt başlık metni rengi
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: kLineColor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: kLineColor,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: kLineColor, // Düğme metni rengi
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.red),
);
