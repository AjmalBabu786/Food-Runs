import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/presentation/user/createAccount/login/widgets/loginwidgets.dart';

class ResetPassword {
  static Future resetPassword(
      {required BuildContext context,
      required TextEditingController resetTextController}) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetTextController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
