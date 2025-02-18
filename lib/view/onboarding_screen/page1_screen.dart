import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sparkl/res/appBar/onboarding_bar.dart';
import 'package:sparkl/res/drawable/assets/images_assets.dart';
import 'package:sparkl/res/drawable/fonts/text_fonts.dart';
import 'package:sparkl/res/drawable/values/app_text.dart';
import 'package:sparkl/res/drawable/values/dimensions.dart';
import 'package:sparkl/res/routes/routes_name.dart';
import 'package:sparkl/view/onboarding_screen/page1_widget.dart';
import 'package:sparkl/view_models/controller/onboarding_controller.dart';
import '../../res/utils/rectangle_button.dart';

class Page1Screen extends StatefulWidget {
  const Page1Screen({super.key});

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {

  OnboardingController onboardingController = Get.put(OnboardingController());


  @override
  void initState() {
    super.initState();
    checkAndInitialize();
    onboardingController.initialize1Video();
    onboardingController.animateTeg();
  }

  Future<void> checkAndInitialize() async {
    var status = await Permission.camera.request();

    if (status.isGranted) {
      onboardingController.isCameraOpen.value = true;
      await onboardingController.initializeCamera();
    } else {
      onboardingController.isCameraOpen.value = false;
    }

  }

  @override
  void dispose() {
    onboardingController.cameraController.dispose();
    onboardingController.page1VideoController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return OnboardingBar(
      screenName: "Page1",
      body: Obx(()=>Stack(
        alignment: Alignment.center,
        children: [
          Page1Widget(),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: onboardingController.back1Page.value ? 0 : onboardingController.topPosition.value,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: ImagesAssets.appLogo,
                  child: Image(
                    height: Dimensions.padding_35,
                    image: AssetImage(ImagesAssets.appLogo),
                  ).marginOnly(bottom: Dimensions.padding_20),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppText.onboarding11,
                    style: black27_600,
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n${AppText.onboarding12}",
                        style: black14_400.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            bottom: onboardingController.back1Page.value?0:onboardingController.topPosition.value,
            left: 0,
            right: 0,
            child: RectangleButton(
              title: AppText.next,
              onPress: (){
                if(onboardingController.animate2PageText.value == true){
                  onboardingController.animate2PageText.value = false;

                }
                if(onboardingController.animate2PageVideo.value == true){
                  onboardingController.animate2PageVideo.value = false;
                }
                Get.toNamed(RoutesName.page2Screen);
              },
              textStyle: black15_500,),
          )

        ],
      )

    ),

    );
  }
}