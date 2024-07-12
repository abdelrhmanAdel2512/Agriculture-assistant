import 'package:get/get.dart';
import 'package:graduation_project/API/login_api.dart';

import '../main.dart';

class LoginController extends GetxController{
  bool visibility = false;

  void changeVisibility (){
    visibility =!visibility;
    update();
  }
  bool isLoading = false;
  LoginApi api =  LoginApi();
  String password = '';
  dynamic response ;
  Future<void> login({required email ,required password})async{
    isLoading = true;
    update();
    response = await api.login( email: email, password: password);
    response['status'] == "success"
        ? getStorage.write('password', 'password')
        : null;
    isLoading== false;
    update();
  }
}