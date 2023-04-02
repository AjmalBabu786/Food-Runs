import 'package:flutter/material.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/domain/addToCart.dart';
import 'package:food_runs/presentation/user/order_Cart/order_Cart.dart';

class ProdectDetails_Screen extends StatelessWidget {
  ProdectDetails_Screen({
    super.key,
    required this.prodectName,
    required this.email,
    required this.price,
  });
  final String prodectName;
  final String email;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  prodectDetailsStack(detailsImage: "asset/detail burger.jpg"),
                  prodectDetailsStack(detailsImage: "asset/png burger.png")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: mGrey, borderRadius: BorderRadius.circular(50)),
                  ),
                  msize5,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: mRed, borderRadius: BorderRadius.circular(50)),
                  ),
                  msize5,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: mGrey, borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                      color: mBlurRed, borderRadius: BorderRadius.circular(7)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, top: 7),
                    child: Text(
                      "Popular",
                      style: TextStyle(
                          fontSize: 10,
                          color: mBlack,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: mBlurRed, borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.location_on_sharp),
                ),
                msize10,
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: mBlurRed, borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.favorite),
                )
              ],
            ),
            mHsize20,
            Text(
              "Chicken Burger\n promo pack",
              style: TextStyle(
                  color: mRed, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            mHsize20,
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: myellow,
                    ),
                    Text("4.5  Rating")
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.event_available,
                      color: mgreen,
                    ),
                    const Text("Available")
                  ],
                ),
              ],
            ),
            mHsize10,
            const Text(
              "Delicious, lip-smacking and crunchy these words will only remind you of this amazing American dish popularly known as Burger. No matter how you prepare a burger, this dish is will leave you craving for more each time you eat it you have it. So, this time when your kids want to relish something good and delicious at home.",
              style: TextStyle(fontSize: 15),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                AddToCartFB.createCart(
                    email: email, prodectName: prodectName, price: price);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Order_Cart_Screen(),
                    ));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: mRed, borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700, color: mWhite),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack prodectDetailsStack({required String detailsImage}) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                detailsImage,
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: mBlurRed, borderRadius: BorderRadius.circular(15)),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ],
    );
  }
}
