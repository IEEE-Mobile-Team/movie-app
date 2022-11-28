import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/trending_shows_data.dart';
import 'package:http/http.dart' as http;

import 'card.dart';

class Trending_Shows extends StatefulWidget {
  const Trending_Shows({Key? key}) : super(key: key);

  @override
  State<Trending_Shows> createState() => _Trending_ShowsState();
}

class _Trending_ShowsState extends State<Trending_Shows> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    recieve();
  }

  recieve() async {
    shows = await fetchData();
    if(shows != null){
      setState(() {
        showsLoaded = true;
      });
    }
  }

  Future<List<Result>?> fetchData() async{
    var client = http.Client();
    var uri = Uri.parse("https://api.themoviedb.org/3/trending/tv/day?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff");
    var response = await client.get(uri);
    if(response.statusCode == 200){
      return showsFromJson(response.body).results;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showsLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: SizedBox(
        height: 370,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: shows!.length,
          itemBuilder: (context, index) {
            return CardView.getCard(shows![index].posterPath,shows![index].name);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15,),
        ),
      ),
    );
  }
}
