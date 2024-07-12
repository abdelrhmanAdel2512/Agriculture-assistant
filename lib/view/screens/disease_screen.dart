import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/details_controller.dart';

class DiseaseDetailsScreen extends StatelessWidget {
   DiseaseDetailsScreen({super.key});
  DetailsController detailsController =
  Get.put<DetailsController>(DetailsController());
  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold( appBar: AppBar(
      centerTitle: true,

      title: Text(
        'Disease Details',
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
            const Text('Disease :' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500),),
            detailsController.diseaseModel.data != null ? Column(
              children: [
                SizedBox(height: 0.03 *height,),
                Container(
                    decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:  EdgeInsets.all(0.05*width),
                      child: detailsController.diseaseModel.data != null ? Text(detailsController.diseaseModel.data!.description!,style: TextStyle(fontSize: 18),) : SizedBox(),
                    ))
              ],
            ):Text('There is no data'),
          
          ],
        ),
      ),
    ),
    );
  }
}
