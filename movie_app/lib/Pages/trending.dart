import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/app_consts.dart';
import '../Widgets/trending_widgets/trending_movies.dart';
import '../Widgets/trending_widgets/trending_shows.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(side_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SearchBar(),
            const SizedBox(height: 50,),
            Text("Trending Movies", style: TextStyle(color: txt_color, fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10,),
            const Trending_Movies(),
            const SizedBox(height: 30,),
            Text("Trending Shows", style: TextStyle(color: txt_color, fontSize: 25, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Trending_Shows(),
          ],
        ),
      ),
    );
  }
}
