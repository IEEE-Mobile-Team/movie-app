import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';
import 'package:movie_app/Pages/profile.dart';

import 'Pages/movies.dart';
import 'Pages/shows.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Netflix",
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}
