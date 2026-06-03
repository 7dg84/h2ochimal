import 'package:flutter/material.dart';

class AppTheme {
  // Colores para tus degradados y componentes
  static const Color primaryBlue = Color(
    0xFF1E88E5,
  ); // Azul claro (arriba del degradado)
  static const Color secondaryBlue = Color(
    0xFF03549A,
  ); // Azul oscuro (abajo del degradado)
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color buttonWhite = Color(0xFFFFFFFF);
  static const Color backgroundNeutral = Color(
    0xFFF5F7FA,
  ); // Fondo limpio para pantallas de datos

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryBlue,

      // El fondo predeterminado ahora es neutro (para las pantallas comunes)
      //scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: secondaryBlue,
        surface: Colors.white,
      ),

      // AppBar transparente para que no corte los degradados
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textWhite),
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: textWhite,
          fontFamily: 'sans-serif',
        ),
      ),

      // Tu botón estilo "Stadium" (100% redondeado)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonWhite,
          foregroundColor: primaryBlue,
          minimumSize: const Size(280, 55),
          shape: const StadiumBorder(),
          elevation: 5,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ),

      // Inputs elegantes con fondo semi-transparente
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white30, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIconColor: Colors.white70,
      ),
    );
  }
}
