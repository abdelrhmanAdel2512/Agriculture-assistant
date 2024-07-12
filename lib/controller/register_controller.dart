import 'package:get/get.dart';

import '../API/register_api.dart';
import '../main.dart';

class RegisterController extends GetxController{
  bool visibility = false;

  void changeVisibility (){
    visibility =!visibility;
    update();
  }

  bool isLoading = false;
  RegisterApi api = RegisterApi();
  String password = '';
  dynamic response ;
  Future<void> register({required userName ,required email ,required password})async{
    isLoading = true;
    update();
    response = await api.register(userName: userName, email: email, password: password);
    response['status'] == "success"
        ? getStorage.write('password', 'password')
        : null;
    isLoading== false;
    update();
  }
}