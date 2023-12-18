import 'package:flutter/material.dart';
//We need this chunk for possibility to change color in 'location_detail.dart'

class ImageBanner extends StatelessWidget {
  const ImageBanner({
    super.key,
    required this.assetPath,
    this.height = 200.0,
  });

  final String assetPath;
  final double height;
  
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
