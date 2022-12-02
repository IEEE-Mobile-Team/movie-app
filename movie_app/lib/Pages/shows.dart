import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';
import 'package:movie_app/Constants/shows_services.dart';

import '../Constants/popular_shows.dart';

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

   getData() async{
    popShows = await ShowsServices().getPopShows();
    if(popShows != null){
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
            Text("Popular Shows", style: TextStyle(color: txt_color, fontSize: 20)),
            Visibility(
              visible: isLoaded,
              child: Container(
                width: double.infinity,
                height: 900,
                child: ListView.builder( itemCount: popShows?.results.length,scrollDirection: Axis.vertical, itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children:[
                        Image.network('https://image.tmdb.org/t/p/w500'+popShows!.results[index].posterPath.toString(), width: 100,),
                        Column(
                            children:[
                              Container(
                                width: 290,
                                  padding: EdgeInsets.only(bottom: 20, left: 20),
                                  child: Text(popShows!.results[index].name, style: TextStyle(color: txt_color, fontSize: 20, fontWeight: FontWeight.w500), maxLines: 1,)),
                              Container(
                                width: 290,
                                  padding: EdgeInsets.only(bottom: 20, left: 20),
                                  child: Text(popShows!.results[index].overview.toString(), style: TextStyle(color: Colors.grey), maxLines:  5)
                              )

                            ] )
                      ] ,
                    ),
                  );
                }),
              ),
              replacement: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
