
/* ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀ */ 
/* █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█ */ 

import 'package:flutter/material.dart';

class LedgerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _OpenLedger(),
        _ReloadLedger(),
      ],
    );
  }
}

final ButtonStyle _style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

class _OpenLedger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _style,
      onPressed: () {},
      child: const Text('Open ledger'),
    );
  }
}

class _ReloadLedger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _style,
      onPressed: () {},
      child: const Text('Reload'),
    );
  }
}
