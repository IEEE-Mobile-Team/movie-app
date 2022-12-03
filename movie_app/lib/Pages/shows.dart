import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';
import 'package:movie_app/Constants/shows_services.dart';
import 'package:movie_app/Constants/trending_shows_data.dart';
import 'package:movie_app/Widgets/searchBar.dart';

import '../Constants/popular_shows.dart';
import 'details.dart';

class Shows extends StatefulWidget {
  const Shows({Key? key}) : super(key: key);

  @override
  State<Shows> createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  PopularTv? popShows;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    popShows = await ShowsServices().getPopShows();
    if (popShows != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const searchbar(),
            Visibility(
              visible: isLoaded,
              replacement: const SizedBox(
                  height: 700,
                  child: Center(child: CircularProgressIndicator())),
              child: SizedBox(
                width: double.infinity,
                height: 575,
                child: ListView.builder(
                    itemCount: popShows?.results.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (popShows!.results[index].posterPath.toString() !=
                          "No Poster Path") {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                              id: popShows!.results[index].id,
                                              title:
                                                  popShows!.results[index].name,
                                              description: ((popShows
                                                              ?.results[index]
                                                              .overview ??
                                                          "") ==
                                                      "")
                                                  ? "No Overview"
                                                  : (popShows!
                                                      .results[index].overview
                                                      .toString()),
                                              image: popShows!
                                                  .results[index].posterPath
                                                  .toString(),
                                              rating: popShows!
                                                  .results[index].voteAverage!
                                                  .toDouble(),
                                              type: "show",
                                              adult: popShows!
                                                  .results[index].adult,
                                            )));
                              });
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${popShows!.results[index].posterPath}',
                                    width: 120,
                                  ),
                                ),
                                Column(children: [
                                  Container(
                                      width: 230,
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 20),
                                      child: Text(
                                        popShows!.results[index].name,
                                        style: TextStyle(
                                            color: txt_color,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                      )),
                                  Container(
                                      width: 230,
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 20),
                                      child: Text(
                                          ((popShows?.results[index].overview ??
                                                      "") ==
                                                  "")
                                              ? "No Overview"
                                              : (popShows!
                                                  .results[index].overview
                                                  .toString()),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                          maxLines: 5))
                                ])
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Text("");
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
