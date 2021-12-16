import 'dart:io';

void main() {
  // Nao deletar
  final line = stdin.readLineSync() ?? '';
  if (line.isEmpty) exit(0);
  final inputs = line.split(' ');

  // Variaveis iniciais
  final number1 = double.parse(inputs[0]);
  final operator = inputs[1];
  final number2 = double.parse(inputs[2]);

  // Escreva seu programa a partir daqui

  dynamic result;

  switch (operator) {
    case '*':
      {
        result = number1 * number2;
      }
      break;

    case '/':
      {
        result = number1 / number2;
      }
      break;

    case '-':
      {
        result = number1 - number2;
      }
      break;

    default:
      {
        result = number1 + number2;
      }
      break;
  }

  final resultAprox = result.toStringAsFixed(5);
  dynamic final1 = result ~/ 1;
  final final2 = result % 1;

  if (final2 != 0) {
    print(double.parse(resultAprox));
  } else {
    print(final1);
  }
}
