import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key, required Function() onChecked});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(
          "rememer_me".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        trailing: Switch(
            activeTrackColor: const Color.fromARGB(255, 0, 255, 149),
            value: true,
            onChanged: (bool val) {}));
  }
}
