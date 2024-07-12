import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/constants/routes_name.dart';

import 'package:graduation_project/view/screens/plants_Details_screen.dart';
import 'package:graduation_project/view/screens/all_plant_screen.dart';
import 'package:graduation_project/view/screens/disease_screen.dart';
import 'package:graduation_project/view/screens/healthy_plants_screen.dart';
import 'package:graduation_project/view/screens/home_screen.dart';
import 'package:graduation_project/view/screens/login_screen.dart';
import 'package:graduation_project/view/screens/onboarding_screen.dart';
import 'package:graduation_project/view/screens/register_screen.dart';
import 'package:graduation_project/view/screens/sick_plants_screen.dart';
import 'package:graduation_project/view/screens/splash_screen.dart';
import 'package:graduation_project/view/screens/treatment_screen.dart';
final getStorage =  GetStorage();

void main()async{
  await GetStorage.init();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(

        primaryColor:  const Color(0xffADFB00),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)


        ),


      ) ,
      initialRoute:Routes.splashScreen,
      getPages: [
        GetPage(name: Routes.splashScreen, page: () =>  const SplashScreen()),
        GetPage(name: Routes.onboardingScreen, page: () =>  const OnboardingScreen()),
        GetPage(name: Routes.registerScreen, page: () =>   RegisterScreen()),
        GetPage(name: Routes.loginScreen, page: () =>   LoginScreen()),
        GetPage(name: Routes.homeScreen, page: () =>   HomeScreen()),
        GetPage(name: Routes.sickPlantsScreen, page: () =>   SickPlantsScreen()),
        GetPage(name: Routes.healthPlantsScreen, page: () =>   HealthPlantsScreen()),

        GetPage(name: Routes.sickPlantsDetails, page: () =>   PlantsDetailsScreen()),
        GetPage(name: Routes.treatmentDetailsScreen, page: () =>   TreatmentDetailsScreen()),
        GetPage(name: Routes.diseaseDetailsScreen, page: () =>   DiseaseDetailsScreen()),
        GetPage(name: Routes.allPlantScreen, page: () =>   AllPlantScreen()),
      ],

    );
  }
}
