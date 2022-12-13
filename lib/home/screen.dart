
/* █░█ █▀█ █▀▄▀█ █▀▀    ▀█▀ ▄▀█ █▄▄ */ 
/* █▀█ █▄█ █░▀░█ ██▄    ░█░ █▀█ █▄█ */ 

import 'package:flutter/material.dart';
import 'widget.dart';
import '../navrail.dart';
import '../utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavRail(),
          Expanded(
            child: _HomeScreen(),
            ),
        ],
      ),
    );
  }
}

/* Assemble widgets */
class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      children: [ 
        Expanded(
          flex: 3,
          child: Column1(),
          ),
        Expanded(
          flex: 4,
          child: Column2(),
          ),
        Expanded(
          flex: 3,
          child: Column3(),
          ),
      ],
    );
  }
}

class Column1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Box(
            w: Profile(),
            bg: const Color(0xFF16161D) ),
          ),

        Expanded(
          flex: 2,
          child: Box(w: DateAndTime()),
          ),

        Expanded(
          flex: 3,
          child: Box(w: Goals()),
          ),

        Expanded(
          flex: 2,
          child: Box(w: MusicPlayer()),
          ),
        ],
      );
  }
}

class Column2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Box(w: UpcomingEvents()),
          ),

        Expanded(
          flex: 2,
          child: Box(w: UpcomingTasks()),
          ),

        Expanded(
          flex: 2,
          child: Box(w: MonthlySpending()),
          ),
        ],
      );
  }
}

class Column3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Box(w: Timewarrior()),
          ),

        Expanded(
          flex: 2,
          child: Box(w: Habits()),
          ),
        ],
      );
  }
}

