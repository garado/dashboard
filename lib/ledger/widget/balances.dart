
/* █▄▄ ▄▀█ █░░ ▄▀█ █▄░█ █▀▀ █▀▀ █▀ */ 
/* █▄█ █▀█ █▄▄ █▀█ █░▀█ █▄▄ ██▄ ▄█ */ 

/* Shows account balances. */

import 'package:flutter/material.dart';
import '../models.dart';
import '../../utils.dart';

class Balances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Box(
            w: _Checking(),
            bg: const Color(0xFF2D4F67),
            ),
          ),
        Expanded(
          child: Box(
            w: _Savings(),
            bg: const Color(0xFF2D4F67),
            ),
          ),
      ],
    );
  }
}


class _Checking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Checking'),
        _CheckingBal(),
      ],
    );
  }
}

class _CheckingBal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: parseCheckingBalance(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return WText(
            text: snapshot.data.toString(),
            color: const Color(0xFFDCD7BA),
          );
        } else {
          return const WText(
            text: '\$----.--',
            color: Color(0xFFDCD7BA),
          );
        }
      }
    );
  }
}

class _Savings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Savings'),
        _SavingsBal(),
      ],
    );
  }
}

class _SavingsBal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: parseSavingsBalance(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return WText(
            text: snapshot.data.toString(),
            color: const Color(0xFFDCD7BA),
          );
        } else {
          return const WText(
            text: '\$----.--',
            color: Color(0xFFDCD7BA),
          );
        }
      }
    );
  }
}

