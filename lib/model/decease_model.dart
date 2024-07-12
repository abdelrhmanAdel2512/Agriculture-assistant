class DiseaseModel {
  String? status;
  Data? data;

  DiseaseModel({this.status, this.data});

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? description;
  String? treatment;

  Data({this.description, this.treatment});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    treatment = json['treatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['treatment'] = this.treatment;
    return data;
  }
}
