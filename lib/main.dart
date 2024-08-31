import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/home_page.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffED263A),
          onPrimary: Colors.white,
          secondary: Color(0xff3366AF),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.cantarellTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
