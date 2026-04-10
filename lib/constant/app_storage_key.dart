class AppStorageKey {
  AppStorageKey._privateConstructor();
  static final AppStorageKey _instance = AppStorageKey._privateConstructor();
  static AppStorageKey get instance => _instance;

  // Authentication
  String token = "token";
  String resetToken = "resetToken";

  // User data
  String userData = "userData";
  String userRole = "userRole";

  // Onboarding
  String onboard = "onboard";

  // Settings
  String language = "language";
  String country = "country";
  String riderUserData = "riderUserData";
}







