import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {super.key, required this.image, required Function() onPress});
  final String image;
  void onPress() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onPress,
        child: Image.asset(
          image,
          height: 40,
        ),
      ),
    );
  }
}
