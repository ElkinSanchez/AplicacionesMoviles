import 'package:atomapp/builders/pop_out_builder.dart';
import 'package:atomapp/screens_habits/grid_habits.dart';
import 'package:atomapp/sections_app/footer.dart';
import 'package:atomapp/sections_app/header.dart';
import 'package:atomapp/builders/links_builder.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  static const routename = '/config';
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  //Styles View
  var fontBody = const TextStyle(color: Color.fromARGB(255, 39, 91, 41));

  //Text Showing in the link
  final List<String> dynamicData = [
    "Información del usuario",
    "Desactivar Cuenta",
    "Compartir Hábitos Con Amigos",
  ];

  //Different types of icons
  final List<IconData> icons = [
    Icons.person_outline_outlined,
    Icons.person_remove_alt_1_outlined,
    Icons.share_outlined,
  ];

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    //Link(Widget) logic
    final List<VoidCallback> onTaps = [
          () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const GridHabits()));
      },
          () {},
          () {}
    ];


    var paddingText = EdgeInsets.all(screenWidth * 0.03);
    var fontTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * 0.05,
    );
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * 0.02,
      color: const Color.fromARGB(255, 39, 91, 41),
    );

    return Scaffold(
      appBar: const Header(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
            ],
          ),
          Column(
            children: [
              for (int i = 0; i < dynamicData.length; i++)
                if (i < icons.length && i < onTaps.length)
                  Container(
                    margin: EdgeInsets.all(screenWidth * 0.03),
                    child: LinksBuilder(
                      data: dynamicData[i],
                      icon: icons[i],
                      textStyle: textStyle,
                      onTap: onTaps[i],
                    ),
                  )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
      backgroundColor: const Color.fromARGB(255, 227, 237, 226),
    );
  }
}
