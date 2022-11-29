import 'package:flutter/material.dart';

import '../../Constants/app_consts.dart';

var baseURL = 'https://image.tmdb.org/t/p/w500';

class RecommendationsCard extends StatelessWidget {
  const RecommendationsCard(
      {super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (image != "Null") {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                baseURL + image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: 200,
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: txt_color),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      );
    } else {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(height: 300, width: 200, color: background_color),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: 200,
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: txt_color),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      );
    }
  }
}
