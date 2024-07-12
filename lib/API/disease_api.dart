import '../model/decease_model.dart';
import 'api.dart';
import 'api_helper.dart';

class DiseaseApi {
  final Api _api = Api();

  Future<DiseaseModel> getDisease({required String diseaseName}) async {
    try {
      final response = await _api.postRequest(
        '${ApiHelper.baseUrl}${ApiHelper.getDecease}',
        {"diseasename": diseaseName},
      );

      print(response);

      // Parse the JSON response into a Disease object
      final disease = DiseaseModel.fromJson(response);
      print(disease.data!.treatment);
      return disease;
    } catch (e) {
      print('Error in DiseaseApi: $e');
      rethrow; // Rethrow the error to be handled by the caller
    }
  }
}
