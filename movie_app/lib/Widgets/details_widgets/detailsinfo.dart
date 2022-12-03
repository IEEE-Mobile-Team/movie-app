import 'package:flutter/material.dart';
import '../../Constants/app_consts.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo(
      {super.key,
      required this.title,
      required this.description,
      required this.rating});

  final String title;
  final String description;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 50,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: txt_color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 50,
        ),
        Text(
          "Overview",
          style: TextStyle(
              fontSize: 24, color: txt_color, fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 15,
        ),
        Text(
          description,
          style: TextStyle(fontSize: 24, color: txt_color),
        ),
        const Divider(
          height: 30,
        ),
        Text(
          "Rating",
          style: TextStyle(
              fontSize: 24, color: txt_color, fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 15,
        ),
        Text(
          "${rating.round()}/10",
          style: TextStyle(fontSize: 24, color: txt_color),
        ),
        const Divider(
          height: 30,
        ),
      ],
    );
  }
}
