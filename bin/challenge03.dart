import 'dart:io';

void main() {
  // Nao deletar
  final line = stdin.readLineSync() ?? '';
  if (line.isEmpty) exit(0);
  final inputs = line.split(' ');

  // Variaveis iniciais
  final valorEmprestimo = double.parse(inputs[0]);
  final serasaScore = int.parse(inputs[1]);
  final meses = int.parse(inputs[2]);

  // Escreva seu programa a partir daqui

  double jur;

  if (serasaScore < 300) {
    jur = 0.03;
  } else if (serasaScore < 700) {
    jur = 0.09;
  } else {
    jur = 0.15;
  }

  var parc = (valorEmprestimo + (valorEmprestimo * jur)) / meses;

  print(parc);
}
