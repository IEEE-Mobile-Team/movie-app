import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/popularshows.dart';
import 'package:movie_app/servicesm/showsservice.dart';

import '../Constants/popularmovies.dart' as pop;
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


  getData() async{
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
    return Container(
      height: 60,
      width: 10000,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 6,top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  controller: myController,
                  onSubmitted: (value){
                    for(i=0; i< movies?.length ;i++){
                      if(myController.text == movies![i].title){
                        print("found");
                        //for Omar 7ot kol el details from movies hena
                        break;
                      }
                    }
                    for(x = 0; x < (shows?.length ?? 0);x++){
                      if(myController.text == shows![x].name){
                        print("found");
                        //for Omar 7ot kol el details from shows hena
                        break;
                      }
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.white,
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
    );
  }
}
