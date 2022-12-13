
/* ▄▀█ █▀▀ █▀▀ █▄░█ █▀▄ ▄▀█ */ 
/* █▀█ █▄█ ██▄ █░▀█ █▄▀ █▀█ */ 


import 'package:flutter/material.dart';
import '../utils.dart';
import '../navrail.dart';
import 'widget.dart';

/* Assemble all widgets */
class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const NavRail(),
            _AgendaScreen(),
          ],
          ),
      )
    );
  }
}

class _AgendaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        // COLUMN 1
        Column(
          children: [
            Box( w: AgendaCal() ),
          ],
        ),

        // COLUMN 2
        Column(

        ),
      ],

    );
  }
}
