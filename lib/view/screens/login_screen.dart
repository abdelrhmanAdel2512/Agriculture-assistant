import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/colors.dart';
import 'package:graduation_project/constants/routes_name.dart';
import 'package:graduation_project/generated/assets.dart';

import '../../controller/login_controller.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: GoogleFonts.exo(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 0.05* width, left:0.05* width),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(Assets.imagesSplashLogo,
                            width: 0.4 * width)),
                    Center(child: Text('Agriculture Assistant',style: GoogleFonts.exo(fontSize: 25,fontWeight: FontWeight.w500),)),
                    SizedBox(height: 0.04 * height),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty ||
                            !value.contains('@')) {
                          return 'please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                              BorderSide(color: ColM.textFieldColor, width: 3)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1, color: Colors
                                .black),
                          ),
                          focusColor: Color(0xffADFB00),
                          prefixIcon: Icon(Icons.alternate_email_outlined,
                              color: Colors.black12)),
                    ),
                    SizedBox(
                      height: 0.03 * height,
                    ),
                    Text(
                      'passwored',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller) {
                          return TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .length < 8) {
                                return 'password must be at least 8 characters';
                              } else {
                                return null;
                              }
                            },
                            obscureText: !controller.visibility,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: ColM.textFieldColor, width: 3)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                focusColor: Color(0xffADFB00),
                                prefixIcon: Icon(
                                  Icons.key_outlined,
                                  color: Colors.black12,
                                ),
                                suffixIcon: InkWell(
                                    onTap: () => controller.changeVisibility(),
                                    child: !controller.visibility
                                        ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.black12,
                                    )
                                        : Icon(
                                      Icons.visibility_outlined,
                                      color: Colors.black12,
                                    ))),
                          );
                        }),
                    SizedBox(height: 0.1 * height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont’t have an account?'),
                        InkWell(
                          onTap: () => Get.offNamed(Routes.registerScreen),
                          child: Text(
                            '  Register',
                            style: TextStyle(color: ColM.buttonColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.03 * height),
                    GetBuilder<LoginController>(builder: (controller) {
                      return InkWell(
                        onTap: () async{
                          if (formKey.currentState!.validate() && controller.isLoading == false) {
                           await controller.login(email: emailController.text, password: passwordController.text);
                           if(controller.response['status'] == 'success' ){
                             Get.offAllNamed(Routes.homeScreen);
                             controller.isLoading = false;
                             controller.update;
                           }else{
                             Get.snackbar('failed', 'failed to login');
                             controller.isLoading = false;
                             controller.update;
                           }
                          }
                        },
                        child: Container(
                          height: 0.07 * height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColM.buttonColor,
                          ),
                          child: Center(
                            child: controller.isLoading == false ? Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                            ):CircularProgressIndicator(color: Colors.white,),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
