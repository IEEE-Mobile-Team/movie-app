import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/SnackBar.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Auth/signin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
