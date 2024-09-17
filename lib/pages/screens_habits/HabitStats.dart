import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../sections_app/header.dart';
import '../sections_app/footer.dart';

class HabitStats extends StatefulWidget {
  static const routename = '/habit-stats';
  const HabitStats({super.key});

  @override
  _HabitStatsState createState() => _HabitStatsState();
}

class _HabitStatsState extends State<HabitStats> {
  int totalHabits = 0;
  int amHabits = 0;
  int pmHabits = 0;

  @override
  void initState() {
    super.initState();
    _fetchHabitStats();
  }

  Future<void> _fetchHabitStats() async {
    try {
      QuerySnapshot habitSnapshot =
      await FirebaseFirestore.instance.collection('habits').get();

      int total = habitSnapshot.docs.length;
      int amCount = habitSnapshot.docs
          .where((doc) => doc['timeOfDay'] == 'AM')
          .length;
      int pmCount = habitSnapshot.docs
          .where((doc) => doc['timeOfDay'] == 'PM')
          .length;

      setState(() {
        totalHabits = total;
        amHabits = amCount;
        pmHabits = pmCount;
      });
    } catch (e) {
      print('Error fetching habit stats: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estadísticas de Hábitos',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Total de hábitos: $totalHabits', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Hábitos en la mañana (AM): $amHabits', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Hábitos en la tarde (PM): $pmHabits', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _fetchHabitStats,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Actualizar Estadísticas'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
      backgroundColor: const Color.fromARGB(255, 227, 237, 226),
    );
  }
}
