import 'package:flutter/material.dart';

import '../screens_user/config.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<Footer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: const Color.fromARGB(255, 11, 167, 136),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
        NavigationDestination(
            icon: Icon(Icons.settings), label: "Configuración")
      ],
      selectedIndex: _currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _currentIndex = index;

          if (index == 0) {
            // Navegar a la pantalla de gridHabits
            Navigator.of(context).pushNamed('/gridHabits');
          } else if (index == 1) {
            // Navegar a la pantalla de configuración
            Navigator.pushNamed(context, Config.routename);
          }
        });
      },
    );
  }
}
