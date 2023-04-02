import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_runs/core/colours/colours.dart';

class Add_Address extends StatelessWidget {
  const Add_Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mWhite,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
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
        title: Text(
          "Address",
          style: TextStyle(color: mBlack),
        ),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                    growable: true,
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 60,
                            width: double.infinity,
                            color: mContwhite,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: mBlurRed,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(Icons.location_on),
                                ),
                                msize20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text("673639,Irivetty,kavanoor"),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: mWhite,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                15)),
                                    child: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => mRed),
                                      value: "",
                                      groupValue: "",
                                      onChanged: (value) {},
                                    ))
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: mBlurRed,
                  borderRadius: BorderRadiusDirectional.circular(15)),
              child: Center(
                  child: Text(
                "Add Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
