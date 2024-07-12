import 'dart:async';

import 'package:get/get.dart';
import 'package:graduation_project/API/get_all_planet.dart';

import '../model/planet_model.dart';

class PlanetController extends GetxController {
  final GetAllPlanetApi _api = GetAllPlanetApi();
  final RxBool isLoading = false.obs;
  final planet = PlantModel(status: '').obs;

  late StreamSubscription<PlantModel?> _streamSubscription;
  late Timer _timer;
  final Duration _updateInterval = const Duration(seconds: 5);

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = _api.planetDiseaseStream.listen((newData) {
      if (newData != null) {
        planet.value = newData;
        print(planet.value.data != null && planet.value.data!.isNotEmpty
            ? planet.value.data!.last.diseaseName
            : 'No disease data available');
      }
      isLoading.value = false;
      update();
    }, onError: (error) {
      print('Error receiving planet data: $error');
      isLoading.value = false;
      update();
    });

    // Start fetching data immediately
    getAllPlanet();

    // Start timer for periodic updates
    _timer = Timer.periodic(_updateInterval, (Timer timer) {
      if (!_streamSubscription.isPaused) {
        getAllPlanet();
      }
    });
  }

  Future<void> getAllPlanet() async {
    if (!_streamSubscription.isPaused) {
      isLoading.value = true;
      await _api.getAllPlanet();
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    _api.dispose();
    _timer.cancel();
    super.onClose();
  }
}
