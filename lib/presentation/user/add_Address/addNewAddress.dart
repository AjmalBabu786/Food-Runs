import 'package:flutter/material.dart';

import 'package:food_runs/core/colours/colours.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Address",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headText(HeadText: "Name"),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          headText(HeadText: "Phone Number"),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headText(HeadText: "Phone Number"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ],
                ),
              ),
              msize10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headText(HeadText: "Phone Number"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding headText({required String HeadText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Text(
        HeadText,
        style:
            TextStyle(fontSize: 15, color: mBlack, fontWeight: FontWeight.bold),
      ),
    );
  }
}
