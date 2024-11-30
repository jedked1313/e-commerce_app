class ApiLinks {
  static const String server = "http://10.0.2.2:8000/api";
  static const String test = "https://jsonplaceholder.typicode.com/posts/1";

  // =============== Auth API =============== //
  static const String signup = "$server/auth/signup";
  static const String login = "$server/auth/login";
  static const String confirmEmail = "$server/auth/confirm_email";
  static const String forgotPassword = "$server/auth/forgot_password";
  static const String verifyCode = "$server/auth/verify_code";
  static const String resetPassword = "$server/auth/reset_password";
}
