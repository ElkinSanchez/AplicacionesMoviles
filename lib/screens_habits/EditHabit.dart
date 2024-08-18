import 'package:atomapp/sections_app/footer.dart';
import 'package:atomapp/sections_app/header.dart';
import 'package:flutter/material.dart';

class EditHabit extends StatefulWidget {
  static const routename = '/edit-habit';
  const EditHabit({
    super.key,
  });

  @override
  _EditHabitState createState() => _EditHabitState();
}

class _EditHabitState extends State<EditHabit> {
  bool isAMSelected = false;
  bool isPMSelected = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Puedes inicializar el controlador con un valor predeterminado si lo deseas
    _nameController.text = 'Nombre del hábito';
  }

  void _showConfirmationDialog(String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              action == 'update' ? 'Actualizar Hábito' : 'Eliminar Hábito'),
          content: Text(action == 'update'
              ? '¿Estás seguro de que deseas actualizar el hábito?'
              : '¿Estás seguro de que deseas eliminar el hábito?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí puedes manejar la acción de actualización o eliminación
                if (action == 'update') {
                  // Lógica para actualizar el hábito
                } else {
                  // Lógica para eliminar el hábito
                }
              },
              child: Text(action == 'update' ? 'Actualizar' : 'Eliminar'),
            ),
          ],
        );
      },
    );
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
              decoration: InputDecoration(
                labelText: 'Nombre del Hábito',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Descripción del hábito',
                hintText: 'Da un toque para modificar la descripción',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('¿En qué momento del día realizará su hábito?'),
            SizedBox(height: 10),
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
                    backgroundColor:
                        isAMSelected ? Colors.teal : Colors.grey[300],
                    foregroundColor: isAMSelected ? Colors.white : Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('AM'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAMSelected = false;
                      isPMSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isPMSelected ? Colors.teal : Colors.grey[300],
                    foregroundColor: isPMSelected ? Colors.white : Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text('PM'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _showConfirmationDialog('update'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Center(child: Text('Actualizar Hábito')),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showConfirmationDialog('delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Center(child: Text('Eliminar Hábito')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
