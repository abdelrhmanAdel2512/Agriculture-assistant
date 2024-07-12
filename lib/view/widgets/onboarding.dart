import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/routes_name.dart';

class PageIndicators extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const PageIndicators({super.key, required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: _buildIndicator(index),
        ),
      ),
    );
  }
  Widget _buildIndicator(int index) {
    return Container(
      width: index == currentPage ? 12 : 9,
      height: index == currentPage ? 12 : 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentPage ? ColM.buttonColor: Colors.grey,
        border: Border.all(
          color: ColM.buttonColor,
          width: 1,
        ),
      ),
    );
  }
}
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingPage(
      {super.key, required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    return Column(
      children: [
        Image.asset(
          imageUrl,

        ),
        const SizedBox(height: 20),
        // TitleWidget(),
        title == 'title1'
            ? Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'Have you met Agriculture Assistant yet?\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Its your new best friend for keeping tabs on your plants ',
                  style: TextStyle(
                    fontSize: 24,
                    color: ColM.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        //  Hundreds of jobs are waiting for you to join together
            : title == 'title2'
            ? Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'With Agriculture Assistant, you can take charge from your room without breaking a sweat.\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Its super simple: ',
                  style: TextStyle(
                    fontSize:24,
                    color: ColM.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'just sit back and let Agriculture Assistant do the work for you.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
        // Get the best choice for the job you've always dreamed of
            : title == 'title3'
            ? Padding(
          padding:
          const EdgeInsets.only(left: 15.0, right: 15.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              text: 'Say goodbye to worries about your plants health - Agriculture Assistant has got you covered.\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Color(0xff111827),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Get ready for hassle-free plant care like never before!',
                  style: TextStyle(
                    fontSize: 23,
                    color: ColM.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff111827),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
            : const Text(''),
        // const SizedBox(height: 10),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15.0, right: 15.0) ,
        //   child: Text(
        //     description,
        //     style: const TextStyle(fontSize: 16),
        //   ),
        // ),
      ],
    );
  }
}

Widget topWidget(double hight, double width,BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(onTap: () {Get.toNamed(Routes.loginScreen);}, child: const Text('skip')),
      )
    ],
  );
}

