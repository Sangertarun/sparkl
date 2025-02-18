import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkl/res/appBar/onboarding_bar.dart';
import 'package:sparkl/view/onboarding_screen/page2_widget.dart';
import 'package:sparkl/view_models/controller/onboarding_controller.dart';
import 'package:video_player/video_player.dart';
import '../../res/components/onBoarding2Btn.dart';
import '../../res/drawable/assets/images_assets.dart';
import '../../res/drawable/colors/app_colors.dart';
import '../../res/drawable/fonts/text_fonts.dart';
import '../../res/drawable/values/app_text.dart';
import '../../res/drawable/values/dimensions.dart';
import '../../res/routes/routes_name.dart';
import '../../res/utils/rectangle_button.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({super.key});

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> with TickerProviderStateMixin{


  OnboardingController onboardingController = Get.put(OnboardingController());


  @override
  Widget build(BuildContext context) {
    onboardingController.initializeAnimate();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return OnboardingBar(
      screenName : "Page2",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: ImagesAssets.appLogo,
            child: Image(
              height: Dimensions.padding_25,
              image: AssetImage(ImagesAssets.appLogo),
            ).marginOnly(bottom: Dimensions.padding_20),
          ),
          SlideTransition(
            position: onboardingController.textAnimation,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: AppText.onboarding21,
                style: black27_600,
                children: <TextSpan>[
                  TextSpan(
                    text: "\n${AppText.onboarding22}",
                    style: black14_400.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: h*0.08),
          Hero(
            tag: AppText.video2Hero,
            child: Align(
              alignment: Alignment.center,
              child: SlideTransition(
                position: onboardingController.videoAnimation,
                child: SizedBox(
                  width: w*0.4,
                  height: h*0.12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius_15),
                    child: Obx(() => onboardingController.is2VideoInitialized.value
                        ? AspectRatio(
                      aspectRatio: onboardingController.page2VideoController.value.aspectRatio,
                      child: VideoPlayer(onboardingController.page2VideoController),
                    )
                        : Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: AppColors.appColor,),
                      ),
                    )
                    ),
                  )
                  ),
                ),
            ),
          ),
          Expanded(child: Page2Widget()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async{
                  onboardingController.animate2PageText.value = true;
                  onboardingController.animate2PageVideo.value = true;
                  onboardingController.animateText();
                  onboardingController.animateVideo();
                  await Future.delayed(Duration(milliseconds: 300));
                  Get.back();
                  onboardingController.animateTeg();
                  onboardingController.back1Page.value = true;

                  },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size(50, 50),
                        painter: Onboarding2btn(),
                      ),
                      Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    ],
                  ),
                ).marginOnly(right: Dimensions.padding_10),
              ),
              Expanded(
                child: RectangleButton(
                  title: AppText.next,
                  onPress: ()=> Get.toNamed(RoutesName.page3Screen),
                  textStyle: black14_500,),
              ),
            ],
          ),
        ],
      ));
  }
}