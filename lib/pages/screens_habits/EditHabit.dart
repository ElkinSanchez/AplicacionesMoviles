import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Importa FirebaseAuth
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
        const SnackBar(content: Text('Por favor, rellena todos los campos')),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario no autenticado')),
      );
      return;
    }

    try {
      if (habitId != null) {
        await FirebaseFirestore.instance.collection('habits').doc(habitId).update({
          'name': habitName,
          'description': habitDescription,
          'timeOfDay': timeOfDay,
          'userId': user.uid,  // Asegúrate de actualizar el userId
          'updatedAt': Timestamp.now(),
        });
      } else {
        await FirebaseFirestore.instance.collection('habits').add({
          'name': habitName,
          'description': habitDescription,
          'timeOfDay': timeOfDay,
          'userId': user.uid,  // Incluye el userId cuando creas el hábito
          'createdAt': Timestamp.now(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hábito guardado con éxito')),
      );

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushNamed('/gridHabits');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el hábito: $e')),
      );
    }
  }

  Future<void> _confirmDeleteHabit() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Estás seguro de que deseas eliminar este hábito?'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                _deleteHabit(); // Eliminar el hábito
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteHabit() async {
    if (habitId == null) return;

    try {
      await FirebaseFirestore.instance.collection('habits').doc(habitId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hábito eliminado con éxito')),
      );

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushNamed('/gridHabits');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el hábito: $e')),
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
            if (habitId != null)
              ElevatedButton(
                onPressed: _confirmDeleteHabit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Center(child: Text('Eliminar Hábito')),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
