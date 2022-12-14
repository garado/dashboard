
/* █▄░█ ▄▀█ █░█ █▀█ ▄▀█ █ █░░ */ 
/* █░▀█ █▀█ ▀▄▀ █▀▄ █▀█ █ █▄▄ */ 

import 'package:flutter/material.dart';

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRail();
}

class _NavRail extends State<NavRail> {
  int _selectedIndex = 0;

  final routes = [ 
    '/', 
    '/agenda', 
    '/agenda', // tasks
    '/ledger', 
    '/agenda', // time
    '/agenda', // settings
  ];

  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
    Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      groupAlignment: 0, // centers icons 
      backgroundColor: const Color(0xFF1F1F28),
      onDestinationSelected: changeDestination, 
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home), 
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
          ),
        NavigationRailDestination(
          icon: Icon(Icons.checklist),
          label: Text('Tasks'),
          ),
        NavigationRailDestination(
          icon: Icon(Icons.schedule),
          label: Text('Time'),
          ),
        NavigationRailDestination(
          icon: Icon(Icons.attach_money),
          label: Text('Ledger'),
          ),
        NavigationRailDestination(
          icon: Icon(Icons.calendar_month),
          label: Text('Agenda'),
          ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
          ),
      ],
    );
  }
}

