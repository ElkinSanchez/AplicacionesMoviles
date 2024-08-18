import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
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
              icon: Icon(Icons.notifications), label: "Notificaciones"),
          NavigationDestination(
              icon: Icon(Icons.settings), label: "Configuración")
        ],
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        });
  }
}
