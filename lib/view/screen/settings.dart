import 'package:e_commerce/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: GetBuilder<SettingsController>(
          builder: (controller) => ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final item = controller.settingsList[index];
              final isLogout = item.title == "logout".tr; // to specify the logout (red color)
              final isDarkModeSwitch = item.title == "dark_mode".tr; // To specify the dark moode switch toggle

              return ListTile(
                leading: item.leadingIcon,
                iconColor: isLogout ? Colors.red : null,
                title: Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isLogout ? Colors.red : null,
                    fontWeight: isLogout ? FontWeight.bold : null,
                  ),
                ),
                trailing: isDarkModeSwitch
                    ? Switch(
                        value: controller.isDarkMode,
                        onChanged: controller.toggleDarkMode,
                      )
                    : item.trailing,
                onTap: item.onTap,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: controller.settingsList.length,
          ),
        ),
      ),
    );
  }
}
