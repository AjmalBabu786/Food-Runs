import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_runs/core/colours/colours.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: mBlack),
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Notifications",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            mHsize10,
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: mContwhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: mContwhite,
                              // borderRadius: BorderRadius.circular(130)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "asset/verified.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          msize10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your order has been taken by the driver",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              Text("10:49 pm")
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
