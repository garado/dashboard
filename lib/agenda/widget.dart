
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class AgendaCal extends StatelessWidget {
  Map<int, Color> colorList = { // TODO fix this
    1: const Color(0xfffdcb6e),
  };

  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      defaultColor: const Color(0x00000000), // default transparent
      colorMode: ColorMode.opacity,
      colorsets: colorList,
      showColorTip: false,
    );
  }
}
