import 'package:get/get.dart';

import '../screens/baseScreen/onboardingScreen/onboardingScreen.dart';
import '../screens/baseScreen/splashScreen/splashScreen.dart';
import 'app_routes.dart';

List<GetPage> appRouteFile = <GetPage>[

  //////////// Auth Part ////////////
  GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen(),),
  GetPage(name: AppRoutes.onBoardingScreen, page: () => const OnBoardingScreen(),),

  // GetPage(name: AppRoutes.chooseRoleScreen, page: () => const ChooseRoleScreen(),),
  //
  // /////   =============  Auth  part ===============/////////////////////
  //
  // GetPage(name: AppRoutes.signInScreen, page: () => const SignInScreen(),binding: AuthBindings()),
  // GetPage(name: AppRoutes.signUpScreen, page: () => const SignUpScreen(),binding: AuthBindings()),
  // GetPage(name: AppRoutes.signUpOtpScreen, page: () => const SignUpOtpScreen(),binding: AuthBindings()),
  // GetPage(name: AppRoutes.forgotPasswordScreen, page: () => const ForgotPasswordScreen(),binding: AuthBindings()),
  // GetPage(name: AppRoutes.forgotVerifyOtpScreen, page: () => const ForgotVerifyOtpScreen(),binding: AuthBindings()),
  // GetPage(name: AppRoutes.resetPasswordScreen, page: () => const ResetPasswordScreen(),binding: AuthBindings()),
  //
  // GetPage(name: AppRoutes.notificationsScreen, page: () => const NotificationsScreen(),),
  //
  //
  // /////   =============   Rider  part Home tap screen   ===============/////////////////////
  //
  // GetPage(name: AppRoutes.riderHomeScreen, page: () => RiderHomeScreen(),),
  // GetPage(name: AppRoutes.bookRideStepOne, page: () => BookRideStepOne(),),
  // GetPage(name: AppRoutes.bookRideStepTwo, page: () => BookRideStepTwo(),),
  // GetPage(name: AppRoutes.bookRideStepThree, page: () => BookRideStepThree(),),
  // GetPage(name: AppRoutes.riderBookingConfirmation, page: () => RiderBookingConfirmation(),),
  //
  // GetPage(name: AppRoutes.viewTrackingDetails, page: () => ViewTrackingDetails(),),
  // GetPage(name: AppRoutes.cancelTripScreen, page: () => CancelTripScreen(),),
  // GetPage(name: AppRoutes.riderReportDriver, page: () => RiderReportDriver(),),
  // GetPage(name: AppRoutes.chatScreen, page: () => ChatScreen(),),
  //
  //
  // //////////////// Rider part History Screen  //////////////////
  //
  // GetPage(name: AppRoutes.riderUpComingHistory, page: () => RiderUpComingHistory(),),
  // GetPage(name: AppRoutes.riderCompleteHistory, page: () => RiderCompleteHistory(),),
  // GetPage(name: AppRoutes.riderCancelHistory, page: () => RiderCancelHistory(),),
  //
  //
  // /////   =============   Driver part ===============/////////////////////
  //
  // GetPage(name: AppRoutes.driverHomeScreen, page: () => DriverHomeScreen(),),
  // GetPage(name: AppRoutes.upcomingTripsDetails, page: () => UpcomingTripsDetails(),),
  //
  //
  // GetPage(name: AppRoutes.driverArrivedScreen, page: () => DriverArrivedScreen(),),
  // GetPage(name: AppRoutes.driverStartTripScreen, page: () => DriverStartTripScreen(),),
  // GetPage(name: AppRoutes.driverCompleteTrip, page: () => DriverCompleteTrip(),),
  // GetPage(name: AppRoutes.driverTripsDetails, page: () => DriverTripsDetails(),),
  // GetPage(name: AppRoutes.driverReportRider, page: () => DriverReportRider(),),
  //
  //
  // /////   =============   Profile  part ===============/////////////////////
  //
  // GetPage(name: AppRoutes.riderEditProfile, page: () => RiderEditProfile(),),
  // GetPage(name: AppRoutes.riderEmergencyContact, page: () => RiderEmergencyContact(),),
  // GetPage(name: AppRoutes.riderChangePassword, page: () => RiderChangePassword(),),
  //
  // GetPage(name: AppRoutes.riderNotificationSettings, page: () => RiderNotificationSettings(),),
  // GetPage(name: AppRoutes.helpFaqScreen, page: () => HelpFaqScreen(),),
  // GetPage(name: AppRoutes.riderContactDispatch, page: () => RiderContactDispatch(),),
  // GetPage(name: AppRoutes.privacyTermsScreen, page: () => PrivacyTermsScreen(),),


];