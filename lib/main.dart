import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/tabs.dart';
import 'screens/locations.dart';
import 'screens/location_detail.dart';
import './models/location.dart';

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

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Location> _favoriteLocations = [];
  void _toggleLocationFavoriteStatus(Location location) {
    final isExisting = _favoriteLocations.contains(location);
    if (isExisting) {
      setState(() {
        _favoriteLocations.remove(location);
      });
    } else {
      setState(() {
        _favoriteLocations.add(location);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: '/tabs',
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(
              onToggleFavorite: _toggleLocationFavoriteStatus,
              favoriteLocation: _favoriteLocations,
            ),
        Locations.routeName: (context) => Locations(
              availibleLocations: [],
              onToggleFavorite: _toggleLocationFavoriteStatus,
            ),
        LocationDetail.routeName: (context) => LocationDetail(
              onToggle: _toggleLocationFavoriteStatus,
            ),
      },
    );
  }
}
