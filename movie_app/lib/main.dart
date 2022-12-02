import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/navBar.dart';
import 'Pages/trending.dart';

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
      home: Navbar(),
    );
  }
}
