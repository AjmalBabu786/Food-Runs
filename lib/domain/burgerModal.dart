import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class BurgerModal {
  final int rating;
  final String BurgerName;
  final String Details;
  final int price;

  BurgerModal(
      {required this.rating,
      required this.BurgerName,
      required this.Details,
      required this.price});

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'BurgerName': BurgerName,
      'Details': Details,
      'price': price,
    };
  }

  static BurgerModal fromJson(Map<String, dynamic> json) {
    return BurgerModal(
        rating: json['rating'],
        BurgerName: json['BurgerName'],
        Details: json['Details'],
        price: json['price']);
  }

  static Future<void> createBurger(
      {required int rating,
      required String BurgerName,
      required String Details,
      required int price}) async {
    final burger = await FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc('admin')
        .collection('prodects')
        .doc(BurgerName);
    final brgr = BurgerModal(
        rating: rating, BurgerName: BurgerName, Details: Details, price: price);
    final json = brgr.toJson();
    await burger.set(json);
  }

  static Stream<List<BurgerModal>> showBurger() {
    final data = FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc('admin')
        .collection('prodects')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => BurgerModal.fromJson(doc.data()))
            .toList());
    log(data.toString());
    return data;
  }
}
