import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/burgerModal.dart';
import 'package:food_runs/presentation/user/HomeScreen/widget.dart';
import 'package:food_runs/presentation/user/add_Address/add_Address.dart';
import 'package:food_runs/presentation/user/notification/notification.dart';
import 'package:food_runs/presentation/user/prodectDetails/prodectDetails.dart';
import 'package:food_runs/presentation/user/user_Profile/user_profile.dart';

import '../../../domain/addToCart.dart';
import '../../../domain/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mWhite,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: mBlack,
            )),
        title: const Text(
          "Home",
          style: TextStyle(color: mBlack, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => User_profile_screen(),
                    ));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("asset/profile.jpg"),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchTextField(),
          ),
          SizedBox(
            height: 150,
            child: PageView(
              children: [
                offerStack(offerImage: "asset/burger.jpg", context: context),
                offerStack(offerImage: "asset/offer3.jpg", context: context),
                offerStack(offerImage: "asset/offer2.jpg", context: context),
                offerStack(offerImage: "asset/offer 1.jpg", context: context),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dotContainer(dotcolor: mGrey),
              msize5,
              dotContainer(dotcolor: mRed),
              msize5,
              dotContainer(dotcolor: mGrey),
            ],
          ),
          SizedBox(
            height: 50,
            child: StreamBuilder<List<CategoryModal>>(
                stream: CategoryModal.showCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("error"));
                  } else if (snapshot.hasData) {
                    final categoryList = snapshot.data;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList!.length,
                      itemBuilder: (context, index) {
                        final category = categoryList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mWhite,
                                border: Border.all(color: mRed)),
                            height: 40,
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      "asset/—Pngtree—burger vector illustration with filled_5225334.png"),
                                ),
                                Text(category.category)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("Not Avialable");
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Burger",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Container(
                    height: 20,
                    width: 70,
                    color: mBlurRed,
                    child: Center(child: Text("See More")))
              ],
            ),
          ),
          SizedBox(
            height: 260,
            width: 100,
            child: StreamBuilder<List<BurgerModal>>(
                stream: BurgerModal.showBurger(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    log(snapshot.hasError.toString());
                    return Center(child: Text("Error"));
                  } else if (snapshot.hasData) {
                    final prodectList = snapshot.data;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prodectList!.length,
                      itemBuilder: (context, index) {
                        final burger = prodectList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProdectDetails_Screen(
                                      email: FirebaseAuth
                                          .instance.currentUser!.email!,
                                      price: burger.price,
                                      prodectName: burger.BurgerName,
                                    ),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: mWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: mGrey,
                                      blurRadius: 10,
                                    ),
                                  ]),
                              height: 200,
                              width: 150,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.star_rate,
                                          color: myellow,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(burger.rating.toString()),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: mWhite,
                                    child: Image.asset("asset/png burger.png"),
                                  ),
                                  Text(
                                    burger.BurgerName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(burger.Details),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          burger.price.toString(),
                                          style: TextStyle(
                                              color: mRed,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              AddToCartFB.createCart(
                                                  email: FirebaseAuth.instance
                                                      .currentUser!.email!,
                                                  prodectName:
                                                      burger.BurgerName,
                                                  price: burger.price);
                                            },
                                            icon: const Icon(
                                              Icons.add_circle,
                                              color: mRed,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("NoData");
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Meal Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Container(
                    height: 20,
                    width: 70,
                    color: mBlurRed,
                    child: Center(child: Text("See More")))
              ],
            ),
          ),
          SizedBox(
            height: 260,
            width: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: mWhite, boxShadow: [
                      BoxShadow(
                        color: mGrey,
                        blurRadius: 10,
                      ),
                    ]),
                    height: 200,
                    width: 150,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
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
                          child: Image.asset("asset/popular meals.png"),
                        ),
                        const Text(
                          'Chicken burger',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child:
                              Text("100 gm chicken + tomato + cheese lettuce"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "₹ 200",
                                style: TextStyle(
                                    color: mRed, fontWeight: FontWeight.w900),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: mRed,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
