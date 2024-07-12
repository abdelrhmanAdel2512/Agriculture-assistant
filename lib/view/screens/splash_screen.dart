import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/routes_name.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  void onInit() {
    Timer(const Duration(seconds: 3),() {
      getStorage.read('password') != null ?Get.offAllNamed(Routes.homeScreen) : Get.offAllNamed(Routes.onboardingScreen);
  ;
    },
    );
  }
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onInit();
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/splashLogo.png' , width: 0.8 *width)),
            SizedBox(height: 0.05 *height),
            Center(child: Text('Agriculture Assistant' ,style: GoogleFonts.exo(fontWeight: FontWeight.w500,fontSize: 30),),)
          ],
        ),
      ),
    );
  }
}
