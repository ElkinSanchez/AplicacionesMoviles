import 'package:atomapp/builders/button_text_builder.dart';
import 'package:atomapp/builders/form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  static const routename = 'register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    //Padding-Label
    const edgeInsetsInput =
        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20);
    //Buttons Style
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 223, 223, 223)),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/iconAtom.svg',
                    width: 120,
                    height: 120,
                  ),
                ),
                const Text("¡Registrate!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38))
              ],
            ),
          ),
          FormBuilder(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Label correo electrónico
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 25),
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
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Confirmar contraseña",
                    ),
                  ),
                  const Padding(
                    padding: edgeInsetsInput,
                    child: FormBuilderCustom(
                      keyType: TextInputType.emailAddress,
                      name: 'password',
                      obscureText: false,
                      hintText: 'Confirmación',
                      icon: Icons.mail,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      margin:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonTextBuilder(data: "Registrarse Con Google"),
                          ButtonTextBuilder(data: "Registrarse")
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ), // Column Form
    );
  }
}
