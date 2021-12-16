import 'dart:async';
import 'dart:io';
import 'dart:convert';

void caixa(int value) {
  // Escreva seu programa a partir daqui

  int n100 = 0;
  int n50 = 0;
  int n20 = 0;
  int n10 = 0;
  int n5 = 0;
  int n2 = 0;

  n100 = value ~/ 100;
  n50 = (value - (100 * n100)) ~/ 50;
  n20 = (value - ((100 * n100) + (50 * n50))) ~/ 20;
  n10 = (value - ((100 * n100) + (50 * n50) + (20 * n20))) ~/ 10;
  n5 = (value - ((100 * n100) + (50 * n50) + (20 * n20) + (10 * n10))) ~/ 5;
  n2 = (value - ((100 * n100) + (50 * n50) + (20 * n20) + (10 * n10) + (5 * n5))) ~/ 2;

  String c100 = '$n100 de 100';
  String c50 = '$n50 de 50';
  String c20 = '$n20 de 20';
  String c10 = '$n10 de 10';
  String c5 = '$n5 de 5';
  String c2 = '$n2 de 2';

  if (value % 5 == 1 || value % 5 == 3) {
    value -= 5;
    n5++;
  }

  var text = '';

  if (n100 > 0) {
    text += c100;
  }

  if (n50 > 0) {
    if (text == '') {
      text += c50;
    } else {
      text += ', $c50';
    }
  }

  if (n20 > 0) {
    if (text == '') {
      text += c20;
    } else {
      text += ', $c20';
    }
  }

  if (n10 > 0) {
    if (text == '') {
      text += c10;
    } else {
      text += ', $c10';
    }
  }

  if (n5 > 0) {
    if (text == '') {
      text += c5;
    } else {
      text += ', $c5';
    }
  }

  if (n2 > 0) {
    if (text == '') {
      text += c2;
    } else {
      text += ', $c2';
    }
  }

  print(text);
}

// Nao deletar
void main() => readLine().listen(processLine);

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void processLine(String line) => caixa(int.parse(line.split(' ').first));
