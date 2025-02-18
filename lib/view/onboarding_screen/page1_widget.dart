import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:sparkl/res/drawable/values/app_text.dart';
import 'package:sparkl/view_models/controller/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../res/drawable/assets/icons_assets.dart';
import '../../res/drawable/assets/json_assets.dart';
import '../../res/drawable/colors/app_colors.dart';
import '../../res/drawable/fonts/text_fonts.dart';
import '../../res/drawable/styles/container_class.dart';
import '../../res/drawable/values/dimensions.dart';


class Page1Widget extends StatefulWidget {
  const Page1Widget({super.key});

  @override
  State<Page1Widget> createState() => _Page1WidgetState();
}

class _Page1WidgetState extends State<Page1Widget> {


  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h*0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Lottie.asset(JsonAssets.homeLogo,width: w,height: w, fit: BoxFit.contain,),
              Container(
                height: h * 0.35,
                width: h * 0.35,
                padding: EdgeInsets.all(Dimensions.padding_8),
                decoration: containerAppCircle,
                child: Hero(
                  tag: AppText.video1Hero,
                  flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
                    return ScaleTransition(
                      scale: animation.drive(Tween(begin: 0.9, end: 1.0).chain(CurveTween(curve: Curves.easeInOut))), // Slow scaling effect
                      child: toContext.widget,
                    );
                  },
                  child: ClipOval(
                    child: Obx(() {
                      if (onboardingController.isCameraOpen.value) {
                        // Show camera preview if the camera is initialized
                        if (onboardingController.isCameraInitialized.value) {
                          return CameraPreview(onboardingController.cameraController);
                        }
                      }

                      // If the camera is not open (permission denied), show video
                      if (onboardingController.is1VideoInitialized.value) {
                        return AspectRatio(
                          aspectRatio: onboardingController.page1VideoController.value.aspectRatio,
                          child: VideoPlayer(onboardingController.page1VideoController),
                        );
                      }

                      return Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(color: AppColors.appColor),
                        ),
                      );
                    }),
                  )
                ),
              ),
              Obx(
                ()=> SizedBox(
                  height: h*0.55,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.15,
                          left: onboardingController.topPosition.value == 0.0?h*0.046:onboardingController.topPosition.value,
                          child: tagImageWidget(IconsAssets.blueBook,false)
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.15,
                          right: onboardingController.topPosition.value == 0.0?0:onboardingController.topPosition.value,
                          child: tagTextWidget(AppText.onboarding13)
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.29,
                          left: onboardingController.topPosition.value == 0.0?h*0.025:onboardingController.topPosition.value,
                          child: tagImageWidget(IconsAssets.preRead,false)
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.34,
                          right: onboardingController.topPosition.value == 0.0?0:onboardingController.topPosition.value,
                          child: tagTextWidget(AppText.onboarding15)
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.38,
                          left: onboardingController.topPosition.value == 0.0?0:onboardingController.topPosition.value,
                          child: tagTextWidget(AppText.onboarding14)
                      ),
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          top: h*0.48,
                          right: onboardingController.topPosition.value == 0.0?100:onboardingController.topPosition.value,
                          child: tagImageWidget(IconsAssets.emoji,true)
                      ),

                    ],
                  ),

                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget tagImageWidget(String icon,bool value){
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h*0.06,
      width: h*0.06,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value ? AppColors.appLightWhite : AppColors.appTegLightWhite,
        border: RDottedLineBorder.all(
            dottedLength: 1.5,
            dottedSpace: 1.5,
            width: 1.5,
            color: AppColors.appColor
        ),
      ),
      padding: value?EdgeInsets.all(Dimensions.padding_8):EdgeInsets.all(Dimensions.padding_5),
      child: Image(image: AssetImage(icon)),

    );
  }

  Widget tagTextWidget(String title){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appTegLightWhite,
        border: RDottedLineBorder.all(
            dottedLength: 1.5,
            dottedSpace: 1.5,
            width: 1.5,
            color: AppColors.appColor
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.padding_15,vertical: Dimensions.padding_8),
      child: Text(title,style: black11_400,),

    );
  }

}
