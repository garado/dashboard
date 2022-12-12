
/* █▀▄▀█ ▄▀█ █ █▄░█ */
/* █░▀░█ █▀█ █ █░▀█ */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:global_configuration/global_configuration.dart';
import 'dart:math';

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
        appBar: AppBar(
        ),
        body: Center(
          child: Column(
            children: [
              DateAndTime(),
              Profile(),
            ],
          )
        ),
      ),
    );
  }
}

/* Shows profile picture and title. */
class Profile extends StatelessWidget {
  final displayname = GlobalConfiguration().getValue("displayname");
  final titles = GlobalConfiguration().getValue("titles");
  final _random = Random();
  late var title = titles[_random.nextInt(titles.length)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Image.asset(
          'assets/images/pfp.png',
          height: 100,
        ),
        Text(displayname),
        Text(title),
      ],
    );
  }
}

/* Displays date and time. */
class DateAndTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('kk:mm').format(now);
    String date = DateFormat('EEE d MMM').format(now);
    return Column(
      children: [
        Text(time),
        Text(date),
      ],
    );
  }
}

/* Shows goals defined in user config file. */
class Goals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Goals');
  }
}

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Hi');
  }
}
