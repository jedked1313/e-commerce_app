import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.icon,
      this.hint,
      required this.label,
      required this.controller,
      this.obscureText,
      this.onTapShow,
      required this.valid});
  final IconData icon;
  final String? hint;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?) valid;
  final bool? obscureText;
  final Function()? onTapShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
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
                  fillColor: AppColor.grey.shade200,
                  filled: true,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
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
