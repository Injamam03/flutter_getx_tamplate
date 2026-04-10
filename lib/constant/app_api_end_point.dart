
class AppApiEndPoint {
  AppApiEndPoint._privateConstructor();
  static final AppApiEndPoint _instance = AppApiEndPoint._privateConstructor();
  static AppApiEndPoint get instance => _instance;

  // ===========  Domain configuration ================================
  static final String domain = _getDomain();
  static final String socket = _getDomain();
  final String baseUrl = "$domain/api/v1";

  // Auth endpoints
  String registar = "/users";
  String login = "/auth/login";
  String forgotPassword = "/auth/forget-password";
  String resetPassword = "/auth/reset-password";
  String verifyEmail = "/auth/verify-email";
  String resendOtp = "/auth/resend-otp";
  String verifyPhone = "/auth/verify-phone";

  // Profile Section
  String refreshToken = "/refreshToken";
  String userProfile = "/users/profile";
  String updateProfile = "/users";
  String myDeliveries = "/deliveries/my";

  String transactions = "/users/profile/transactions";
  // String updateProfileInfo = "/users";
  String changePassword = "/auth/change-password";
  String faq = "/faqs";
  String teams = "/teams";
  String deleteAccount = "/users/profile";
  String supports = "/supports";
  String requestLoginOtp = "/auth/request-login-otp";
  // ===================== Customer Home flow ==============================
  String deliveries = "/deliveries";
  String pricingEstimate = "/pricing/estimate";
  //=-=-=-==============================

  String deliveryCheckout = "/payments/delivery/checkout";
  String findingCouriers(String deliveryId) =>
      "/deliveries/$deliveryId/finding-couriers";
  String replyBid(String deliveryId) => "/deliveries/$deliveryId/reply-bid";
  String selectDriver(String deliveryId) =>
      "/deliveries/$deliveryId/select-driver";
  String cancelDelivery(String deliveryId) =>
      "/deliveries/$deliveryId/cancel"; //  new
  String changeInfo(String deliveryId) =>
      "/deliveries/$deliveryId/change-info"; // new

  final customerPayment = "/payments/delivery/checkout";

  // ========================= Voice call service ========================
  final voiceCallInitiate = "/call-sessions/initiate";
  final voiceCallAccept = "/call-sessions/accept";
  final voiceCallReject = "/call-sessions/reject";
  final voiceCallEnd = "/call-sessions/end";

  // ========================= Rider Section ============================
  final riderRegistrationBasicInfo = "/users/driver/registration/basic-info";
  final riderRegistrationVehicalInfo =
      "/users/driver/registration/vehicle-info";
  final riderRegistrationRequiredDocs =
      "/users/driver/registration/required-docs";
  final riderRegistrationRaferral = "/users/driver/registration/referral";
  final riderRegistrationSubmit = "/users/driver/registration/submit";
  final riderSetAvailability = "/users/driver/availability";
  final riderSetLocation = "/users/driver/location";
  final riderHomeRequest = "/deliveries/driver/home";
  final riderBid = "/deliveries/driver/bid";
  final riderEarning = "/users/profile/earnings";
  final riderDeliveryHistory = "/deliveries/driver/my";
  final riderTransactionHistory = "/transactions/driver-transactions";
  final riderProfileSummary = "/users/profile/summary?includeStats=true";
  String riderArrivedDropOff(String deliveryId) =>
      "/deliveries/$deliveryId/arrived-dropoff";
  String riderArrivedPickup(String deliveryId) =>
      "/deliveries/$deliveryId/arrived-pickup";
  String riderDelivered(String deliveryId) =>
      "/deliveries/$deliveryId/driver-delivered";
  String riderStartJourney(String deliveryId) =>
      "/deliveries/$deliveryId/start-journey";
  String riderAcceptOpen(String deliveryId) =>
      "/deliveries/$deliveryId/accept-open";
  String rateCustomer(String id) => "/deliveries/$id/rate";
  String riderCancelDelivery(String deliveryId) =>
      "/deliveries/$deliveryId/driver-cancel";

  //////////////////////////////////////////
  // ============== About us =============
  final aboutUs = "/about-us";
  String get createReview => "/app-reviews/create-review";
  String get getReviewsSummary => "/app-reviews/summary";

  // ================= Term and condition =============
  final termAndCondition = "/terms";

  // =================== Report User ================
  final reportUser = "/reports/user";

  // ========================= Switch Mode =================
  final userSwitchMode = "/users/switch-mode";

  // ========================= Chat Section =====================
  final sendMessage = "/messages";
  String getMessage(String deliveryId) => "/messages/$deliveryId";

  // ======================== Notification =========================
  final getNotification = "/notifications";
  String notificationMarkAsRead(String notificationId) =>
      "/notifications/read/$notificationId";

  String rateDriver(String deliveryId) => '/deliveries/$deliveryId/rate';
}

String _getDomain() {
  // const String liveServer = "http://195.35.6.13:5009";
  const String liveServer = "http://10.10.7.18:5009";
  // const String localServer = "https://tahsif5001.binarybards.online";
  // String liveServer = "10.10.7.51:5002";
  // String localServer = "10.10.7.51:5002";
  // try {
  //   if (kDebugMode) {
  //     return localServer;
  //   }
  // } catch (e) {
  //   errorLog("_getDomain", e);
  // }
  return liveServer;
}
