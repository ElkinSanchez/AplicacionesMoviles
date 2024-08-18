import 'package:atomapp/builders/pop_out_builder.dart';
import 'package:atomapp/sections_app/footer.dart';
import 'package:atomapp/sections_app/header.dart';
import 'package:atomapp/builders/links_builder.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  static const routename = 'config';
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  //Function notification
  //var noti;

  //Styles View
  var paddingText = const EdgeInsets.all(10);
  var fontTitle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 35);
  var fontBody = const TextStyle(color: Color.fromARGB(255, 39, 91, 41));

  //Widgets Links to others views from
  var textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Color.fromARGB(255, 39, 91, 41));

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
    //Link(Widget) logic
    final List<VoidCallback> onTaps = [
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserInfoScreen()));
      },
    ];
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
                Container(
                  margin: const EdgeInsets.all(10),
                  child: LinksBuilder(
                      // onTap: onTaps[i],
                      data: dynamicData[i],
                      icon: icons[i],
                      textStyle: textStyle,
                      onTap: onTaps[i]),
                ),
            ],
          ),
          const PopOut(
            color: Color.fromARGB(255, 179, 225, 200),
            title: "Califícanos en la AppStore",
            subtitle: 'Tus comentarios y opiniones nos ayudan a mejorar :)',
            icon: Icons.star_border_outlined,
          )
        ],
      ),
      bottomNavigationBar: const Footer(),
      backgroundColor: const Color.fromARGB(255, 227, 237, 226),
    );
  }
}

class UserInfoScreen {}
