import 'package:atomapp/pages/screens_habits/HabitStats.dart';
import 'package:atomapp/preferences/pref_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:atomapp/pages/screens_habits/EditHabit.dart';
import 'package:atomapp/pages/screens_habits/grid_habits.dart';
import 'package:atomapp/pages/screens_user/config.dart';
import 'package:atomapp/pages/screens_user/login.dart';
import 'package:atomapp/pages/screens_user/register.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciaUsuario.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciaUsuario();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtomApp',
      initialRoute: prefs.ultimaPagina,
      routes: {
        Register.routename: (context) => const Register(),
        Login.routename: (context) => const Login(),
        GridHabits.routename: (context) => const GridHabits(),
        EditHabit.routename: (context) => const EditHabit(),
        Config.routename: (context) => const Config(),
        HabitStats.routename: (context) => const HabitStats(),
      },
    );
  }

// ...
}
