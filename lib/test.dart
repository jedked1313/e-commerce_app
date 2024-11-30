import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: Get.width / 2,
          child: CustomButton(
            text: "Click",
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                        onConfirm: () {},
                        onCancel: () {
                          Get.back();
                        },
                        context: context,
                        icon: Icons.cancel_outlined,
                        iconColor: Colors.red,
                        title: "Warning",
                        content: "Invalid Password !",
                        buttonTitle: 'OK',
                      ));
            },
          ),
        ),
      ),
    );
  }
}
