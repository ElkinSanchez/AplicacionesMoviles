import 'package:atomapp/sections_app/header.dart';
import 'package:flutter/material.dart';

import 'grid_habits.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: GridHabits(),
      backgroundColor: Color.fromARGB(255, 227, 237, 226),
    );
  }
}
