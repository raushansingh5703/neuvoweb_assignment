import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuvoweb_assignment/utils/app_colors.dart';
import 'package:neuvoweb_assignment/view/screen/auth/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  time(){
    Timer(Duration(seconds: 2), () {
      Get.offAll(()=> UnboardingScreen());
    },);
  }
  @override
  void initState() {
    super.initState();
    time();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/app_logo.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: AppColors.primaryBlue.withOpacity(0.75),
            ),
          ),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash_bg.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
