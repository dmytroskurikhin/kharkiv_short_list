import '../models/location_fact.dart';

class Location {
  final int id;
  final String name;
  final String imagePath;
  final String userItinerarySummary;
  final String tourPackageName;
  final List<LocationFact> facts;

  Location({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.userItinerarySummary,
    required this.tourPackageName,
    required this.facts,
  });
}
