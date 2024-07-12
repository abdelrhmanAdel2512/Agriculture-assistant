import 'package:get/get.dart';

import '../API/disease_api.dart';
import '../model/decease_model.dart';
import '../model/planet_model.dart';

class DetailsController  extends GetxController{
  PlantData diseaseData = PlantData();

  void setData(data){
    diseaseData = data;
  }

  bool isLoading = false;
  DiseaseApi api = DiseaseApi();
  DiseaseModel diseaseModel = DiseaseModel();
  Future<void> getdisease ({required String diseasename})async{
 diseaseModel = await api.getDisease(diseaseName: diseasename);
 print('0000000000000000000000000000000000000');
 print(diseaseModel.data!.description);
  }


}