import 'package:e_commerce/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/bindings/initialbinding.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/core/localization/changelocale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleContoller controller = Get.put(LocaleContoller());
    return GetMaterialApp(
      locale: controller.language,
      translations: controller.selectLocalization(),
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
