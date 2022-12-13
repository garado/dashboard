
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
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: text,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xFFDCD7BA),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
        ),
      ],
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
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFF232331),
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: w,
      ),
    );
  }
}


