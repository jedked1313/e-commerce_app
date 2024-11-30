import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'package:e_commerce/core/middleware/appmiddleware.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/confirmemail.dart';
import 'package:e_commerce/view/screen/auth/success.dart';
import 'package:e_commerce/view/screen/auth/forgotpassword.dart';
import 'package:e_commerce/view/screen/auth/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/verifycode.dart';

// =============== Screen Sequence =============== //
// onBoarding() => Login()
// Login() => if account confirmed => Home() => otherwise => confirmEmail() => Success() => Home()
// Signup() => confirmEmail() => Success() => Home()
// forgotPassword() => VerifyCode() => ResetPassword() => Success() => Login()

List<GetPage<dynamic>>? routes = [
  // =============== OnBoarding =============== //
  GetPage(
      name: "/",
      page: () => const OnBoarding(),
      middlewares: [AppMiddleWare()]),

  // =============== Auth =============== //
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.confirmEmail, page: () => const ConfirmEmail()),
  GetPage(name: AppRoute.success, page: () => const Success()),
  GetPage(name: AppRoute.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),

  // =============== Home =============== //
  GetPage(name: AppRoute.home, page: () => const Home()),
];
