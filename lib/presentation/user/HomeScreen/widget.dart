import 'package:flutter/material.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/presentation/user/offers/offerScreen.dart';

//*********Search text field*********//
Widget searchTextField() {
  return TextField(
    cursorColor: mBlack,
    decoration: InputDecoration(
      filled: true,
      fillColor: mtextfield,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: mBlack),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: mBlack),
      ),
      prefixIcon: const Icon(
        Icons.search,
        color: mBlack,
      ),
      hintText: 'Search',
    ),
  );
}

// *******Offer Stack********///////
Padding offerStack(
    {required String offerImage, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                offerImage,
                fit: BoxFit.fill,
              )),
          height: 150,
          width: double.infinity,
        ),
        Positioned(
          top: 90,
          right: 30,
          child: ElevatedButton(
            style:
                ButtonStyle(backgroundColor: MaterialStateProperty.all(mWhite)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OfferScreen(),
                  ));
            },
            child: Text(
              "Click Hear",
              style: TextStyle(color: mBlack),
            ),
          ),
        )
      ],
    ),
  );
}

Container dotContainer({required Color dotcolor}) {
  return Container(
    height: 10,
    width: 10,
    decoration:
        BoxDecoration(color: dotcolor, borderRadius: BorderRadius.circular(30)),
  );
}
