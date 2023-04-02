import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/presentation/user/HomeScreen/home_screen.dart';
import 'package:food_runs/presentation/user/createAccount/login/widgets/loginwidgets.dart';
import 'package:food_runs/presentation/user/createAccount/signin/signInScreen.dart';

import '../../../../core/colours/colours.dart';
import '../../../../domain/loginAndSignIn/login.dart';
import '../../bottomNavigationBar/bottomNavigatin.dart';
import '../forgotPassword/forgotPassword.dart';
import '../signin/widgets/signinwidgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      height: 100,
                      width: double.infinity,
                      child: Image.asset("asset/head logo.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: const [
                        Text(
                          "Log in Now",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        mHsize10,
                        Text(
                          "Please login to countinue using our app",
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? "Wnter a valid email"
                                    : null,
                            // obscureText: true,
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Email',
                              labelStyle: const TextStyle(color: mGrey),
                              hintText: 'Enter Email',
                              hintStyle: TextStyle(color: mGrey),
                            ),
                          ),
                          mHsize20,
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? "Enter min.6 Charecters"
                                    : null,
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
                          mHsize10,
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 20),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen(),
                                  )),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: mGrey, fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            log(snapshot.data.toString());
                            LoginWidgets.login(
                                formKey: formKey,
                                context: context,
                                emailController: emailController,
                                passwordController: passwordController);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => HomeScreen(),
                            //     ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mRed,
                          ),
                          child: const Text(
                            "Log in",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        msize10,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          },
                          child: Text(
                            "Sign Up",
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
      )),
    );
  }
}
