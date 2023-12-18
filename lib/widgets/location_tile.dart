import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          Text(
            location.summary.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.red),
          ),
          Text(
            location.tourPackageName.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
