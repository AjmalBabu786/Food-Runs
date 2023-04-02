import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/domain/burgerModal.dart';

import '../../../core/colours/colours.dart';

class BurgerScreen extends StatelessWidget {
  BurgerScreen({super.key});
  TextEditingController ratingTextController = TextEditingController();
  TextEditingController BurgerNameTextController = TextEditingController();
  TextEditingController DetailsTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Burgers",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: Image.asset("asset/offer 1.jpg"),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 10,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Add Offer"))),
                ],
              ),
              TextField(
                controller: ratingTextController,
                cursorColor: mBlack,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mtextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: mBlack),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mBlack),
                  ),
                  hintText: 'raiting ',
                ),
              ),
              mHsize10,
              TextField(
                controller: BurgerNameTextController,
                cursorColor: mBlack,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mtextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: mBlack),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mBlack),
                  ),
                  hintText: 'Head Name',
                ),
              ),
              mHsize10,
              TextField(
                controller: DetailsTextController,
                cursorColor: mBlack,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mtextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: mBlack),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mBlack),
                  ),
                  hintText: 'Details ',
                ),
              ),
              mHsize10,
              TextField(
                controller: priceTextController,
                cursorColor: mBlack,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mtextfield,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: mBlack),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: mBlack),
                  ),
                  hintText: 'price ',
                ),
              ),
              mHsize10,
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        BurgerModal.createBurger(
                          rating: int.parse(ratingTextController.text),
                          BurgerName: BurgerNameTextController.text.toString(),
                          Details: DetailsTextController.text.toString(),
                          price: int.parse(priceTextController.text),
                        );

                        ratingTextController.clear();
                        DetailsTextController.clear();
                        priceTextController.clear();
                        BurgerNameTextController.clear();
                      },
                      child: Text("Add")))
            ],
          ),
        ),
      ),
    );
  }
}
