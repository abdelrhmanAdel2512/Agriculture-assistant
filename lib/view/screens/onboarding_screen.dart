import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/routes_name.dart';
import '../../controller/inboarding_controller.dart';
import '../widgets/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (controller) => Column(children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.pages.length,
                    onPageChanged: (int index) {
                      controller.pagechange(index);
                    },
                    itemBuilder: (context, index) =>
                    controller.pages[index],
                  ),
                  topWidget(height, width, context)
                ],
              ),
            ),
            PageIndicators(
              pageCount: controller.pages.length,
              currentPage: controller.currentPage,
            ),
            SizedBox(
              height: 0.03 * height,
            ),
            controller.currentPage == controller.pages.length - 1
                ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:ColM.buttonColor,
              ),
              width: 0.75 * width,
              height: 0.06 * height,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.loginScreen);
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
                : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:ColM.buttonColor,
              ),
              width: 0.75 * width,
              height: 0.06 * height,
              child: TextButton(
                onPressed: () {
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 0.03 * height,
            )
          ]),
        ),
      ),
    );
  }
}
