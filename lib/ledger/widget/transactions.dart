
/* ▀█▀ █▀█ ▄▀█ █▄░█ █▀ ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀ */ 
/* ░█░ █▀▄ █▀█ █░▀█ ▄█ █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█ */ 

import 'package:flutter/material.dart';
import 'package:grizzly_io/grizzly_io.dart';
import '../models.dart';
import '../../utils.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Transactions();
  }
}

/* Fancy formatting for transaction entry. */
class _TransactionText extends StatelessWidget {
  const TransactionEntry({
    Key? key, 
    @required this.text,
    this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
  }
}

/* Displays information from Transaction class.
 * @param t An instance of the Transaction class. */
class TransactionEntry extends StatelessWidget {
  const TransactionEntry({
    Key? key, 
    required this.t}) : super(key: key);

  final Transaction t;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(t.date),
        Text(t.amt),
        Text(t.cat),
        Text(t.desc),
      ],
    );
  }
}

/* Calls getRecentTransactions() and creates a column of TransactionEntry widgets. */
class _Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: getRecentTransactions(),
      builder: (context, AsyncSnapshot<List<Transaction>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              for (Transaction t in snapshot.data!) TransactionEntry(t: t)
            ],
          );
        } else {
          return const Text('No transactions found.');
        }
      }
    );
  }
}

