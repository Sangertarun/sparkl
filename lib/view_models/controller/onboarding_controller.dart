import 'package:camera/camera.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkl/res/drawable/assets/video_assets.dart';
import 'package:video_player/video_player.dart';

class OnboardingController extends GetxController with GetTickerProviderStateMixin{

  late VideoPlayerController page1VideoController, page2VideoController;
  late CameraController cameraController;

  late AnimationController textController, videoController, listController;
  late Animation<Offset> textAnimation, videoAnimation;
  late Animation<double> bounceAnimation;


  RxBool back1Page = false.obs,animate2PageText = false.obs,animate2PageVideo = false.obs,isCameraOpen = false.obs,isCameraInitialized = false.obs,
      is1VideoInitialized = false.obs,is2VideoInitialized = false.obs,is1Animated = false.obs,is2Animated = false.obs,is3Animated = false.obs;
  RxDouble topPosition = 0.0.obs,leftPosition = 0.0.obs,videoTopPosition = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
    initialize2Video();
  }

  Future<void> initializeAnimate() async {

//---Text
    textController = AnimationController(duration: Duration(milliseconds: 700), vsync: this,);
    textAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: textController, curve: Curves.easeOut,));
    Future.delayed(Duration(milliseconds: 100), () => animateText());


//---video
    videoController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this,);
    videoAnimation = Tween<Offset>(
      begin: Offset(0, -4),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: videoController, curve: Curves.easeOut,));
    Future.delayed(Duration(milliseconds: 100), () => animateVideo());


  }

  void animateText() {
    if (!textController.isAnimating) {
      if (animate2PageText.value) {
        textController.reverse();
        print("hello===reverse");
      } else {
        textController.forward();
        print("hello===forward");
      }
      animate2PageText.toggle(); // Toggle the state
    }
  }
  void animateVideo() {
   if (!videoController.isAnimating) {
      if (animate2PageVideo.value) {
        videoController.reverse();
        print("hello===reverse");
      } else {
        videoController.forward();
        print("hello===forward");
      }
      animate2PageVideo.toggle(); // Toggle the state
    }
  }

  @override
  void onClose() {
    textController.dispose();
    videoController.dispose();
    page2VideoController.dispose();
    super.onClose();
  }





  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );
    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize();
    isCameraInitialized.value = true;
  }

  void initialize1Video() {
    page1VideoController = VideoPlayerController.asset(VideoAssets.page1Video)
      ..initialize().then((_) {
        page1VideoController.setLooping(true);
        page1VideoController.play();
        is1VideoInitialized.value = true;
      }).catchError((error) {
        print("Error initializing video: $error");
      });
  }

  void initialize2Video() {
    page2VideoController = VideoPlayerController.asset(VideoAssets.page2Video)
      ..initialize().then((_) {
        page2VideoController.setLooping(true);
        page2VideoController.play();
        is2VideoInitialized.value = true;
      }).catchError((error) {
        print("Error initializing video: $error");
      });
  }

  void animateTeg() async {
    await Future.delayed(Duration(milliseconds: 100));
    topPosition.value = Get.height * 0.1;
    await Future.delayed(Duration(milliseconds: 1000));
    topPosition.value = 0;
  }



  void animate1Chat() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      is1Animated.value = true;
    });
  }

}