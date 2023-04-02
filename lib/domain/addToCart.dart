import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddToCartFB {
  final String prodectName;
  final int price;
  AddToCartFB({
    required this.prodectName,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "prodectName": prodectName,
      "price": price,
    };
  }

  static AddToCartFB fromJson(Map<String, dynamic> json) {
    return AddToCartFB(prodectName: json['prodectName'], price: json['price']);
  }

  static Future createCart(
      {required String email,
      required String prodectName,
      required int price}) async {
    final cart = await FirebaseFirestore.instance
        .collection("FoodRuns")
        .doc("user")
        .collection("profile")
        .doc(email)
        .collection("Cart")
        .doc(prodectName);
    final crt = AddToCartFB(prodectName: prodectName, price: price);
    final json = crt.toJson();
    await cart.set(json);
  }

  static Future<List<AddToCartFB>> showCart({required String email}) async {
    final data = FirebaseFirestore.instance
        .collection("FoodRuns")
        .doc("user")
        .collection("profile")
        .doc(email)
        .collection("Cart")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddToCartFB.fromJson(doc.data()))
            .toList());
    print(data.toString());
    return data.first;
  }
}
