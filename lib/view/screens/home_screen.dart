import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/routes_name.dart';
import 'package:graduation_project/main.dart';

import '../../constants/colors.dart';
import '../../controller/planet_controller.dart';
import '../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PlanetController plantController =
      Get.put<PlanetController>(PlanetController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.exo(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.loginScreen);
                getStorage.erase();
              },
              icon: Icon(Icons.login_outlined))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child:
                      Image.asset(Assets.imagesSplashLogo, width: 0.4 * width)),
              Center(
                  child: Text(
                'Agriculture Assistant',
                style:
                    GoogleFonts.exo(fontSize: 25, fontWeight: FontWeight.w500),
              )),
              SizedBox(height: 0.1 * height),
              InkWell(
                onTap: () {
                  if (plantController.planet.value.data != null) {
                    Get.toNamed(Routes.allPlantScreen);
                  }else{
                    Get.snackbar('Error', 'no connection');
                  }
                },
                child: Center(
                  child: Container(
                      height: 0.1 * height,
                      decoration: BoxDecoration(
                        color: ColM.buttonColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'All plants',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      ))),
                ),
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              InkWell(
                onTap: () async {
                  if (plantController.planet.value.data != null) {
                    Get.toNamed(Routes.healthPlantsScreen);
                    await plantController.getAllPlanet();
                  }else{
                    Get.snackbar('Error', 'no connection');
                  }
                },
                child: Container(
                    height: 0.1 * height,
                    decoration: BoxDecoration(
                      color: ColM.buttonColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Healthy plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ))),
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              InkWell(
                onTap: () async {
                  if (plantController.planet.value.data != null) {
                    Get.toNamed(Routes.sickPlantsScreen);
                    await plantController.getAllPlanet();
                  }else{
                    Get.snackbar('Error', 'no connection');
                  }


                },
                child: Container(
                    height: 0.1 * height,
                    decoration: BoxDecoration(
                      color: ColM.buttonColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      'Sick plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
