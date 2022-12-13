
/* █▀▄▀█ ▄▀█ █ █▄░█ */
/* █░▀░█ █▀█ █ █░▀█ */

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'navrail.dart';
import 'home/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); /* ??? */
  await GlobalConfiguration().loadFromAsset("user");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cozy',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF16161D),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFFDCD7BA)
        ),
      ),
      home: Scaffold(
          body: Center(
            child: Row(
              children: [
                const NavRail(),
                HomeTab(),
                //AgendaTab(),
              ],
            )
          )
        ),
    );
  }
}

