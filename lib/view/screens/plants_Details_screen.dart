import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/routes_name.dart';

import '../../constants/Health_name.dart';
import '../../constants/colors.dart';
import '../../controller/details_controller.dart';

class PlantsDetailsScreen extends StatelessWidget {
  PlantsDetailsScreen({super.key});

  DetailsController detailsController =
      Get.put<DetailsController>(DetailsController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Plant Details',
          style: GoogleFonts.exo(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                        child: Container(
                            height: 0.25 * height,
                            child:
                            Image.network(
                                '${detailsController.diseaseData.firebaseLink}')
                        ))),
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Position :',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  Text(
                    '${detailsController.diseaseData.location}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 0.03 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'created at :',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  Text(
                    '${detailsController.diseaseData.timestamp}',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailsController.diseaseData.diseaseName ==
                                    HealthName.potatoHealth ||
                                detailsController.diseaseData.diseaseName ==
                                    HealthName.tomatoHealth
                            ? 'Health :'
                            : 'Disease :',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            color: Colors.red),
                      ),
                      SizedBox(height: 0.01 * height),
                      SizedBox(
                          child: Text(
                        '${detailsController.diseaseData.diseaseName}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Colors.green),
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'confidence :',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    '${detailsController.diseaseData.confidence != null ? (double.parse(detailsController.diseaseData.confidence!) * 100).toStringAsFixed(2) : 0} %',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 0.05 * height,
              ),
              detailsController.diseaseData.diseaseName ==
                          HealthName.potatoHealth ||
                      detailsController.diseaseData.diseaseName ==
                          HealthName.tomatoHealth
                  ? SizedBox()
                  : InkWell(
                      onTap: () => Get.toNamed(Routes.diseaseDetailsScreen),
                      child: Container(
                        width: 0.4 * width,
                        height: 0.05 * height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColM.buttonColor,
                        ),
                        child: Center(
                            child: Text(
                          'More details',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
              SizedBox(
                height: 0.02 * height,
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              detailsController.diseaseData.diseaseName ==
                          HealthName.potatoHealth ||
                      detailsController.diseaseData.diseaseName ==
                          HealthName.tomatoHealth
                  ? SizedBox()
                  : InkWell(
                      onTap: () => Get.toNamed(Routes.treatmentDetailsScreen),
                      child: Container(
                        width: 0.4 * width,
                        height: 0.05 * height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColM.buttonColor,
                        ),
                        child: Center(
                            child: Text(
                          'Treatment details',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
