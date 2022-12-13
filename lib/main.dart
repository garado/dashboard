
/* █▀▄▀█ ▄▀█ █ █▄░█ */
/* █░▀░█ █▀█ █ █░▀█ */

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'home/screen.dart';
import 'agenda/screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/agenda': (context) => const AgendaScreen(),
      },
      themeAnimationDuration: Duration.zero,
    );
  }
}

