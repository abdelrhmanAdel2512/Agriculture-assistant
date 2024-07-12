import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/colors.dart';
import 'package:graduation_project/constants/routes_name.dart';
import 'package:graduation_project/generated/assets.dart';

import '../../constants/Health_name.dart';
import '../../controller/details_controller.dart';
import '../../controller/planet_controller.dart';

class HealthPlantsScreen extends StatelessWidget {
   HealthPlantsScreen({super.key});

  PlanetController planetcontroller =
  Get.put<PlanetController>(PlanetController());
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
          'Health Plant',
          style: GoogleFonts.exo(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<PlanetController>(builder: (logic) {
        return SafeArea(
            child: planetcontroller.planet.value.data!.isNotEmpty
                ? SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<PlanetController>(builder: (logic) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: planetcontroller.planet.value.data?.length,
                      itemBuilder: (context, index) =>
                      planetcontroller
                          .planet.value.data?[index]
                          .diseaseName == HealthName.potatoHealth  || planetcontroller
                          .planet.value.data?[index]
                          .diseaseName == HealthName.tomatoHealth
                          && planetcontroller
                        .planet.value.data![index]
                        .confidence != null?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.sickPlantsDetails);
                                    detailsController.diseaseData =
                                    planetcontroller.planet.value.data![index];
                                    detailsController.getdisease(
                                        diseasename: planetcontroller.planet
                                            .value.data![index].diseaseName!);
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: (Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                'Position : ${planetcontroller
                                                    .planet.value.data?[index]
                                                    .location}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              ),
                                              Text(
                                                'Status : ${planetcontroller
                                                    .planet.value.data?[index]
                                                    .diseaseName == HealthName.potatoHealth  || planetcontroller
                                                    .planet.value.data?[index]
                                                    .diseaseName == HealthName.tomatoHealth
                                                    ? 'health'
                                                    : 'sick'}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              )
                                            ],
                                          ),
                                          ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                              child:
                                              Image.network(
                                                planetcontroller.planet.value
                                                    .data![index]
                                                    .firebaseLink!,
                                                width: 0.2 * width,
                                              )
                                          ),

                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.01 * height,
                                ),
                                const Divider(
                                  height: 5,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ):Container(),
                    );
                  })
                ],
              ),
            )
                : planetcontroller.isLoading == true? CircularProgressIndicator():Center(child: Text('No plant scanned available',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),)
        );
      }),
    );
  }
}
