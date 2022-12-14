
/* █▄▄ █░█ █▀▄ █▀▀ █▀▀ ▀█▀ */ 
/* █▄█ █▄█ █▄▀ █▄█ ██▄ ░█░ */ 

import 'package:grizzly_io/io_loader.dart';
import 'package:flutter/material.dart' hide Table;
import '../../utils.dart';
import 'package:intl/intl.dart';

enum BudgetStuff {
  category,
  spent,
  budgeted
}

/* Call Ledger command to get and parse recent transactions. */
Future<List> getBudget() async {
  // var process = await Process.run('ledger', ['csv', 'expenses', 'reimbursements', 'income']);
  Table rawcsv = await readLCsv('data/budget');
  var csv = rawcsv.toList();

  // Ignore subcategories
  Map<String, List> budgets = {};
  for (var i = 0; i < csv.length; i++) {
    List splitCats = csv[i][0].split(':');
    String mainCat = splitCats[1];
    if (!budgets.containsKey(mainCat)) {
      var spent = csv[i][1].replaceAll(RegExp('[^\\d.-]'), '');
      var budgeted = csv[i][2].replaceAll(RegExp('[^\\d.-]'), '');
      budgets[mainCat] = [double.parse(spent), double.parse(budgeted)];
    }
  }

  // Convert map back to list because it's easier to work with later
  // I don't really know how to do this elegantly
  List fuck = <List>[];
  for (var e in budgets.entries) {
    var tmp = [e.key, e.value[0], e.value[1]];
    fuck.add(tmp);
  }

  return fuck;
}

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getBudget(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const WText(
                text: 'Monthly Budget',
                ),
              for (List b in snapshot.data!) BudgetEntry(b: b)
            ],
          );
        } else {
          return const Text('No transactions found.');
        }
      }
    );
  }
}

/* Displays information for a single budget entry.
 * @param b A list containing budget information. */
class BudgetEntry extends StatelessWidget {
  BudgetEntry({
    Key? key, 
    required this.b}) : super(key: key);

  final List b;
  late double spent = b[1].abs();
  late double budgeted = b[2].abs();
  late var textColor = (spent >= (budgeted * 0.90)) ? Colors.red : null;
  var f = NumberFormat('###.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
      [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: WText( // Category
                  text: b[0],
                  size: 20,
                  textAlign: TextAlign.left
                  ),
                )
              ),
            Align(
              alignment: Alignment.centerRight,
              child: WText( // Category
                text: '${f.format(spent)} / ${f.format(budgeted)}',
                color: textColor,
                size: 17,
                textAlign: TextAlign.right
                ),
              ),
          ]),
          LinearProgressIndicator(
            color: const Color(0xFF2D4F67),
            backgroundColor: const Color(0xFF363646),
            value: b[1].abs() / b[2].abs(),
            ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            )
        ],
      );
  }
}
