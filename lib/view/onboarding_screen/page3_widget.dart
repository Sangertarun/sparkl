import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../res/drawable/colors/app_colors.dart';
import '../../res/drawable/fonts/text_fonts.dart';
import '../../res/drawable/values/app_text.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import '../../view_models/controller/onboarding_controller.dart';

class Page3Widget extends StatefulWidget {
  const Page3Widget({super.key});

  @override
  State<Page3Widget> createState() => _Page3WidgetState();
}

class _Page3WidgetState extends State<Page3Widget> {

  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      onboardingController.is1Animated.value = true;
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
    }).then((_) {onboardingController.is2Animated.value = true;});
    Future.delayed(const Duration(milliseconds: 2500), () {
      onboardingController.is3Animated.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(
          ()=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h*0.15,
            width: double.infinity,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  top: onboardingController.is1Animated.value ? h * 0.04 : -h * 0.1,
                  left: onboardingController.is1Animated.value ? w * 0.03 : -w * 0.3,
                  right: w*0.06,
                  child: BubbleSpecialThree(
                    text: AppText.onboarding32,
                    textStyle: black16_500,
                    color: AppColors.appChatColor,
                    isSender: false,
                  ),
                ),
                Hero(
                  tag: AppText.video2Hero,
                  child: SizedBox(
                    height: h*0.06,
                    width: h*0.06,
                    child: ClipOval(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: h*0.15,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    right: w*0.07,
                    top: onboardingController.is2Animated.value ? h * 0.03 : -h * 0.1,
                    left: onboardingController.is2Animated.value ? w * 0.02 : -w * -0.3,
                    child: BubbleSpecialThree(
                        text: AppText.onboarding33,
                        color: AppColors.appWhite,
                        isSender: true),
                  ),
                  Hero(
                    tag: AppText.video1Hero,
                    child: SizedBox(
                      height: h*0.06,
                      width: h*0.06,
                      child: ClipOval(
                        child: Obx(() {
                          if (onboardingController.isCameraOpen.value) {
                            if (onboardingController.isCameraInitialized.value) {
                              return CameraPreview(onboardingController.cameraController);
                            }
                          }
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
                      ),
                    ),
                  ),
                ],
              )
          ),
          onboardingController.is2Animated.value == true
              ? SizedBox(
            height: h*0.2,
            width: double.infinity,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  top: onboardingController.is3Animated.value ? h * 0.04 : -h * 0.2,
                  left: onboardingController.is3Animated.value ? w * 0.03 : -w * 0.3,
                  right: 0.06,
                  child: BubbleSpecialThree(
                    text: AppText.onboarding34,
                    textStyle: black16_500,
                    color: AppColors.appChatColor,
                    isSender: false,
                  ),
                ),
                SizedBox(
                  height: h*0.06,
                  width: h*0.06,
                  child: ClipOval(
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
                  ),
                ),
              ],
            ),
          )
              : Container()
        ],
      ),
    );
  }
}