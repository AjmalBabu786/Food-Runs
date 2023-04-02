import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/presentation/admin/cottagecore/category.dart';
import 'package:food_runs/presentation/admin/offers/offers.dart';

import '../../../core/colours/colours.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdmOffersScrren(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: Center(
                        child: const Text(
                      "Offers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return categoryScreen();
                      },
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: Center(
                        child: const Text(
                      "category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Center(
                      child: const Text(
                    "Burgers",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Center(
                      child: const Text(
                    "PopulorMeals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ),
        ]));
  }
}
