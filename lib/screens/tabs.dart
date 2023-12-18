import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/locations_provider.dart';
import '../providers/favorites_provider.dart';
import '../screens/locations.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dummyLocations = ref.watch(locationsProvider);
    final favoriteLocations = ref.watch(favoriteLocationsProvider);
    Widget activePage = Locations(
      availibleLocations: dummyLocations
    );
    var activePageTitle = 'Всі локації';

    if (_selectedPageIndex == 1) {
      activePage = Locations(
        availibleLocations: favoriteLocations,
      );
      activePageTitle = 'Вибрані локації';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Пам\'ятки'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Вибрані'),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
