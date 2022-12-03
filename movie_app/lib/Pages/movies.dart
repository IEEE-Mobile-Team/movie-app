import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';
import 'package:movie_app/Constants/popularmovies.dart';
import 'package:movie_app/Widgets/searchBar.dart';
import 'package:movie_app/servicesm/remote_servicem.dart';

import 'details.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<Result>? movies;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movies = await RemoteService().getMovies();
    if (movies != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background_color,
        body: SingleChildScrollView(
          child: Visibility(
            visible: isLoaded,
            replacement: const SizedBox(
                height: 700,
                child: Center(child: CircularProgressIndicator())),
            child: Column(
              children: [
                const searchbar(),
                SizedBox(
                  width: 1000,
                  height: 575,
                  child: ListView.builder(
                      itemCount: movies?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12, right: 12, left: 12, top: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                              id: movies![index].id,
                                              title: movies![index].title,
                                              description:
                                                  movies![index].overview,
                                              image: movies![index].posterPath,
                                              rating:
                                                  movies![index].voteAverage,
                                              type: "movie",
                                              adult: movies![index].adult,
                                            )));
                              });
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${movies![index].posterPath}",
                                      width: 120,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      child: Text(movies![index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: txt_color)),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(movies![index].overview,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 15, color: txt_color)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
