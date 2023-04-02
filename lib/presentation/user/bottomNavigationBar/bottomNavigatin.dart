import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_runs/core/colours/colours.dart';
import 'package:food_runs/presentation/user/HomeScreen/home_screen.dart';
import 'package:food_runs/presentation/user/add_Address/add_Address.dart';
import 'package:food_runs/presentation/user/message/message.dart';
import 'package:food_runs/presentation/user/notification/notification.dart';
import 'package:food_runs/presentation/user/order_Cart/order_Cart.dart';

class BottomNavigation_Screen extends StatelessWidget {
  BottomNavigation_Screen({super.key});
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    List bottompages = [
      HomeScreen(),
      Order_Cart_Screen(
          // email: FirebaseAuth.instance.currentUser!.email!
          ),
      MessageScreen(),
      Notification_Screen()
    ];

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, index, _) {
          return bottompages[selectedIndex.value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, index, _) {
          return BottomNavigationBar(
            onTap: (value) {
              selectedIndex.value = value;
            },
            selectedItemColor: mRed,
            currentIndex: selectedIndex.value,
            unselectedItemColor: mBlack,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_travel),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_sharp),
                label: 'Notification',
              ),
            ],
          );
        },
      ),
    );
  }
}
