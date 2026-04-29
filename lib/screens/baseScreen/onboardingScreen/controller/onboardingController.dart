import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/constant/app_assert_image.dart';
import 'package:flutter_getx_tamplete/routes/app_routes.dart';
import 'package:get/get.dart';

class OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  OnboardingData({required this.title, required this.subtitle, required this.imagePath});
}

class OnboardingController extends GetxController {

  final PageController pageController = PageController();
  var currentPageIndex = 0.obs;

  final List<OnboardingData> pages =[
    OnboardingData(
      title: "Book a ride in\nminutes",
      subtitle: "Plan your trip in a few quick steps no phone calls,\nno confusion. Get the right ride at the right time,\nwith clear details upfront.", // ConstString.obSub1
      imagePath: ImageString.onboarding,
    ),
    OnboardingData(
      title: "Clear updates, all\nthe way",
      subtitle: "Plan your trip in a few quick steps no phone calls,\nno confusion. Get the right ride at the right time,\nwith clear details upfront.", // ConstString.obSub2
      imagePath: ImageString.onboarding,
    ),
    OnboardingData(
      title: "Safe & reliable\nrides",
      subtitle: "Enjoy peace of mind with our verified drivers and 24/7 support. Your safety is our top priority.", // ConstString.obSub3
      imagePath: ImageString.onboarding,
    ),
  ];

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void onNavigateToCreateAccount() {
    Get.toNamed(AppRoutes.chooseRoleScreen);
  }

  void onNavigateToSignIn() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}