import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/tabs.dart';


void main() {
  runApp(App());
}

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.montserratTextTheme(),
);

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      
    );
  }
}
