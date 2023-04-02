import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/presentation/user/createAccount/forgotPassword/widgets/forgetPassWidgets.dart';
import 'package:food_runs/presentation/user/createAccount/login/loginScreen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mWhite,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '''Forgot \nPassword?''',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Image.asset(
                    "asset/emailSend.png",
                    height: 200,
                  ),
                ),
                mHsize20,
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          '''Enter the email associated\nwith your account''',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ResetPassword.resetPassword(
                                    context: context,
                                    resetTextController: emailController);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mRed,
                                    borderRadius: BorderRadius.circular(50)),
                                height: 60,
                                width: 90,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
