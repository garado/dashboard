
/* █░█ ▀█▀ █ █░░ █▀ */ 
/* █▄█ ░█░ █ █▄▄ ▄█ */ 

/* Helper functions and other misc stuff */

import 'package:flutter/material.dart';

/* Creates widget header 
 * @param text  The header text */
class WidgetHeader extends StatelessWidget {
  final String? text;
  const WidgetHeader ({Key? key, @required this.text}) : super(key: key); /* the hell is this */

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: DefaultTextStyle.of(context).style,
      ),
    );
  }
}

/* Creates a box around a widget
 * @param w   The widget to be boxed */
class Box extends StatelessWidget {
  final Widget? w;
  const Box ({Key? key, @required this.w}) : super(key: key); /* the hell is this */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: w,
      ),
    );
  }
}


