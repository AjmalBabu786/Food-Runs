import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModal {
  final String category;

  CategoryModal({
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
    };
  }

  static CategoryModal fromJson(Map<String, dynamic> json) {
    return CategoryModal(
      category: json['category'],
    );
  }

  static Future<void> createCategory({
    required String CategoryName,
  }) async {
    final userDoc = FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc('admin')
        .collection('category')
        .doc();

    final user = CategoryModal(
      category: CategoryName,
    );

    final json = user.toJson();
    await userDoc.set(json);
  }

  static Stream<List<CategoryModal>> showCategory() {
    final data = FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc("admin")
        .collection("category")
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => CategoryModal.fromJson(doc.data()))
            .toList());

    return data;
  }
}
