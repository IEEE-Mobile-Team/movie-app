// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie_app/Auth/signup.dart';
import 'package:movie_app/Auth/verifyemail.dart';
import 'package:movie_app/Constants/app_consts.dart';
import 'package:movie_app/Constants/constant.dart';
import 'package:firebase_auth/Firebase_auth.dart';
import '../Widgets/SnackBar.dart';
import '../Widgets/navBar.dart';
import '../main.dart';
import 'forgotpassword.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _HomescreenState();
}

class _HomescreenState extends State<Signin> {
  bool isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong!"));
          } else if (snapshot.hasData) {
            return const EmailVerify();
          } else {
            return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [background_color, button_color])),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Text("Sign In",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: mPrimaryColor,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 8.0, left: 50.0),
                                child: Row(
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: mPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: form_color,
                                elevation: 8.0,
                                shadowColor: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Container(
                                    color: form_color,
                                    width: 300,
                                    child: TextField(
                                      controller: emailController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(Icons.email_outlined,
                                              color: mPrimaryColor),
                                          hintText: "Enter Your Email",
                                          hintStyle:
                                              TextStyle(color: formtext_color)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 8.0, left: 50.0),
                                child: Row(
                                  children: [
                                    Text("Password",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: mPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                color: form_color,
                                elevation: 8.0,
                                shadowColor: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Container(
                                    color: form_color,
                                    width: 300,
                                    child: TextField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(Icons.vpn_key_outlined,
                                              color: mPrimaryColor),
                                          hintText: "*******",
                                          hintStyle:
                                              TextStyle(color: formtext_color)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 55.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgotPassword()));
                                      },
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: mPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: ElevatedButton(
                                  onPressed: signIn,
                                  style: ElevatedButton.styleFrom(
                                    primary: button_color,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('LOGIN',
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
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text("-OR-",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: mPrimaryColor,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text("Sign in with",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: mPrimaryColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        child: Image.asset(
                                            "assets/icons/facebook.png",
                                            width: 50)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: GestureDetector(
                                        child: Image.asset(
                                            "assets/icons/google.png",
                                            width: 50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account? ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: mPrimaryColor,
                                            fontWeight: FontWeight.w400)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Signup()));
                                      },
                                      child: Text("Sign Up",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: mPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )));
          }
        },
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(color: button_color),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // void _launchFacebook() async {
  //   const url = 'https://facebook.com/login';
  //   if (!await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: true,
  //       enableJavaScript: true,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // void _launchGoogle() async {
  //   const url = 'https://accounts.google.com/servicelogin';
  //   if (!await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: true,
  //       forceWebView: true,
  //       enableJavaScript: true,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}
