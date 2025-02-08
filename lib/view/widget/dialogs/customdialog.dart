import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.context,
    required this.icon,
    required this.title,
    required this.content,
    this.iconColor,
    this.onConfirm,
    this.onCancel,
    required this.buttonTitle,
  });
  final BuildContext? context;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final String title;
  final String content;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      actionsPadding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      icon: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: iconColor == null
              ? AppColor.primaryColor.withValues(alpha: 0.4)
              : iconColor!.withValues(alpha: 0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColor.primaryColor,
          size: 65,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
          width: Get.width,
          child: Text(content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall)),
      actions: [
        Row(
          children: [
            // Show Cancel button when passing onCancel() method, otherwise leave space
            onCancel != null
                ? Expanded(
                    child: CustomOutlineButton(
                        text: "cancel".tr, onPress: onCancel))
                : const Spacer(),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: CustomButton(
                text: buttonTitle,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
