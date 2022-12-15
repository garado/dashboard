
/* █░█ █▀█ █▀▄▀█ █▀▀    █░█░█ █ █▀▄ █▀▀ █▀▀ ▀█▀ █▀ */ 
/* █▀█ █▄█ █░▀░█ ██▄    ▀▄▀▄▀ █ █▄▀ █▄█ ██▄ ░█░ ▄█ */ 

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import '../../utils.dart';

/* Shows profile picture and title. */
class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final displayname = GlobalConfiguration().getValue("displayname");
  final titles = GlobalConfiguration().getValue("titles");
  final _random = Random();
  late final title = titles[_random.nextInt(titles.length)];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF2D4F67),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Image.asset(
            'assets/images/pfp.png',
            height: 100,
          ),
        ),
        const Padding(padding: EdgeInsets.all(5.0)),
        WText(
          text: displayname,
          color: const Color(0xFF2D4F67),
          padding: 0.0),
        WText(
          text: title,
          color: const Color(0xFFDCD7BA),
          fontFamily: 'RobotoMono',
          padding: 0,
          size: 15.0,
          ),
      ],
    );
  }
}

/* Displays date and time. */
class DateAndTime extends StatelessWidget {
  const DateAndTime ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('h:mm a').format(now);
    String date = DateFormat('EEEE MMMM d').format(now);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WText(
          text: time,
          color: const Color(0xFFDCD7BA),
          padding: 0.0,
          size: 35.0,
        ),
        RichText(
          text: TextSpan(
            text: date,
            style: const TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 16,
              color: Color(0xFF2D4F67),
            ),
          ),
        ),
      ],
    );
  }
}

/* Shows goals defined in user config file. */
class Goals extends StatelessWidget {
  Goals({Key? key}) : super(key: key);

  final goals = GlobalConfiguration().getValue("goals");
  
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const WText(text: 'Current Goals'),
        for (String g in goals) WText(
          size: 15.0,
          fontFamily: 'RobotoMono',
          padding: 2.0,
          text: g,
          ),
      ]
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        WText(text: 'Events'),
      ],
    ); 
  }
}

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        WText(text: 'Tasks'),
      ],
    ); 
  }
}

class MonthlySpending extends StatelessWidget {
  MonthlySpending({Key? key}) : super(key: key);
  
  final Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        WText(text: 'Monthly Spending'),
      ],
    ); 
  }
}

class Timewarrior extends StatelessWidget {
  const Timewarrior({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        WText(text: 'Timewarrior'),
      ],
    ); 
  }
}
