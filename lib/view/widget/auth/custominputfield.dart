import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.icon,
      this.hint,
      this.label,
      required this.controller,
      this.obscureText,
      this.onTapShow,
      required this.valid,
      this.canCopyPaste,
      this.textAlign,
      this.bottomMargin});
  final IconData icon;
  final String? hint;
  final String? label;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final String? Function(String?) valid;
  final bool? obscureText;
  final bool? canCopyPaste;
  final double? bottomMargin;
  final Function()? onTapShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: bottomMargin ?? 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                )
              : const SizedBox.shrink(), // Instead of null ^__^
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              enableInteractiveSelection: canCopyPaste,
              validator: valid,
              obscureText:
                  obscureText == null || obscureText == false ? false : true,
              controller: controller,
              decoration: InputDecoration(
                  // Show suffix icon when argument (obscureText) passed to inputfield
                  suffixIcon: obscureText == null
                      ? null
                      : InkWell(
                          onTap: onTapShow,
                          child: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColor.grey,
                          ),
                        ),
                  fillColor: AppColor.ligthGrey,
                  filled: true,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(
                    icon,
                    color: AppColor.grey,
                    size: 30,
                  ),
                  focusColor: AppColor.grey,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: hint),
            ),
          ),
        ],
      ),
    );
  }
}
