import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../sections_app/header.dart';
import '../sections_app/footer.dart';

class EditHabit extends StatefulWidget {
  static const routename = '/edit-habit';
  const EditHabit({super.key});

  @override
  _EditHabitState createState() => _EditHabitState();
}

class _EditHabitState extends State<EditHabit> {
  bool isAMSelected = false;
  bool isPMSelected = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? habitId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final habitData = ModalRoute.of(context)?.settings.arguments as Map?;
    if (habitData != null) {
      habitId = habitData['id'];
      _nameController.text = habitData['name'];
      _descriptionController.text = habitData['description'];
      isAMSelected = habitData['timeOfDay'] == 'AM';
      isPMSelected = habitData['timeOfDay'] == 'PM';
    }
  }

  Future<void> _saveHabit() async {
    String habitName = _nameController.text.trim();
    String habitDescription = _descriptionController.text.trim();
    String timeOfDay = isAMSelected ? 'AM' : 'PM';

    if (habitName.isEmpty || habitDescription.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, rellena todos los campos')),
      );
      return;
    }

    try {
      if (habitId != null) {
        // Actualiza el hábito existente
        await FirebaseFirestore.instance.collection('habits').doc(habitId).update({
          'name': habitName,
          'description': habitDescription,
          'timeOfDay': timeOfDay,
          'updatedAt': Timestamp.now(),
        });
      } else {
        // Crear un nuevo hábito
        await FirebaseFirestore.instance.collection('habits').add({
          'name': habitName,
          'description': habitDescription,
          'timeOfDay': timeOfDay,
          'createdAt': Timestamp.now(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hábito guardado con éxito')),
      );

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushNamed('/gridHabits');

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el hábito: $e')),
      );
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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Hábito',
                hintText: 'Nombre del Hábito',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Descripción del hábito',
                hintText: 'Da un toque para modificar la descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text('¿En qué momento del día realizará su hábito?'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAMSelected = true;
                      isPMSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAMSelected ? Colors.teal : Colors.grey[300],
                    foregroundColor: isAMSelected ? Colors.white : Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('AM'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAMSelected = false;
                      isPMSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPMSelected ? Colors.teal : Colors.grey[300],
                    foregroundColor: isPMSelected ? Colors.white : Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('PM'),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _saveHabit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Center(child: Text('Guardar Hábito')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}