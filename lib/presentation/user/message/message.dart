import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/core/colours/colours.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(color: mBlack),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.call,
              color: mBlack,
              size: 28,
            ),
          )
        ],
        backgroundColor: mWhite,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: mBlurRed, borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 60,
                      color: mGrey,
                      child: Center(
                          child: Text(
                        "Today",
                        style: TextStyle(color: mWhite),
                      )),
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 20,
                    width: 60,
                    child: Center(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: mGrey, borderRadius: BorderRadius.circular(8)),
                  height: 30,
                  width: 170,
                  child: Center(child: Text("Hi")),
                ),
                mHsize10,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 20,
                    width: 60,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: mBlurRed, borderRadius: BorderRadius.circular(8)),
                  height: 30,
                  width: 170,
                  child: Center(child: Text("Good Morning Ajmal Shaz")),
                ),
                mHsize10,
                Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                      color: mBlurRed, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          "I am a customer Service.is there anything i can help you with ?"),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Center(
                  child: SizedBox(
                    height: 20,
                    width: 60,
                    child: Center(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: mGrey, borderRadius: BorderRadius.circular(8)),
                  height: 30,
                  width: 170,
                  child: Center(child: Text("Good Morning Ajmal Shaz")),
                ),
                mHsize10,
                Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                      color: mGrey, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          "I am a customer Service.is there anything i can help you with ?"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ),
    );
  }
}
