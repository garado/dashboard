
/* █░█ ▀█▀ █ █░░ █▀ */ 
/* █▄█ ░█░ █ █▄▄ ▄█ */ 

/* Helper functions and other misc stuff */

import 'package:flutter/material.dart';

/* █░█░█ █ █▀▄ █▀▀ █▀▀ ▀█▀ █▀ */ 
/* ▀▄▀▄▀ █ █▄▀ █▄█ ██▄ ░█░ ▄█ */ 

/* Creates widget header 
 * @param text  The header text
 * @param color The text color */
class WidgetHeader extends StatelessWidget {
  const WidgetHeader ({
    Key? key, 
    @required this.text, 
    this.color = const Color(0xFF2D4F67),
    this.padding = 5.0,
    this.size = 25.0}) : super(key: key);
  
  final String? text;
  final Color? color;
  final double? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: size,
              color: color,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding!),
        ),
      ],
    );
  }
}

/* Creates a box around a widget
 * @param w   The widget to be boxed
 * @param bg  The background color of the box */
class Box extends StatelessWidget {
  const Box ({
    Key? key, 
    @required this.w, 
    this.bg = const Color(0xFF1F1F28) }) : super(key: key);
  
  final Widget? w;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: w,
      ),
    );
  }
}

/* █▀▀ ▄▀█ █▀▀ █░█ █▀▀ */ 
/* █▄▄ █▀█ █▄▄ █▀█ ██▄ */ 

/* Check cache file exists */

/* Create cache file */

/* Write to cache file */
