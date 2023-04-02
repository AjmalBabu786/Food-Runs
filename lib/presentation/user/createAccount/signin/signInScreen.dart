import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/user.dart';
import 'package:food_runs/presentation/user/HomeScreen/home_screen.dart';
import 'package:food_runs/presentation/user/createAccount/login/loginScreen.dart';
import 'package:food_runs/presentation/user/createAccount/signin/widgets/signinwidgets.dart';

import '../../../../domain/loginAndSignIn/signup.dart';
import '../../bottomNavigationBar/bottomNavigatin.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log(snapshot.data.toString());
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Somthing went Wromg"));
        } else if (snapshot.hasData) {
          return BottomNavigation_Screen();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Image.asset("asset/head logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: const [
                      Text(
                        "Sign Up Now",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      mHsize10,
                      Text(
                        "Please fill the details and create account",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: mGrey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        // obscureText: true,
                        controller: nameController,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: mGrey),
                          hintText: 'Enter Name',
                          hintStyle: TextStyle(color: mGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextField(
                          controller: emailController,
                          // obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'email',
                            labelStyle: const TextStyle(color: mGrey),
                            hintText: 'Enter email',
                            hintStyle: TextStyle(color: mGrey),
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: mGrey),
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: mGrey),
                            suffixIcon:
                                const Icon(Icons.remove_red_eye_outlined)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                        child: Text(
                          "Password must atleast 6 charecter",
                          style: TextStyle(color: mGrey),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          SignUpWidget.signUp(
                            context: context,
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mRed,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?"),
                      msize10,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: mRed,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Or Connect with",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        child: Image.asset(
                      "asset/Facebookk.webp",
                      width: 50,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                          child: Image.asset(
                        "asset/twittwr.jpg",
                        width: 60,
                      )),
                    ),
                    ClipRRect(
                        child: Image.asset(
                      "asset/g2.png",
                      width: 50,
                    ))
                  ],
                )
              ],
            ),
          );
        }
      },
    )));
  }
}
