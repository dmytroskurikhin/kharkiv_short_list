import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';
import '../widgets/text_section.dart';
import '../widgets/image_banner.dart';
import '../widgets/location_tile.dart';
import '../models/location.dart';

class LocationDetail extends ConsumerWidget {
  const LocationDetail({super.key, required this.location});
  final Location location;

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteLocations = ref.watch(favoriteLocationsProvider);
    bool isFavorite = favoriteLocations.contains(location);
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteLocationsProvider.notifier)
                  .toggleLocationFavoriteStatus(location);
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(assetPath: location.imagePath),
            Padding(
              padding: const EdgeInsets.all(16),
              child: LocationTile(location: location),
            ),
            ...textSections(location),
          ],
        ),
      ),
    );
  }
}
  //map will convert a list of one type to list of another type
  //here it iterates each fact in the 'facts list' and for each fact
  //we're gonna execute a single statement as denoted by this
  //that statement its goona return what's going to be pushed into
  //new list so it's gonna return a text section and we're gonna
  //implement the instantiation of our text section and the it's
  //goona return it - return 'an itarable list of stuff'
  //for transform something iterable to list we just say 'toList()'