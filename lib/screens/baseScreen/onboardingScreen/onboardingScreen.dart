import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/constant/app_const_string.dart';
import 'package:flutter_getx_tamplete/widgets/custombutton/custombutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/onboardingController.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children:[
          /// ==========================================
          /// 1. PageView (Background Image + Texts)
          /// ==========================================
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: controller.pages.length,
            itemBuilder: (context, index) {
              final data = controller.pages[index];
              return Stack(
                fit: StackFit.expand,
                children:[
                  // Background Image
                  Image.asset(
                    data.imagePath,
                    fit: BoxFit.cover,
                  ),
                  // Black Gradient Overlay (Bottom to Top)

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors:[
                          Colors.black.withAlpha(180),
                          Colors.black.withAlpha(150),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 0.7],
                      ),
                    ),
                  ),

                  // Swipeable Content (Indicator, Title, Subtitle)
                  Positioned(
                    bottom: 170.h,
                    left: 20.w,
                    right: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        // Dotted Indicators
                        _buildPageIndicator(controller, index),
                        SizedBox(height: 24.h),

                        // Title
                        Text(
                          data.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w800,
                            height: 1.1, //
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Subtitle
                        Text(
                          data.subtitle,
                          style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 14.sp,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          /// ==========================================
          /// 2. Fixed Bottom Buttons (Create Account & Sign In)
          /// ==========================================
          Positioned(
            bottom: 30.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              children:[
                // Sign In Button (Transparent with White Border)
                CustomButton(text: ConstString.signIn,

                  onTap: controller.onNavigateToSignIn,),

                SizedBox(height: 12.h),


                // Create Account Button (Blue Filled)
                CustomButton(text: ConstString.createAccount,
                  backgroundColor: Colors.black,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  hasBorder: true,
                  onTap: controller.onNavigateToCreateAccount,),


                SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ========== Page Indicator (Dots / Line) =========================== /////
  Widget _buildPageIndicator(OnboardingController controller, int pageIndex) {
    return Obx(() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.pages.length, (index) {
          bool isActive = controller.currentPageIndex.value == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(right: 6.w),
            height: 6.h,
            width: isActive ? 16.w : 6.w,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white.withAlpha(70),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }),
      );
    });
  }
}