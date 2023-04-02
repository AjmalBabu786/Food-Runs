import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/core/colours/colours.dart';

class LoginWidgets {
  ///Log in Function///

  static Future login(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => {});
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class Utils {
  static showSnackBar(String? text) {
    final messengerKey = GlobalKey<ScaffoldMessengerState>();
    if (text == null) return;
    final snackbar = SnackBar(
      content: Text(text),
      backgroundColor: mRed,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}

/// Google Login\\\

class ClassName {}
