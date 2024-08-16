import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  static const routeName = 'config';
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  var paddingText = const EdgeInsets.all(10);
  var fontTitle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 35);
  var fontBody = const TextStyle(color: Color.fromARGB(255, 39, 91, 41));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AtomApp',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black,
              height: 1,
            )),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: paddingText,
                  child: Text(
                    "¡Hola! (NameUser) ",
                    style: fontTitle,
                  ),
                ),
                Text(
                  "Configuración",
                  style: fontBody,
                ),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_outline_outlined),
                        InkWell(
                          onTap: () {},
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Text(
                            "Información del usuario",
                            style: fontBody,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_remove_alt_1_outlined),
                        InkWell(
                          onTap: () {},
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Text("Desactivar Cuenta", style: fontBody),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Row(
                            children: [
                              const Icon(Icons.share_outlined),
                              Text(
                                "Compartir Hábitos Con Amigos",
                                style: fontBody,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 227, 237, 226),
    );
  }
}
