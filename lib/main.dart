import 'package:atomapp/screens_habits/EditHabit.dart';
import 'package:atomapp/screens_habits/grid_habits.dart';
import 'package:atomapp/screens_user/config.dart';
import 'package:atomapp/screens_user/login.dart';
import 'package:atomapp/screens_user/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtomApp',
      initialRoute: Config.routename,
      routes: {
        Register.routename: (context) => const Register(),
        Login.routename: (context) => const Login(),
        GridHabits.routename: (context) => const GridHabits(),
        EditHabit.routename: (context) => const EditHabit(),
        Config.routename: (context) => const Config(),
      },
    );
  }
}
