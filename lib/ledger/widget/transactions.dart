
/* ▀█▀ █▀█ ▄▀█ █▄░█ █▀ ▄▀█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀ */ 
/* ░█░ █▀▄ █▀█ █░▀█ ▄█ █▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█ */ 

import 'package:flutter/material.dart' hide Table;
import 'package:grizzly_io/io_loader.dart';
import 'package:intl/intl.dart';
import '../../utils.dart';

class Transaction {
  final String date;
  final double amt;
  final String cat; // category
  final String desc;

  Transaction(this.date, this.amt, this.cat, this.desc);
}

/* Convert of list of lists to a list of transactions. */
List<Transaction> listToTransaction(List<List> x) {
  var transactions = <Transaction> [];

  for (var i = 0; i < x.length; i++) {
    String cat = x[i][3];
    cat = cat.startsWith('Expenses:') ? cat.replaceFirst('Expenses:',"") : cat;
    cat = cat.startsWith('Income:') ? cat.replaceFirst('Income:',"") : cat;
    var t = Transaction(
      x[i][0], // date
      double.parse(x[i][5]) * -1, // amt
      cat, // cat
      x[i][2], // desc
    );
    transactions.add(t);
  }

  return transactions;
}

/* Call Ledger command to get and parse recent transactions. */
Future<List<Transaction>> getRecentTransactions() async {
  // var process = await Process.run('ledger', ['csv', 'expenses', 'reimbursements', 'income']);
  Table csv = await readLCsv('data/csv');
  var fuck = listToTransaction(csv.toList());
  return fuck;
}

/* Formatting for transaction entry text fields.
 * @param text 
 * @param textColor 
 * @param flex */
class TransactionEntryContainer extends StatelessWidget {
  const TransactionEntryContainer({
    Key? key,
    required this.text,
    this.flex,
    this.textColor,
  }) : super(key: key);

  final String? text;
  final int? flex;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex!,
      child: Align(
        alignment: Alignment.centerLeft,
        child: WText(
          text: text,
          size: 15,
          fontFamily: 'RobotoMono',
          color: textColor,
          ),
        ),
      );
  }
}

/* Displays information from Transaction class.
 * @param t An instance of the Transaction class. */
class TransactionEntry extends StatelessWidget {
  TransactionEntry({
    Key? key, 
    required this.t}) : super(key: key);

  final Transaction t;
  final f = NumberFormat('##0.00', 'en_US');

  // late String cat = :
  late final amtTextColor = (t.amt > 0) ? Colors.green: Colors.red;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionEntryContainer(
          flex: 15,
          text: t.date,
          ),
        TransactionEntryContainer(
          flex: 10,
          textColor: amtTextColor,
          text: f.format(t.amt),
          ),
        TransactionEntryContainer(
          flex: 33,
          text: t.cat,
          ),
        TransactionEntryContainer(
          flex: 42,
          text: t.desc,
          ),
      ],
    );
  }
}

/* Calls getRecentTransactions() and creates a column of TransactionEntry widgets. */
class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: getRecentTransactions(),
      builder: (context, AsyncSnapshot<List<Transaction>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: const WText(
                  text: 'Transaction History',
                  ),
                ),
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

