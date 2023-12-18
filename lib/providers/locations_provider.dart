import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dummy_data.dart';

final locationsProvider = Provider((ref) {
  return dummyLocations;
});
