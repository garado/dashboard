
/* █░█ ▀█▀ █ █░░ █▀ */ 
/* █▄█ ░█░ █ █▄▄ ▄█ */ 

/* Helper functions and other misc stuff */

import 'package:flutter/material.dart';

/* █░█░█ █ █▀▄ █▀▀ █▀▀ ▀█▀ █▀ */ 
/* ▀▄▀▄▀ █ █▄▀ █▄█ ██▄ ░█░ ▄█ */ 

/* Screen containers
 * @param s The screen to be contained */
class ScreenContainer extends StatelessWidget {
  const ScreenContainer ({
    Key? key,
    required this.s}) : super(key: key);

  final Widget? s;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      margin: const EdgeInsets.all(20.0),
      child: s,
      ),
    );
  }
}

/* Easier text formatting
 * @param text  The header text
 * @param color The text color */
class WText extends StatelessWidget {
  const WText ({
    Key? key, 
    @required this.text, 
    // this.color = const Color(0xFF2D4F67),
    this.color = const Color(0xFFDCD7BA),
    this.padding = 5.0,
    this.fontFamily,
    this.textAlign = TextAlign.center,
    this.size = 25.0}) : super(key: key);
  
  final String? text;
  final Color?  color;
  final double? padding;
  final double? size;
  final String? fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: size,
            color: color,
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
