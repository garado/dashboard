
/* █░░ █▀▀ █▀▄ █▀▀ █▀▀ █▀█    ▀█▀ ▄▀█ █▄▄ */ 
/* █▄▄ ██▄ █▄▀ █▄█ ██▄ █▀▄    ░█░ █▀█ █▄█ */ 

import 'package:flutter/material.dart';
import 'widget/actions.dart';
import 'widget/balances.dart';
import 'widget/budget.dart';
import 'widget/transactions.dart';
import '../navrail.dart';
import '../utils.dart';

class LedgerScreen extends StatelessWidget {
  const LedgerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavRail(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: _LedgerScreen(),
            ),
          ),
        ],
      ),
    );
  }
}

/* Assemble widgets */
class _LedgerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ 
        Expanded(
          flex: 3,
          child: Column1(),
          ),
        Expanded(
          flex: 7,
          child: Column2(),
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
          flex: 28,
          child: Balances()
        ),

        Expanded(
          flex: 18,
          child: Box(w: LedgerActions()),
          ),

        // Expanded(
        //   flex: 26,
        //   child: Box(w: Goals()),
        //   ),

        // Expanded(
        //   flex: 28,
        //   child: Box(w: MusicPlayer()),
        //   ),
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
        // Expanded(
        //   flex: 30,
        //   child: Box(w: UpcomingEvents()),
        //   ),

        // Expanded(
        //   flex: 30,
        //   child: Box(w: UpcomingTasks()),
        //   ),

        // Expanded(
        //   flex: 40,
        //   child: Box(w: MonthlySpending()),
        //   ),
        ],
      );
  }
}
