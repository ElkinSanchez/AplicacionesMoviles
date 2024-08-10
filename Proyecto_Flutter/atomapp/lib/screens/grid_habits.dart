import 'package:flutter/material.dart';

class GridHabits extends StatelessWidget {
  const GridHabits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "¡Vamos a Empezar!",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text("Con nuestra aventura",
          style: TextStyle(color: Color.fromARGB(255, 33, 87, 34))),
      Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          primary: false,
          children: [
            Container(
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    ]);
  }
}
