// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie_app/Constants/trending_shows_data.dart';
import 'package:http/http.dart' as http;

import '../../Pages/details.dart';
import 'card.dart';

class Trending_Shows extends StatefulWidget {
  const Trending_Shows({Key? key}) : super(key: key);

  @override
  State<Trending_Shows> createState() => _Trending_ShowsState();
}

class _Trending_ShowsState extends State<Trending_Shows> {
  @override
  void initState() {
    super.initState();

    recieve();
  }

  recieve() async {
    shows = await fetchData();
    if (shows != null) {
      setState(() {
        showsLoaded = true;
      });
    }
  }

  Future<List<Result>?> fetchData() async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://api.themoviedb.org/3/trending/tv/day?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return showsFromJson(response.body).results;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showsLoaded,
      replacement: const SizedBox(
          height: 350, child: Center(child: CircularProgressIndicator())),
      child: SizedBox(
        height: 370,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: shows?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  id: shows![index].id,
                                  title: shows![index].name,
                                  description: shows![index].overview,
                                  image: shows![index].posterPath,
                                  rating: shows![index].voteAverage,
                                  type: "show",
                                  adult: shows![index].adult,
                                )));
                  });
                },
                child: CardView.getCard(
                    shows![index].posterPath, shows![index].name));
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
        ),
      ),
    );
  }
}
