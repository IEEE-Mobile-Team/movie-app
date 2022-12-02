import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.png'),
                radius: 100,
              ),
            ),
          ),
          Text("Mariam Ali", style: TextStyle(color: txt_color, fontSize: 40),),
          Container(
            width: 350,
          padding: EdgeInsets.only(top: 30),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat, ligula at eleifend dictum, turpis ante pellentesque metus, id aliquam nulla tellus eget urna. Mauris tristique nec nulla nec molestie. Quisque ac rutrum risus. Sed non neque vitae magna luctus semper euismod at erat. Praesent arcu lacus, cursus quis euismod vitae, varius sed velit. Integer quis enim eget libero cursus cursus. Ut viverra pellentesque dapibus.", style: TextStyle(color: Colors.grey),)
          )
        ],
      )
    );
  }
}
