
/* █▀▄▀█ █▀█ █▀▄ █▀▀ █░░ █▀ */ 
/* █░▀░█ █▄█ █▄▀ ██▄ █▄▄ ▄█ */ 

import 'dart:io';
import 'package:grizzly_io/io_loader.dart';

Future<String> parseCheckingBalance() async {
  var process = await Process.run('ledger',['bal', 'checking', '--no-total', '--balance-format', '%(display_total)\n']);
  return process.stdout;
}

Future<String> parseSavingsBalance() async {
  var process = await Process.run('ledger',['bal', 'savings', '--no-total', '--balance-format', '%(display_total)\n']);
  return process.stdout;
}

// ---

class Transaction {
  final String date;
  final String amt;
  final String cat; // category
  final String desc;

  Transaction(this.date, this.amt, this.cat, this.desc);
}

/* Convert of list of lists to a list of transactions. */
List<Transaction> listToTransaction(List<List> x) {
  var transactions = <Transaction> [];

  for (var i = 0; i < x.length; i++) {
    var t = Transaction(
      x[i][0],
      x[i][2],
      x[i][3],
      x[i][5],
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
