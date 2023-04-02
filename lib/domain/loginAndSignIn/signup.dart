import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/domain/user.dart';

class SignUpWidget {
  static Future signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => {
              UserModal.createUser(username: name, email: email),
            },
          );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
