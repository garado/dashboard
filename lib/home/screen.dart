
/* █░█ █▀█ █▀▄▀█ █▀▀    ▀█▀ ▄▀█ █▄▄ */ 
/* █▀█ █▄█ █░▀░█ ██▄    ░█░ █▀█ █▄█ */ 

import 'package:flutter/material.dart';
import 'widget.dart';

/* Assemble widgets */
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ 
      Flexible(
        fit: FlexFit.loose,
        child: Column1(),
        ),
      Flexible(
        fit: FlexFit.loose,
        child: Column2(),
        ),
      Flexible(
        fit: FlexFit.loose,
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
          child: Profile(),
          ),

        Expanded(
          flex: 2,
          child: DateAndTime(),
          ),

        Expanded(
          flex: 2,
          child: Goals(),
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
          child: UpcomingEvents(),
          ),

        Expanded(
          flex: 2,
          child: UpcomingTasks(),
          ),

        Expanded(
          flex: 2,
          child: MonthlySpending(),
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
          child: Timewarrior(),
          ),

        Expanded(
          flex: 2,
          child: Habits(),
          ),
        ],
      );
  }
}

