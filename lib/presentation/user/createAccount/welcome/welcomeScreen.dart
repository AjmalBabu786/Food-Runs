import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/presentation/user/createAccount/login/loginScreen.dart';
import 'package:food_runs/presentation/user/createAccount/signin/signInScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset("asset/head logo.png"),
            ),
            ClipRRect(
              child: Image.asset("asset/welcome.jpg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '''Create an account and access thousend 
                       of testy foods''',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500, color: mGrey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ));
                            },
                            child: const Text("Getting Started"))),
                  ),
                  mHsize10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?"),
                      msize10,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
