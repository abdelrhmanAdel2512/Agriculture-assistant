import 'package:graduation_project/API/api_helper.dart';
import 'package:graduation_project/main.dart';
import 'api.dart';

class LoginApi{
  Api api = Api();
  Future <dynamic> login({required email ,required password})async{
    try{
      var response = await api.postRequest(
          '${ApiHelper.baseUrl}${ApiHelper.login}', {"email": email, "password": password});

      print(response);
      return response ;
    }catch (e){
      print(e);
    }
  }
}