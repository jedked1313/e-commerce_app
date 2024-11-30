import 'controller/test_controller.dart';
import 'core/class/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test View"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataIcons(
            statusRequests: controller.statusRequests,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
