import 'package:flutter/material.dart';
import '../screens/location_detail.dart';
import '../models/location.dart';
import '../widgets/image_banner.dart';
import '../widgets/tile_overlay.dart';

class Locations extends StatelessWidget {
  const Locations({required this.availibleLocations, super.key});
  final List<Location> availibleLocations;

  void _onLocationTap(BuildContext context, Location location) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationDetail(
          location: location,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location),
      child: SizedBox(
        height: 200.0,
        child: Hero(
          tag: location.id,
          child: Stack(
            children: [
              ImageBanner(assetPath: location.imagePath, height: 245.0),
              TileOverlay(location),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Наразі список вибраних локацій пустий',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Спробуйте вибрати локацію!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (availibleLocations.isNotEmpty) {
      content = ListView.builder(
        itemCount: availibleLocations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, availibleLocations[index]),
      );
    }

    return Scaffold(
      body: content,
    );
  }
}
