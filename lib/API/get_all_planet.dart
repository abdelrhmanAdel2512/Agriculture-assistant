import 'dart:async';
import 'dart:convert';

import '../model/planet_model.dart';
import 'api.dart';
import 'api_helper.dart';
//
// class GetAllPlanetApi{
//   Api api = Api();
//   Future<PlantDisease?> getAllPlanet() async {
//     try {
//       var planetModel = await api.getRequest('http://192.168.1.2/gradiation_project/appApi/getAll.php');
//       if (planetModel is Map<String, dynamic>) {
//         PlantDisease plantDisease = PlantDisease.fromJson(planetModel);
//         print(planetModel);
//         print(plantDisease.data != null && plantDisease.data!.isNotEmpty
//             ? plantDisease.data![0].diseaseName
//             : 'No disease data available');
//         return plantDisease;
//       } else {
//         print('Response is not a valid JSON object: $planetModel');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching planet data: $e');
//       return null;
//     }
//   }
//
// }

class GetAllPlanetApi {
  Api api = Api();
  final StreamController<PlantModel?> _streamController =
  StreamController<PlantModel?>();

  Stream<PlantModel?> get planetDiseaseStream =>
      _streamController.stream;

  Future<void> getAllPlanet() async {
    try {
      var planetModel = await api.getRequest(
          '${ApiHelper.baseUrl}${ApiHelper.getAllPlant}');
      if (planetModel is Map<String, dynamic>) {
        PlantModel plantDisease = PlantModel.fromJson(planetModel);
        print(plantDisease.data != null &&
            plantDisease.data!.isNotEmpty
            ? plantDisease.data!.last.diseaseName
            : 'No disease data available');
        _streamController.add(plantDisease);
      } else {
        print('Response is not a valid JSON object: $planetModel');
        _streamController.add(null);
      }
    } catch (e) {
      print('Error fetching planet data: $e');
      _streamController.add(null);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
