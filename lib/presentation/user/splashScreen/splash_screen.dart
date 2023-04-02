import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_runs/presentation/user/HomeScreen/home_screen.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    nextpage(context: context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('asset/video/splash video.mp4'),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Shaz Foods',
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 38.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: const Duration(milliseconds: 1000),
                ),
              ],
              totalRepeatCount: 10,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ],
        ),
      ),
    );
  }

  nextpage({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 4));
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ));
  }
}
