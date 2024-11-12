import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            thickness: 2,
          )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
          const Expanded(
              child: Divider(
            thickness: 2,
          ))
        ],
      ),
    );
  }
}
