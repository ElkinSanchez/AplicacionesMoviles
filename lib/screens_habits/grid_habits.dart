import 'package:flutter/material.dart';
class GridHabits extends StatelessWidget {
  static const String routename = '/gridHabits';  // Añade esta línea
  const GridHabits({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AtomApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Vamos a empezar!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Con nuestra aventura'),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
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
                          Icon(Icons.image, size: 50),
                          Text('Hábito'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
        },
        child: Icon(Icons.add),
      ),
    );
  }
}