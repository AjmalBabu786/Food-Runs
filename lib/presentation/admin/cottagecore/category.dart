import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_runs/domain/user.dart';

import '../../../core/colours/colours.dart';
import '../../../domain/category.dart';

class categoryScreen extends StatelessWidget {
  categoryScreen({super.key});
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("category"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                        onPressed: () {}, child: Text("Add category"))),
              ],
            ),
            TextField(
              controller: categoryController,
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
                hintText: 'category Name',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  CategoryModal.createCategory(
                    CategoryName: categoryController.text.trim(),
                  );
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
