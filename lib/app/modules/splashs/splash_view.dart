import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showSplashScreen(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 8));
  Navigator.of(context).pushReplacementNamed(
      '/home'); 
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    showSplashScreen(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Lottie.asset(
            'assets/app_splash.json',
            width: 210,
            height: 210,
            fit: BoxFit.contain,
            repeat: true,
            reverse: false,
          ),
          const Text(
            "CookIt App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
