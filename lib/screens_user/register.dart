// ignore_for_file: use_build_context_synchronously

import 'package:atomapp/builders/button_text_builder.dart';
import 'package:atomapp/builders/form_builder.dart';
import 'package:atomapp/builders/snack_bar.dart';
import 'package:atomapp/screens_habits/grid_habits.dart';
import 'package:atomapp/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    //Autentification User
    final AuthUser auth = AuthUser();
    //Styles INkwell
    const styleInkWell = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 11, 167, 136),
    );
    //Padding-Label
    const edgeInsetsInput =
        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20);
    //Buttons Style
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 223, 223, 223)),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 38))
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
                    Padding(
                      padding: edgeInsetsInput,
                      child: FormBuilderCustom(
                        keyType: TextInputType.emailAddress,
                        name: 'email',
                        obscureText: false,
                        hintText: 'alguien@email.com',
                        icon: Icons.mail,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Email requerido'),
                          FormBuilderValidators.email(
                              errorText: 'Email no válido')
                        ]),
                      ),
                    ),
                    //Label contraseña
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Contraseña",
                      ),
                    ),
                    Padding(
                      padding: edgeInsetsInput,
                      child: FormBuilderCustom(
                        keyType: TextInputType.emailAddress,
                        name: 'password',
                        obscureText: true,
                        hintText: '**********',
                        icon: Icons.mail,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Contraseña requerido'),
                          FormBuilderValidators.password(
                            errorText:
                                "Debe tener mínimo:\n-Una mayúscula \n-Un número \n -Caracter especial ",
                          )
                        ]),
                      ),
                    ),
                    Container(
                      height: 200,
                      margin:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // ButtonTextBuilder(data: "Registrarse Con Google"),
                          ButtonTextBuilder(
                            data: "Registrarse",
                            onPressed: () async {
                              _formkey.currentState?.save();
                              if (_formkey.currentState?.validate() == true) {
                                //Recolectamos la info. suministrada por el user
                                final dataUser = _formkey.currentState?.value;
                                //La mandamos por la instancia para que cree el user
                                var result = await auth.createAccount(
                                    dataUser?['email'], dataUser?['password']);
                                //Válidamos errores que pueda haberse cometido
                                switch (result) {
                                  case 1:
                                    {
                                      showSnackBar(context,
                                          "La contraseña es muy débil");
                                    }
                                  case 2:
                                    {
                                      showSnackBar(context,
                                          "El email ya está siendo usado");
                                    }
                                  default:
                                    {
                                      Navigator.popAndPushNamed(
                                          context, GridHabits.routename);
                                    }
                                }
                              }
                            },
                          ),
                          const Text(
                            "Ó",
                            style: styleInkWell,
                          ),
                          InkWell(
                            onTap: () {},
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            child: const Text(
                              "Iniciar Sesión",
                              style: styleInkWell,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ), // Column Form
    );
  }
}
