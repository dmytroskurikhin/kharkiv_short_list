import '../models/location_fact.dart';

class Location {
  Location({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.summary,
    required this.tourPackageName,
    required this.facts
  });
  final int id;
  final String name;
  final String imagePath;
  final String summary;
  final String tourPackageName;
  final List<LocationFact> facts;
}
