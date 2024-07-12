import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('error massage : $e');
    }
  }

  postRequest(String url, Map body) async {
    try {
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("error : ${response.statusCode}");
      }
    } catch (e) {
      print('error massage : $e');
    }
  }
}
