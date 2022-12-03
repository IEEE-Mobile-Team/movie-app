import 'package:flutter/material.dart';

import '../../Constants/app_consts.dart';

var baseURL = 'https://image.tmdb.org/t/p/w500';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, required this.image, required this.adult});

  final String image;
  final bool adult;

  @override
  Widget build(BuildContext context) {
    if (adult) {
      return Stack(
        children: [
          SizedBox(
            child: Image.network(
              baseURL + image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: background_color,
                child: IconButton(
                  color: txt_color,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: (() => Navigator.of(context).pop()),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.explicit,
                      size: 26,
                      color: txt_color,
                    ),
                  )),
            ),
          )
        ],
      );
    } else {
      return Stack(
        children: [
          SizedBox(
            child: Image.network(
              baseURL + image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: background_color,
                child: IconButton(
                  color: txt_color,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: (() => Navigator.of(context).pop()),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: background_color,
                child: IconButton(
                  color: txt_color,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: (() => Navigator.of(context).pop()),
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}
