import 'package:atomapp/pages/builders/button_text_builder.dart';
import 'package:atomapp/pages/builders/form_builder.dart';
import 'package:atomapp/pages/builders/snack_bar.dart';
import 'package:atomapp/pages/screens_habits/grid_habits.dart';
import 'package:atomapp/pages/sections_app/footer.dart';
import 'package:atomapp/pages/sections_app/header.dart';
import 'package:flutter/material.dart';
import 'package:atomapp/utils/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
    var paddingText = const EdgeInsets.all(10);
    var fontTitle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 35);
    const styleInkWell = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 11, 167, 136),
    );
    //Autentification User
    final AuthUser auth = AuthUser();
    //Padding-Label
    const edgeInsetsInput =
        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20);
    return Scaffold(
      appBar: const Header(),
      backgroundColor: const Color.fromARGB(255, 234, 242, 238),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: paddingText,
                  child: Center(
                    child: Text(
                      'Cambio de Datos',
                      style: fontTitle,
                    ),
                  ),
                ),
                FormBuilder(
                    key: _formkey,
                    child: Container(
                      margin: edgeInsetsInput,
                      color: const Color.fromARGB(255, 179, 225, 200),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //Label correo electrónico
                            Text(
                              "Correo electrónico",
                              style: styleInkWell,
                            ),
                            Padding(
                              padding: edgeInsetsInput,
                              child: FormBuilderCustom(
                                keyType: TextInputType.emailAddress,
                                name: 'email',
                                obscureText: false,
                                hintText: 'alguien@email.com',
                                icon: Icons.mail,
                              ),
                            ),
                            //Label contraseña
                            Text(
                              "Nombre Usuario",
                              style: styleInkWell,
                            ),
                            Padding(
                              padding: edgeInsetsInput,
                              child: FormBuilderCustom(
                                keyType: TextInputType.emailAddress,
                                name: 'user name',
                                obscureText: true,
                                hintText: 'Tu nickname',
                                icon: Icons.mail,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: paddingText,
                  child: Center(
                    child: Text(
                      'Cambiar Contraseña',
                      style: fontTitle,
                    ),
                  ),
                ),
                FormBuilder(
                    child: Container(
                  margin: edgeInsetsInput,
                  color: const Color.fromARGB(255, 179, 225, 200),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //Label correo electrónico
                        Text(
                          "Contraseña Actual",
                          style: styleInkWell,
                        ),
                        Padding(
                          padding: edgeInsetsInput,
                          child: FormBuilderCustom(
                            keyType: TextInputType.emailAddress,
                            name: 'password',
                            obscureText: false,
                            hintText: '**********',
                            icon: Icons.mail,
                          ),
                        ),
                        //Label contraseña
                        Text(
                          "Nueva Contraseña",
                          style: styleInkWell,
                        ),
                        Padding(
                          padding: edgeInsetsInput,
                          child: FormBuilderCustom(
                            keyType: TextInputType.emailAddress,
                            name: 'password',
                            obscureText: true,
                            hintText: '**********',
                            icon: Icons.mail,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
