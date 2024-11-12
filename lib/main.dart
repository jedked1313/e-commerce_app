import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/localization/changelocale.dart';
import 'package:e_commerce/core/localization/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleContoller contoller = Get.put(LocaleContoller());
    return GetMaterialApp(
      locale: contoller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        colorSchemeSeed: AppColor.primaryColor,
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return const Icon(Icons.arrow_back_ios_new_rounded);
          },
        ),
        fontFamily: (myServices.sharedPreferences.getString("langcode") == "ar")
            ? "Rubik" // For Arabic language
            : "Mulish", // For others
        useMaterial3: true,
      ),
      getPages: routes,
    );
  }
}
