class ApiLinks {
  // =============== Emulator API =============== //
  // static const String server = "http://10.0.2.2:8000/api";
  // static const String root = "http://10.0.2.2:8000/";
  static const String test = "https://jsonplaceholder.typicode.com/posts/1";

  // =============== Real Device API =============== //
  static const String server = "http://localhost:8000/api";
  static const String root = "http://localhost:8000/";

  // =============== Auth =============== //
  static const String signup = "$server/auth/signup";
  static const String login = "$server/auth/login";
  static const String confirmEmail = "$server/auth/confirm_email";
  static const String forgotPassword = "$server/auth/forgot_password";
  static const String verifyCode = "$server/auth/verify_code";
  static const String resetPassword = "$server/auth/reset_password";
  static const String sendCodeAgain = "$server/auth/send_verifycode";

  // =============== Home =============== //
  static const String home = "$server/home";

  // =============== Categories =============== //
  static const String categories = "$server/categories";
  static const String categoryItems = "$server/category_items";

  // =============== Items =============== //
  static const String items = "$server/items";

  // =============== Favorites =============== //
  static const String favorites = "$server/favorites";
  static const String addOrRemoveFavorite = "$server/favorites/add_or_remove";

  // =============== Cart =============== //
  static const String cart = "$server/cart";
  static const String addToCart = "$server/cart/add";
  static const String removeFromCart = "$server/cart/remove";
  static const String increaseAmount = "$server/cart/increase";
  static const String decreaseAmount = "$server/cart/decrease";
}
