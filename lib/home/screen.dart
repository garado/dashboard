
/* █░█ █▀█ █▀▄▀█ █▀▀    ▀█▀ ▄▀█ █▄▄ */ 
/* █▀█ █▄█ █░▀░█ ██▄    ░█░ █▀█ █▄█ */ 

import 'package:flutter/material.dart';
import 'widget/widget.dart';
import 'widget/music.dart';
import 'widget/habits.dart';
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
          ScreenContainer(s: _HomeScreen()),
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
          child: _Column1(),
          ),
        Expanded(
          flex: 4,
          child: _Column2(),
          ),
        Expanded(
          flex: 3,
          child: _Column3(),
          ),
      ],
    );
  }
}

class _Column1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 25,
          child: Box(
            w: Profile(),
            margin: 0.0,
            padding: 0.0,
            bg: const Color(0xFF16161D) ),
          ),

        const Expanded(
          flex: 18,
          child: Box(w: DateAndTime()),
          ),

        Expanded(
          flex: 29,
          child: Box(w: Goals()),
          ),

        Expanded(
          flex: 28,
          child: MusicPlayer(),
          // child: Box(
          //   w: MusicPlayer(),
          //   padding: 0.0),
          ),
        ],
      );
  }
}

class _Column2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 30,
          child: Box(w: UpcomingEvents()),
          ),

        Expanded(
          flex: 30,
          child: Box(w: UpcomingTasks()),
          ),

        Expanded(
          flex: 40,
          child: Box(w: MonthlySpending()),
          ),
        ],
      );
  }
}

class _Column3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Box(w: Timewarrior()),
          ),

        Expanded(
          flex: 5,
          child: Box(w: Habits()),
          ),
        ],
      );
  }
}

