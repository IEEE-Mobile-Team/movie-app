// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:movie_app/Constants/popularshows.dart';
import 'package:movie_app/servicesm/showsservice.dart';

import '../Constants/popularmovies.dart' as pop;
import '../Pages/details.dart';
import '../servicesm/remote_servicem.dart';

class searchbar extends StatefulWidget {
  const searchbar({Key? key}) : super(key: key);

  @override
  State<searchbar> createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  var i;
  var x;
  List<pop.Result>? movies;
  List<Result>? shows;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // getShows() async{
  //   shows = await ShowService().getShows();
  //   print("da5alt");
  //   if(shows != null){
  //     print("NULAYA");
  //   }
  // }

  getData() async {
    movies = await RemoteService().getMovies();
    shows = await ShowService().getShows();
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 6, top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: myController,
                    onSubmitted: (value) {
                      for (i = 0; i < movies?.length; i++) {
                        if (myController.text == movies![i].title) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        id: movies![i].id,
                                        title: movies![i].title,
                                        description: movies![i].overview,
                                        image: movies![i].posterPath,
                                        rating: movies![i].voteAverage,
                                        type: "movie",
                                        adult: movies![i].adult,
                                      )));
                          break;
                        }
                      }
                      for (x = 0; x < (shows?.length ?? 0); x++) {
                        if (myController.text == shows![x].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        id: shows![x].id,
                                        title: shows![x].name,
                                        description: shows![x].overview,
                                        image: shows![x].posterPath,
                                        rating: shows![x].voteAverage,
                                        type: "show",
                                        adult: shows![x].adult,
                                      )));
                          break;
                        }
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
