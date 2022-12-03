import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Auth/signin.dart';
import 'package:movie_app/Constants/constant.dart';
import '../Widgets/SnackBar.dart';
import '../Constants/app_consts.dart';
import '../main.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [background_color, button_color])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(children: [
                  Text("Sign Up",
                      style: TextStyle(
                          fontSize: 24,
                          color: mPrimaryColor,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 8.0, left: 50.0),
                    child: Row(
                      children: [
                        Text("Full Name",
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        color: form_color,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person_outline,
                                  color: mPrimaryColor),
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(color: formtext_color)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 8.0, left: 50.0),
                    child: Row(
                      children: [
                        Text("Phone No.",
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        color: form_color,
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.phone_iphone_rounded,
                                  color: mPrimaryColor),
                              hintText: "Enter Your Phone no.",
                              hintStyle: TextStyle(color: formtext_color)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 8.0, left: 50.0),
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        color: form_color,
                        width: 300,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && !EmailValidator.validate(value)
                                  ? "Enter a valid email"
                                  : null,
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.email_outlined,
                                  color: mPrimaryColor),
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(color: formtext_color),
                              errorStyle: TextStyle(color: txt_color)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 8.0, left: 50.0),
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        color: form_color,
                        width: 300,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? "Enter min. 6 characters"
                                  : null,
                          controller: passwordController,
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.vpn_key_outlined,
                                  color: mPrimaryColor),
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(color: formtext_color),
                              errorStyle: TextStyle(color: txt_color)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 8.0, left: 50.0),
                    child: Row(
                      children: [
                        Text("Confirm Password",
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
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
                        color: form_color,
                        width: 300,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: confirmController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.vpn_key_outlined,
                                  color: mPrimaryColor),
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: formtext_color)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button_color,
                      ),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('REGISTER',
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
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? ",
                            style: TextStyle(
                                fontSize: 18,
                                color: mPrimaryColor,
                                fontWeight: FontWeight.w400)),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()));
                          },
                          child: Text("Sign in",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: mPrimaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    if (passwordController.text.trim() == confirmController.text.trim()) {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: CircularProgressIndicator(color: button_color),
              ));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } else {
      Utils.showSnackBar("Password does not match!");
    }
  }
}
