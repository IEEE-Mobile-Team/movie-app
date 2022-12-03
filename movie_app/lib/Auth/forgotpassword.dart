import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/Firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Widgets/SnackBar.dart';
import '../Constants/app_consts.dart';
import '../Constants/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                        Text("Forgot your Password?",
                            style: TextStyle(
                                fontSize: 24,
                                color: mPrimaryColor,
                                fontWeight: FontWeight.bold)),
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
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                              color: form_color,
                              width: 300,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => value != null &&
                                        !EmailValidator.validate(value)
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
                        const SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: ElevatedButton(
                            onPressed: ForgotPass,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: button_color,
                            ),
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('RESET PASSWORD',
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
                      ]),
                    ))))));
  }

  Future ForgotPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar("Password Reset Email Sent");
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
