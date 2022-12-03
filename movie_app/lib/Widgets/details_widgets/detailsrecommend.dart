// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Widgets/details_widgets/card.dart';
import '../../Constants/app_consts.dart';
import '../../Constants/recommendations.dart';
import '../../Pages/details.dart';

class DetailsRecommendations extends StatefulWidget {
  const DetailsRecommendations(
      {super.key, required this.id, required this.type});

  final int id;
  final String type;

  @override
  State<DetailsRecommendations> createState() =>
      _DetailsRecommendationsState(id, type);
}

class _DetailsRecommendationsState extends State<DetailsRecommendations> {
  late final int id;
  late final String type;
  _DetailsRecommendationsState(this.id, this.type);

  @override
  void initState() {
    super.initState();
    recieve();
  }

  recieve() async {
    recommendations = await fetchData();
    if (recommendations != null) {
      setState(() {
        recommendationsLoaded = true;
      });
    }
  }

  Future<List<Result>?> fetchData() async {
    var client = http.Client();
    var uri;
    if (type == "movie") {
      uri = Uri.parse(
          "https://api.themoviedb.org/3/movie/$id/recommendations?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff&language=en-US&page=1");
    } else {
      uri = Uri.parse(
          "https://api.themoviedb.org/3/tv/$id/recommendations?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff&language=en-US&page=1");
    }
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return RecommendationsFromJson(response.body).results;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommendations",
          style: TextStyle(
              fontSize: 24, color: txt_color, fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 15,
        ),
        Visibility(
          visible: recommendationsLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: SizedBox(
            height: 375,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations?.length ?? 0,
              itemBuilder: (context, index) {
                if (recommendations![index].posterPath != "Null") {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                      id: recommendations![index].id,
                                      title: recommendations![index].title,
                                      description:
                                          recommendations![index].overview,
                                      image: recommendations![index].posterPath,
                                      rating:
                                          recommendations![index].voteAverage,
                                      type:
                                          recommendations![index].mediaType,
                                          adult: recommendations![index].adult,)));
                        });
                      },
                      child: RecommendationsCard(
                          image: recommendations![index].posterPath,
                          title: recommendations![index].title));
                } else {
                  return const Text("");
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
