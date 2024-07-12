import '../main.dart';
import 'api.dart';
import 'api_helper.dart';

class RegisterApi{
  Api api = Api();
Future <dynamic> register({required userName ,required email ,required password})async{
  try{
    var response = await api.postRequest('${ApiHelper.baseUrl}${ApiHelper.register}', {
      "username": userName,
      "email": email,
      "password": password
    });

    print(response);
    return response;
  }catch (e){
    print(e);
  }
}
}