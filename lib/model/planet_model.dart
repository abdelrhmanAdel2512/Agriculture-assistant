// class PlantModel {
//   String? status;
//   List<PlantData>? data;
//
//   PlantModel({
//     this.status,
//     this.data,
//   });
//
//   factory PlantModel.fromJson(Map<String, dynamic> json) {
//     List<dynamic>? dataList = json['data'];
//     List<PlantData>? parsedData =
//     dataList?.map((data) => PlantData.fromJson(data)).toList();
//
//     return PlantModel(
//       status: json['status'],
//       data: parsedData,
//     );
//   }
// }
//
// class PlantData {
//   int? requestID;
//   String? firebaseLink;
//   String? location;
//   String? timestamp;
//   String? diseaseName;
//
//   PlantData({
//     this.requestID,
//     this.firebaseLink,
//     this.location,
//     this.timestamp,
//     this.diseaseName,
//   });
//
//   factory PlantData.fromJson(Map<String, dynamic> json) {
//     return PlantData(
//       requestID: json['requestID'],
//       firebaseLink: json['firebaseLink'],
//       location: json['location'],
//       timestamp: json['timestamp'],
//       diseaseName: json['diseasename'],
//     );
//   }
// }
class PlantModel {
  String? status;
  List<PlantData>? data;

  PlantModel({
    this.status,
    this.data,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? dataList = json['data'];
    List<PlantData>? parsedData =
    dataList?.map((data) => PlantData.fromJson(data)).toList();

    return PlantModel(
      status: json['status'],
      data: parsedData,
    );
  }
}

class PlantData {
  int? requestID;
  String? firebaseLink;
  String? location;
  String? timestamp;
  String? diseaseName;
  String? path; // New field
  String? confidence; // New field

  PlantData({
    this.requestID,
    this.firebaseLink,
    this.location,
    this.timestamp,
    this.diseaseName,
    this.path,
    this.confidence,
  });

  factory PlantData.fromJson(Map<String, dynamic> json) {
    return PlantData(
      requestID: json['requestID'],
      firebaseLink: json['firebaseLink'],
      location: json['location'],
      timestamp: json['timestamp'],
      diseaseName: json['diseasename'],
      path: json['path'], // Parse new field
      confidence: json['confidence'], // Parse new field
    );
  }
}
