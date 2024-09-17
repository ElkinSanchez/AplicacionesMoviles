import 'package:flutter/material.dart';
import '../screens_habits/HabitStats.dart';
import '../screens_user/config.dart';

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
        NavigationDestination(icon: Icon(Icons.settings), label: "Configuración"),
        NavigationDestination(icon: Icon(Icons.bar_chart), label: "Estadísticas"), // Nuevo botón
      ],
      selectedIndex: _currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _currentIndex = index;

          if (index == 0) {
            Navigator.of(context).pushNamed('/gridHabits');
          } else if (index == 1) {
            Navigator.pushNamed(context, Config.routename);
          } else if (index == 2) {
            Navigator.pushNamed(context, HabitStats.routename); // Navegar a la pantalla de estadísticas
          }
        });
      },
    );
  }
}
