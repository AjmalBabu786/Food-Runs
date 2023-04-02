import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/presentation/admin/burger/burger.dart';
import 'package:food_runs/presentation/admin/homeScreen.dart/homeScreen.dart';
import 'package:food_runs/presentation/user/HomeScreen/home_screen.dart';
import 'package:food_runs/presentation/user/bottomNavigationBar/bottomNavigatin.dart';
import 'package:food_runs/presentation/user/createAccount/forgotPassword/forgotPassword.dart';
import 'package:food_runs/presentation/user/createAccount/login/widgets/loginwidgets.dart';
import 'package:food_runs/presentation/user/createAccount/welcome/welcomeScreen.dart';
import 'package:food_runs/presentation/user/paymentScreen/payment.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen());
  }
}
