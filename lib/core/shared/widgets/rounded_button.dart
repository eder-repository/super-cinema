import 'package:flutter/material.dart';
import 'package:super_cinema/core/utils/constans.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        decoration: BoxDecoration(
            color: SuperCinemaColors.yellow,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
