
/* █▀▄▀█ ▄▀█ █ █▄░█ */
/* █░▀░█ █▀█ █ █░▀█ */

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'home.dart';

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
      title: 'Cozy',
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              VerticalAppBar(),
              HomeTab(),
            ],
          )
        )
      ),
    );
  }
}

class VerticalAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: AppBar(
        primary: false,
        title: const Text('Bar'),
      ),
    );
  }
}
