import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/colours/colours.dart';

class AdmOffersScrren extends StatelessWidget {
  const AdmOffersScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Your Offer",
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
            TextField(
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
                hintText: 'offer % ',
              ),
            ),
            mHsize10,
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text("Add")))
          ],
        ),
      ),
    );
  }
}
