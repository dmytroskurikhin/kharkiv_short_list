import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  //We need this chunk for possibility to change color in 'location_detail.dart'
  final String _title;
  final String _body;
  const TextSection(this._title, this._body, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              _title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            )),
        Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              _body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )),
      ],
    );
  }
}
