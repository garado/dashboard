
/* █▀▄▀█ █▀█ █▀▄ █▀▀ █░░ █▀ */ 
/* █░▀░█ █▄█ █▄▀ ██▄ █▄▄ ▄█ */ 

import 'dart:io';

Future<String> parseCheckingBalance() async {
  var process = await Process.run('ledger',['bal', 'checking', '--no-total', '--balance-format', '%(display_total)\n']);
  return process.stdout;
}

Future<String> parseSavingsBalance() async {
  var process = await Process.run('ledger',['bal', 'savings', '--no-total', '--balance-format', '%(display_total)\n']);
  return process.stdout;
}

// ---

