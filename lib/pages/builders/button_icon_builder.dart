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

class ButtonIconBuilder extends StatelessWidget {
  final IconData icon;

  const ButtonIconBuilder({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ElevatedButton(
          onPressed: () => {},
          style: style,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Icon(icon),
              Icon(icon),
              Icon(icon),
              Icon(icon)
            ],
          )),
    );
  }
}
