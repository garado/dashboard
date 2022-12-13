
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import '../utils.dart';

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
        RichText(
          text: TextSpan(
            text: displayname,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xFF2D4F67),
            ),
          ), 
        ),
        Text(title),
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
    String time = DateFormat('kk:mm').format(now);
    String date = DateFormat('EEE d MMM').format(now);
    
    return Column(
      children: [
        //Text(time),
        RichText(
          text: TextSpan(
            text: time,
            style: const TextStyle(
              fontSize: 30,
              color: Color(0xFF2D4F67),
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: date,
            style: const TextStyle(
              color: Color(0xFFDCD7BA),
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
      children: [
        const WidgetHeader(text: 'Current Goals'),
        Text(goals[0]), // TODO: make for loop
        Text(goals[1]),
        Text(goals[2]),
      ]
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: const [
        WidgetHeader(text: 'Events'),
      ],
    ); 
  }
}

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column (
      children: const [
        WidgetHeader(text: 'Tasks'),
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
      children: const [
        WidgetHeader(text: 'Monthly Spending'),
      ],
    ); 
  }
}

class Timewarrior extends StatelessWidget {
  const Timewarrior({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column (
      children: const [
        WidgetHeader(text: 'Timewarrior'),
      ],
    ); 
  }
}

class Habits extends StatelessWidget {
  const Habits({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column (
      children: const [
        WidgetHeader(text: 'Habits'),
      ],
    ); 
  }
}
