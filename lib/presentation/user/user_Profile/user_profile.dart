import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/user.dart';
import 'package:food_runs/presentation/user/createAccount/login/loginScreen.dart';

class User_profile_screen extends StatelessWidget {
  User_profile_screen({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mWhite,
        leading: Icon(
          Icons.bolt,
          size: 30,
          color: mBlack,
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 22, color: mBlack),
        ),
      ),
      body: Column(
        children: [
          mHsize20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("asset/profile.jpg"),
                    radius: 60,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: mRed,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.edit)))
                ],
              ),
            ],
          ),
          mHsize10,
          FutureBuilder<UserModal>(
              future: UserModal.showUserData(user.email!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;

                  return Column(
                    children: [
                      Text(
                        user.username,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(user.email),
                    ],
                  );
                } else {
                  return Text("User");
                }
              }),
          profileList(icon: Icons.person_outlined, text: "Edit Profile"),
          profileList(icon: Icons.location_on_rounded, text: "Address"),
          profileList(
              icon: Icons.notifications_active_outlined, text: "Notification"),
          profileList(icon: Icons.wallet, text: "Payment"),
          profileList(icon: Icons.security, text: "Security"),
          profileList(icon: Icons.language_outlined, text: "Language"),
          profileList(
              icon: Icons.lock_person_rounded, text: "Privecy & Policy"),
          profileList(icon: Icons.help, text: "Help Center"),
          profileList(icon: Icons.groups_outlined, text: "Invite Friends"),
          profileList(icon: Icons.person_outlined, text: "Edit Profile"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: mRed,
                ),
                msize30,
                GestureDetector(
                  onTap: () {
                    log("hello");
                    // showDialoguBox(context: context);
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: mRed, fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  profileList({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 30,
        width: double.infinity,
        color: mWhite,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
            ),
            msize30,
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }

  ListTile profileListTile({required String text, required IconData icon}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget showDialoguBox({required BuildContext context}) {
    return AlertDialog(
      title: const Text('Log Out'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Are you sure want to cancel booking?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }
}
