import 'package:flutter/material.dart';

var style = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: const Color.fromARGB(255, 11, 167, 136),
  minimumSize: const Size(420, 60), // Ancho: 150, Alto: 60
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5), // Esquinas redondeadas de 5 píxeles
  ),
  textStyle: const TextStyle(color: Colors.black),
);

class ButtonTextBuilder extends StatelessWidget {
  final String data;

  const ButtonTextBuilder({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
        style: style,
        child: Column(
          children: [Text(data)],
        ));
  }
}
