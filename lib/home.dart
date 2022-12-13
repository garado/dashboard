
/* █░█ █▀█ █▀▄▀█ █▀▀    ▀█▀ ▄▀█ █▄▄ */ 
/* █▀█ █▄█ █░▀░█ ██▄    ░█░ █▀█ █▄█ */ 

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:global_configuration/global_configuration.dart';
import 'dart:math';

import 'utils.dart';

/* Assemble widgets */
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      children: [ 
      // COLUMN 1
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Profile(),
          Box( w: DateAndTime() ),
          Box( w: Goals() ),
        ],
      ),
     
      // COLUMN 2
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Box( w: UpcomingEvents() ),
          Box( w: UpcomingTasks() ),
          Box( w: MonthlySpending() ),
        ],
      ),

      // COLUMN 3
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Box( w: Timewarrior() ),
          Box( w: Habits() ),
        ],
      ),
      ],
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
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Image.asset(
            'assets/images/pfp.png',
            height: 100,
          ),
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
    return Column (
      children: const [
        WidgetHeader(text: 'Goals'),
      ]
    );
  }
}

class UpcomingEvents extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Column (
      children: const [
        WidgetHeader(text: 'Habits'),
      ],
    ); 
  }
}
