import 'package:atomapp/pages/builders/button_icon_builder.dart';
import 'package:flutter/material.dart';

var fontTitle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 35);

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
            Text(
              title,
              style: fontTitle,
            ),
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
