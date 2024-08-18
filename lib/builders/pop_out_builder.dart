import 'package:atomapp/builders/button_icon_builder.dart';
import 'package:flutter/material.dart';

class PopOut extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  const PopOut(
      {super.key,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(title),
            Text(subtitle),
            ButtonIconBuilder(
              icon: icon,
            )
          ],
        ),
      ),
    );
  }
}
