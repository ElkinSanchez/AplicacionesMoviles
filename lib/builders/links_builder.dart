// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LinksBuilder extends StatelessWidget {
  final String data;
  final IconData icon;
  final TextStyle textStyle;
  // final VoidCallback onTap;

  const LinksBuilder(
      {super.key,
      required this.data,
      required this.icon,
      required this.textStyle});

  //Style

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Row(
            children: [
              Icon(
                icon,
                size: 50,
              ),
              Text(
                data,
                style: textStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
