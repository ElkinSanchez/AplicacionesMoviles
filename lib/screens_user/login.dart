import 'package:atomapp/builders/button_text_builder.dart';
import 'package:atomapp/builders/form_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  static const routename = 'login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    //Padding-Label
    const edgeInsetsInput =
        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20);

    // style InkWell
    const styleInkWell = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 11, 167, 136),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 223, 223, 223)),
            height: 200,
            child: Center(
              child: SvgPicture.asset(
                'assets/iconAtom.svg',
                width: 120,
                height: 120,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: Text("¡Bienvenido a Atom!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38)),
          ),
          FormBuilder(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label correo electrónico
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Correo electrónico",
                    ),
                  ),
                  const Padding(
                    padding: edgeInsetsInput,
                    child: FormBuilderCustom(
                      keyType: TextInputType.emailAddress,
                      name: 'email',
                      obscureText: false,
                      hintText: 'somebody@email.com',
                      icon: Icons.mail,
                    ),
                  ),
                  //Label contraseña
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Contraseña",
                    ),
                  ),
                  const Padding(
                    padding: edgeInsetsInput,
                    child: FormBuilderCustom(
                      keyType: TextInputType.emailAddress,
                      name: 'password',
                      obscureText: false,
                      hintText: 'Contraseña',
                      icon: Icons.mail,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(
                        child: ButtonTextBuilder(data: "Iniciar Sesión")),
                  ),
                  Padding(
                    padding: edgeInsetsInput,
                    child: InkWell(
                      highlightColor: Colors
                          .transparent, // Color al mantener presionado (transparente)
                      hoverColor: Colors
                          .transparent, // Color al pasar el mouse sobre el botón (transparente)
                      onTap: () {},
                      child: const Text(
                        "¿Olvidaste la contraseña?",
                        style: styleInkWell,
                      ),
                    ),
                  ),
                  Padding(
                    padding: edgeInsetsInput,
                    child: InkWell(
                      highlightColor: Colors
                          .transparent, // Color al mantener presionado (transparente)
                      hoverColor: Colors
                          .transparent, // Color al pasar el mouse sobre el botón (transparente)
                      onTap: () {},
                      child: const Text(
                        "Registrate",
                        style: styleInkWell,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ), // Column Form
    );
  }
}
