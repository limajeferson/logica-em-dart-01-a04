import 'dart:io';

void main() {
  // Nao deletar
  final line = stdin.readLineSync() ?? '';
  if (line.isEmpty) exit(0);
  final inputs = line.split(' ');

  // Variaveis iniciais
  final num1 = int.parse(inputs[0]);
  final num2 = int.parse(inputs[1]);
  final num3 = int.parse(inputs[2]);

  // Escreva seu programa a partir daqui

  if (num1 == num2 || num2 == num3) {
    print('Entre apenas numeros diferentes');
  } else {
    if (num1 > num2 && num1 > num3) {
      if (num2 > num3) {
        print('$num1 $num2 $num3');
      } else {
        print('$num1 $num3 $num2');
      }
    } else if (num2 > num3 && num2 > num1) {
      if (num1 > num3) {
        print('$num2 $num1 $num3');
      } else {
        print('$num2 $num3 $num1');
      }
    } else if (num3 > num2 && num3 > num1) {
      if (num2 > num1) {
        print('$num3 $num2 $num1');
      } else {
        print('$num3 $num1 $num2');
      }
    }
  }
}
