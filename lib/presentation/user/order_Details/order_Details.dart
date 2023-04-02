import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/addToCart.dart';
import 'package:food_runs/presentation/user/add_Address/add_Address.dart';
import 'package:food_runs/presentation/user/paymentScreen/payment.dart';

class OrderDetails_Screen extends StatelessWidget {
  OrderDetails_Screen({super.key});
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          "Details",
          style: TextStyle(color: mBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: TextStyle(
                  color: mBlack, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            mHsize10,
            Container(
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
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text("673639,Irivetty,kavanoor"),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Add_Address(),
                          ));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: mWhite,
                            borderRadius: BorderRadiusDirectional.circular(15)),
                        child: Icon(Icons.edit_outlined)),
                  )
                ],
              ),
            ),
            mHsize10,
            Text(
              "Order List",
              style: TextStyle(
                  color: mBlack, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            mHsize10,
            Expanded(
              child: FutureBuilder<List<AddToCartFB>>(
                  future: AddToCartFB.showCart(
                      email: FirebaseAuth.instance.currentUser!.email!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("Error"));
                    } else if (snapshot.hasData) {
                      final orderList = snapshot.data;
                      int totalAmount() {
                        for (var item in orderList!) {
                          sum = sum + item.price;
                        }
                        return sum;
                      }

                      return ListView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  growable: true,
                                  orderList!.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          height: 100,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                                        BorderRadiusDirectional
                                                            .circular(10),
                                                    child: Image.asset(
                                                      "asset/detail burger.jpg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                msize20,
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      orderList[index]
                                                          .prodectName,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text("Pizza Hut",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: mGrey)),
                                                    Text(
                                                        orderList[index]
                                                            .price
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: mRed)),
                                                  ],
                                                ),
                                                msize40,
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Text("Quantity"),
                                                    msize10,
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: mWhite,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text("2",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20))),
                                                    ),
                                                    msize10,
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            color: mBlurRed,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      totalAmount().toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(child: Text("no Data"));
                    }
                  }),
            ),
            mHsize10,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: mRed,
                    borderRadius: BorderRadiusDirectional.circular(15)),
                child: const Center(
                    child: Text(
                  "Continue To Payment",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: mWhite),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
