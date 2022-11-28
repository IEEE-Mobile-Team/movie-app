import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/trending_movies_data.dart';
import 'package:http/http.dart' as http;

import 'card.dart';

class Trending_Movies extends StatefulWidget {
  const Trending_Movies({Key? key}) : super(key: key);

  @override
  State<Trending_Movies> createState() => _Trending_MoviesState();
}

class _Trending_MoviesState extends State<Trending_Movies> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    recieve();
  }

  recieve() async {
    movies = await fetchData();
    if(movies != null){
      setState(() {
        moviesLoaded = true;
      });
    }
  }

  Future<List<Result>?> fetchData() async{
    var client = http.Client();
    var uri = Uri.parse("https://api.themoviedb.org/3/trending/movie/day?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff");
    var response = await client.get(uri);
    if(response.statusCode == 200) {
      return moviesFromJson(response.body).results;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: moviesLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: SizedBox(
        height: 375,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: movies!.length,
          itemBuilder: (context, index) {
            return CardView.getCard(movies![index].posterPath, movies![index].title);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20,),
        ),
      ),
    );
  }
}
