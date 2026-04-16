import 'package:flutter/material.dart';
import '../model/theatre_model.dart';

class InfoTile extends StatelessWidget {
  final TheatreItem item;

  const InfoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            color: Color(0xFFF5A623),
            fontWeight: FontWeight.bold,
            fontSize: 11.5,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          item.description,
          style: TextStyle(
            color: Colors.white.withAlpha(150),
            fontSize: 10,
            height: 1.4,
          ),
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}