import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkl/res/appBar/onboarding_bar.dart';
import 'package:sparkl/res/routes/routes_name.dart';
import 'package:sparkl/view/onboarding_screen/page3_widget.dart';
import '../../res/components/onBoarding3Btn.dart';
import '../../res/drawable/assets/images_assets.dart';
import '../../res/drawable/fonts/text_fonts.dart';
import '../../res/drawable/values/app_text.dart';
import '../../res/drawable/values/dimensions.dart';
import '../../res/utils/rectangle_button.dart';

import '../../view_models/controller/onboarding_controller.dart';

class Page3Screen extends StatefulWidget {

  const Page3Screen({super.key});

  @override
  State<Page3Screen> createState() => _Page3ScreenState();
}

class _Page3ScreenState extends State<Page3Screen> with TickerProviderStateMixin{


  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    onboardingController.initialize2Video();
    animateText();
  }


  void animateText() async {
    onboardingController.textController = AnimationController(duration: Duration(milliseconds: 700), vsync: this,);
    onboardingController.textAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: onboardingController.textController,
      curve: Curves.easeOut,
    ));
    onboardingController.textController.forward();
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return OnboardingBar(
        screenName : "Page3",
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h*0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: Dimensions.padding_25,
                image: AssetImage(ImagesAssets.appLogo),
              ).marginOnly(bottom: Dimensions.padding_20),
              SlideTransition(
                position: onboardingController.textAnimation,
                child: Text(AppText.onboarding31,style: black27_600),
              ).marginOnly(bottom: Dimensions.padding_20),
            ],
          ),
        ),
        Page3Widget(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      onboardingController.is1Animated.value = false;
                      onboardingController.is2Animated.value = false;
                      onboardingController.is3Animated.value = false;
                      Get.back();
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(50, 50),
                            painter: Onboarding3btn(),
                          ),
                          Icon(Icons.arrow_back, size: 20, color: Colors.black),
                        ],
                      ),
                    ).marginOnly(right: Dimensions.padding_10),
                  ),
                  Expanded(
                    child: RectangleButton(
                      title: AppText.getStarted,
                      onPress: () {},
                      textStyle: black14_500,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

