import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/details_widgets/detailsimage.dart';
import 'package:movie_app/Widgets/details_widgets/detailsinfo.dart';
import '../Constants/app_consts.dart';
import '../Widgets/details_widgets/detailscast.dart';
import '../Widgets/details_widgets/detailsrecommend.dart';

class Details extends StatefulWidget {
  Details(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.rating,
      required this.type,
      required this.adult});

  final int id;
  final String title;
  final String description;
  final String image;
  final double rating;
  final String type;
  final bool adult;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsImage(
              image: widget.image,
              adult: widget.adult,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsInfo(
                        title: widget.title,
                        description: widget.description,
                        rating: widget.rating),
                    DetailsCast(id: widget.id, type: widget.type),
                    const Divider(
                      height: 30,
                    ),
                    DetailsRecommendations(id: widget.id, type: widget.type)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
