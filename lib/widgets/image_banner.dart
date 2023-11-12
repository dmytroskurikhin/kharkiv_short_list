import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  //We need this chunk for possibility to change color in 'location_detail.dart'
  final String assetPath;
  final double height;

  const ImageBanner({super.key, required this.assetPath, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(
        height: 200.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
