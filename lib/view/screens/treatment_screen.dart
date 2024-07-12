import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/colors.dart';

import '../../controller/details_controller.dart';

class TreatmentDetailsScreen extends StatelessWidget {
   TreatmentDetailsScreen({super.key});
  DetailsController detailsController =
  Get.put<DetailsController>(DetailsController());
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold( appBar: AppBar(
      centerTitle: true,

      title: Text(
        'Treatment Details',
        style: GoogleFonts.exo(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(right: 0.05 *width,left: 0.05 *width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02 *height,),
              Text('Treatment :' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500),),
              SizedBox(height: 0.03 *height,),
              detailsController.diseaseModel.data != null ?Container(
                  decoration:  BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(20)),

                  child: Padding(
                    padding:  EdgeInsets.all(0.05 *width),
                    child: Text(detailsController.diseaseModel.data!.treatment!,style: TextStyle(fontSize: 18),),
                  )):const Text('There is no data'),
            ] ,
          ),
        ),
      ),
    );
  }
}
