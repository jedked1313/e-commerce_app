import 'package:e_commerce/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            controller.settingsList[index]["name"],
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Icon(
            controller.settingsList[index]["icon"],
            size: 35,
          ),
          onTap: () => controller.settingsList[index]["ontap"](),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 12),
        itemCount: controller.settingsList.length,
      ),
    );
  }
}
