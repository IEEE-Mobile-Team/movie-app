import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/app_consts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: background_color,
        body: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/profile.png'),
                  radius: 100,
                ),
              ),
            ),
            Text(
              "Signed in as",
              style: TextStyle(color: txt_color, fontSize: 40),
            ),
            Text(
              user.email!,
              style: TextStyle(color: txt_color, fontSize: 24),
            ),
            Container(
                width: 350,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat, ligula at eleifend dictum, turpis ante pellentesque metus, id aliquam nulla tellus eget urna. Mauris tristique nec nulla nec molestie. Quisque ac rutrum risus. Sed non neque vitae magna luctus semper euismod at erat. Praesent arcu lacus, cursus quis euismod vitae, varius sed velit. Integer quis enim eget libero cursus cursus. Ut viverra pellentesque dapibus.",
                  style: TextStyle(color: Colors.grey),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ElevatedButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button_color,
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LOG OUT',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: txt_color,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
