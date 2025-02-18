import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sparkl/res/drawable/assets/images_assets.dart';
import 'package:get/get.dart';
import 'package:sparkl/view_models/controller/onboarding_controller.dart';
import 'package:video_player/video_player.dart';
import '../../res/drawable/colors/app_colors.dart';
import '../../res/drawable/values/app_text.dart';

class Page2Widget extends StatefulWidget {
  @override
  _Page2WidgetState createState() => _Page2WidgetState();
}

class _Page2WidgetState extends State<Page2Widget>
    with SingleTickerProviderStateMixin {
  OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    onboardingController.listController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    onboardingController.bounceAnimation =
        CurvedAnimation(parent: onboardingController.listController, curve: Curves.bounceOut);
    onboardingController.listController.forward();
  }

  @override
  void dispose() {
    onboardingController.listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: h * 0.4,
          child: AnimatedBuilder(
            animation: onboardingController.bounceAnimation,
            builder: (context, child) {
              double translateX = (1 - onboardingController.bounceAnimation.value) * 200;
              return Stack(
                children: List.generate(4, (index) {
                  double topPosition = index *15.0 + index * 5.0;
                  double leftPos = index * -13.0 + index * 5.0;
                  double rightPos = index * -13.0 + index * 5.0;
                  return Positioned(
                    top: topPosition,
                    left: leftPos,
                    right: rightPos,
                    child: Transform.translate(
                      offset: Offset(translateX, 0),
                      child: SizedBox(
                        height: h*0.34,
                          width: double.infinity,
                          child: Image(image: AssetImage(ImagesAssets.stackCard),fit: BoxFit.fill,)),
                    ),
                  );
                }),
              );
            },
          ),
        ),
        Positioned(
          top: h * 0.34,
          child: SizedBox(
            height: h * 0.12,
            width: h * 0.12,
            child: Hero(
              tag: AppText.video1Hero,
              child: ClipOval(
                child: Obx(() {
                  if (onboardingController.isCameraOpen.value) {
                    if (onboardingController.isCameraInitialized.value) {
                      return CameraPreview(
                          onboardingController.cameraController);
                    }
                  }

                  if (onboardingController.is1VideoInitialized.value) {
                    return AspectRatio(
                      aspectRatio: onboardingController
                          .page1VideoController.value.aspectRatio,
                      child: VideoPlayer(
                          onboardingController.page1VideoController),
                    );
                  }

                  return Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child:
                      CircularProgressIndicator(color: AppColors.appColor),
                    ),
                  );
                }),
              ),
            ),
          ),
        )
      ],
    );
  }
}