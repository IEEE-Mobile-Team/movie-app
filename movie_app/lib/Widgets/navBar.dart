// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/Pages/movies.dart';
import 'package:movie_app/Pages/profile.dart';
import 'package:movie_app/Pages/shows.dart';
import 'package:movie_app/Pages/trending.dart';

import '../Constants/app_consts.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;
  final screens = [const Movies(), const Shows(), const Trending(), const Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: idle_color,
        selectedItemColor: active_color,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: 'Movies',
            backgroundColor: background_color,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.slideshow),
            label: 'Shows',
            backgroundColor: background_color,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.trending_up),
            label: 'Trending',
            backgroundColor: background_color,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
            backgroundColor: background_color,
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
