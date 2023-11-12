import 'package:flutter/material.dart';
import '../widgets/text_section.dart';
import '../widgets/image_banner.dart';
import '../widgets/location_tile.dart';
import '../models/location.dart';

class LocationDetail extends StatelessWidget {
  const LocationDetail({super.key, required this.onToggle});

  final void Function(Location location) onToggle;
  static const routeName = '/locationDetail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Location>;
    final location = routeArgs['location'];
    return Scaffold(
      appBar: AppBar(
        title: Text(location!.name),
        actions: [
          IconButton(
            onPressed: () {
              onToggle(location);
            },
            icon: const Icon(Icons.star),
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
          ]..addAll(textSections(location)),
        ),
      ),
    );
  }

  //map will convert a list of one type to list of another type
  //here it iterates each fact in the 'facts list' and for each fact
  //we're gonna execute a single statement as denoted by this
  //that statement its goona return what's going to be pushed into
  //new list so it's gonna return a text section and we're gonna
  //implement the instantiation of our text section and the it's
  //goona return it - return 'an itarable list of stuff'
  //for transform something iterable to list we just say 'toList()'

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
