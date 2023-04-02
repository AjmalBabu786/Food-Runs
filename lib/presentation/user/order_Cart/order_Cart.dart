import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/addToCart.dart';
import 'package:food_runs/presentation/user/order_Details/order_Details.dart';

class Order_Cart_Screen extends StatelessWidget {
  Order_Cart_Screen({
    super.key,
  });

  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<AddToCartFB>>(
            future: AddToCartFB.showCart(
                email: FirebaseAuth.instance.currentUser!.email!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Error"));
              } else if (snapshot.hasData) {
                final cartList = snapshot.data;
                //total amount funmction//
                int totalAmount() {
                  for (var item in cartList!) {
                    sum = sum + item.price;
                  }
                  return sum;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mBlurRed,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    mHsize20,
                    const Text(
                      "Order Details",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartList!.length,
                        itemBuilder: (context, index) {
                          final data = cartList[index];

                          return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: mContwhite),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10),
                                          child: Image.asset(
                                            "asset/detail burger.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      msize20,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.prodectName,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("Pizza Hut",
                                              style: TextStyle(
                                                  fontSize: 12, color: mGrey)),
                                          Text(data.price.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: mRed)),
                                        ],
                                      ),
                                      msize30,
                                      Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: mBlurRed,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                                child: Text("-",
                                                    style: TextStyle(
                                                        fontSize: 20))),
                                          ),
                                          msize10,
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: mWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                                child: Text("1",
                                                    style: TextStyle(
                                                        fontSize: 20))),
                                          ),
                                          msize10,
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: mBlurRed,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "+",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: mRed, borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(
                                  color: mWhite,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                totalAmount().toString(),
                                style: TextStyle(
                                  color: mWhite,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          priceContainerText(
                              priceText: "Delivery Charge", price: "₹ 10"),
                          priceContainerText(
                              priceText: "Discount", price: "₹ 5"),
                          mHsize20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: mWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                totalAmount().toString(),
                                style: TextStyle(
                                    color: mWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          mHsize10,
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetails_Screen(),
                                  ));
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: mWhite,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                "Place My Order",
                                style: TextStyle(
                                    color: mBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: Text("Cart is empty"));
              }
            }),
      ),
    );
  }

  Row priceContainerText({required String priceText, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceText,
          style: TextStyle(
            color: mWhite,
            fontSize: 15,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: mWhite,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
