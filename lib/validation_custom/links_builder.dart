// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LinksBuilder extends StatelessWidget {
  final String data;
  final String? icon;

  const LinksBuilder({super.key, required this.data, required this.icon})
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon as IconData?),
      title: Text(data) ,
    );
  }
}
