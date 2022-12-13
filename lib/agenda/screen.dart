
/* ▄▀█ █▀▀ █▀▀ █▄░█ █▀▄ ▄▀█ */ 
/* █▀█ █▄█ ██▄ █░▀█ █▄▀ █▀█ */ 


import 'package:flutter/material.dart';
import '../utils.dart';
import 'widget.dart';

/* Assemble all widgets */

class AgendaTab extends StatelessWidget {
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

