import 'package:atomapp/validation_custom/form_builder.dart';
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
    var style = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 11, 167, 136),
      minimumSize: const Size(10, 60),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5), // Esquinas redondeadas de 5 píxeles
      ),
      textStyle: const TextStyle(color: Colors.black),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 223, 223, 223)),
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/iconAtom.svg',
                      width: 70,
                      height: 70,
                    ),
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
                  //Label contraseña
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () => {},
                              style: style,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Registrarse con Google"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.g_mobiledata,
                                    size: 50,
                                  )
                                ],
                              )),
                          ElevatedButton(
                              onPressed: () => {},
                              style: style,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Registrarse"),
                                ],
                              )),
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
