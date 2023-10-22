import 'package:flutter/material.dart';

class MyGradients {
  static Gradient redGradient = LinearGradient(
    colors: [
      Color(0xFFFF3131).withOpacity(0.3), // Şeffaflık eklenen kısım
      Color(0xFFFF914d).withOpacity(0.3), // Şeffaflık eklenen kısım
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static Gradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF004AAD).withOpacity(0.6),
      Color(0xFFCB6CE6).withOpacity(0.6),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
