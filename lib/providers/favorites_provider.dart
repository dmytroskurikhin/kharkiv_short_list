import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location.dart';

class FavoriteLocationsNotifier extends StateNotifier<List<Location>> {
  FavoriteLocationsNotifier() : super([]);

  //*bool because we want return for changing status of star icon
  bool toggleLocationFavoriteStatus(Location location) {
    final locationIsFavorite = state.contains(location);
    if (locationIsFavorite) {
      //if location already favorite we should remove it
      state = state.where((item) => item.id != location.id).toList();
      return false;
    }
    //if location isnt favorite we should add to list with spread operator
    else {
      state = [...state, location];
      return true;
    }
  }
}

final favoriteLocationsProvider =
    StateNotifierProvider<FavoriteLocationsNotifier, List<Location>>((ref) {
  return FavoriteLocationsNotifier();
});

/*void _toggleLocationFavoriteStatus(Location location) {
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
  }*/
