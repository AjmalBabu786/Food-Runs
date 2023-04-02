import 'package:flutter/material.dart';

import 'package:food_runs/core/colours/colours.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mWhite,
        title: const Text(
          "Special Offers",
          style: TextStyle(color: mBlack),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (150 / 180),
                  crossAxisCount: 2,
                  children: List.generate(
                    15,
                    (index) => Container(
                      decoration:
                          const BoxDecoration(color: mWhite, boxShadow: [
                        BoxShadow(
                          color: mGrey,
                          blurRadius: 10,
                        ),
                      ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.star_rate,
                                  color: myellow,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text("4.5"),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            color: mWhite,
                            child: Image.asset("asset/png burger.png"),
                          ),
                          const Text(
                            'Chicken burger',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                                "100 gm chicken + tomato + cheese lettuce"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "₹ 200",
                                  style: TextStyle(
                                      color: mRed, fontWeight: FontWeight.w900),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("25%"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
