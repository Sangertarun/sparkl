import 'package:get/get.dart';
import '../../view/onboarding_screen/page1_screen.dart';
import '../../view/onboarding_screen/page2_screen.dart';
import '../../view/onboarding_screen/page3_screen.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(
        name: RoutesName.page1Screen,
        page: () => const Page1Screen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),

    GetPage(
        name: RoutesName.page2Screen,
        page: () => const Page2Screen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),

    GetPage(
        name: RoutesName.page3Screen,
        page: () => const Page3Screen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),

      ];



}