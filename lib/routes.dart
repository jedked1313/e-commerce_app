import 'package:e_commerce/core/middleware/appmiddleware.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/language.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/checkemail.dart';
import 'view/screen/auth/success.dart';
import 'view/screen/auth/forgotpassword.dart';
import 'view/screen/auth/resetpassword.dart';
import 'view/screen/auth/verifycode.dart';

List<GetPage<dynamic>>? routes = [
  // ----- Auth ----- //
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.checkEmail, page: () => const CheckEmail()),
  GetPage(name: AppRoute.success, page: () => const Success()),
  GetPage(name: AppRoute.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  // ----- OnBoarding ----- //
  GetPage(name: "/", page: () => const OnBoarding(),middlewares: [AppMiddleWare()]),
];
