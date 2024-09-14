import 'package:atomapp/sections_app/footer.dart';
import 'package:atomapp/sections_app/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firebase Firestore
import 'package:flutter/material.dart';

class GridHabits extends StatelessWidget {
  static const String routename = '/gridHabits'; // Añade esta línea
  const GridHabits({
    super.key,
  });

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
              '¡Vamos a empezar!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Con nuestra aventura'),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('habits')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No hay hábitos aún'));
                  }

                  final habits = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      final habit = habits[index];

                      return GestureDetector(
                        onTap: () {
                          // Acción al hacer clic en el hábito
                        },
                        child: Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.image, size: 50),
                                Text(habit['name'] ?? 'Hábito'),
                                Text(habit['timeOfDay'] ?? ''),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/edit-habit');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
