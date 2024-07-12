import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constants/routes_name.dart';

import '../../constants/colors.dart';
import '../../controller/register_controller.dart';
import '../../generated/assets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController userNameController = TextEditingController();
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
        title:  Text(
          'Register',
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
                  'User name',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                SizedBox(
                  height: 0.01 * height,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().length < 4) {
                      return 'please enter user name';
                    } else {
                      return null;
                    }
                  },
                  controller: userNameController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: ColM.textFieldColor, width: 3)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      focusColor: Color(0xffADFB00),
                      prefixIcon: Icon(Icons.account_circle_outlined,
                          color: Colors.black12)),
                ),
                SizedBox(
                  height: 0.030 * height,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                SizedBox(
                  height: 0.01 * height,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return 'please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: ColM.textFieldColor, width: 3)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1, color: Colors.black),
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
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                SizedBox(
                  height: 0.01 * height,
                ),
                GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (controller) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().length < 8) {
                            return 'password must be at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
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
                SizedBox(height: 0.05 * height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    InkWell(
                      onTap: () => Get.offNamed(Routes.loginScreen),
                      child: Text(
                        '  Login',
                        style: TextStyle(color: ColM.buttonColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.02 * height),
                GetBuilder<RegisterController>(builder: (controller) {
                  return InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate() && controller.isLoading == false) {
                        await controller.register(
                            userName: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text);
                        if (controller.response['status'] == 'success') {
                          Get.offAllNamed(Routes.homeScreen);
                          controller.isLoading = false;
                          controller.update;
                        } else {
                          Get.snackbar('failed', 'failed to register');
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
                        child: controller.isLoading == false ?Text(
                          'register',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                        ) : CircularProgressIndicator(color: Colors.white),
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
