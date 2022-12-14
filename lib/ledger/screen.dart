
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
          ScreenContainer(s: _LedgerScreen()),
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
          flex: 35,
          child: _Column1(),
          ),
        Expanded(
          flex: 65,
          child: _Column2(),
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
          flex: 20,
          child: Balances()
        ),

        Expanded(
          flex: 12,
          child: Box(w: LedgerActions()),
          ),

        Expanded(
          flex: 68,
          child: Box(w: Budget()),
          ),

        // Expanded(
        //   flex: 28,
        //   child: Box(w: MusicPlayer()),
        //   ),
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
          child: Box(w: Transactions()),
          ),

        // Expanded(
        //   flex: 40,
        //   child: Box(w: MonthlySpending()),
        //   ),
        ],
      );
  }
}
