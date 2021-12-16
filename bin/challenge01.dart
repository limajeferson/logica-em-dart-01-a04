import 'dart:io';
import 'dart:math';

void main() {
  // Nao deletar
  final line = stdin.readLineSync() ?? '';
  if (line.isEmpty) exit(0);
  final inputs = line.split(' ');

  // Variaveis iniciais 
  final velocidade = int.parse(inputs[0]);
  final aceleracao = int.parse(inputs[1]);

  // Escreva seu programa a partir daqui
  
  dynamic dist;
  
  dist = pow((-1 * velocidade), 2)/(2 * aceleracao);
  
  if (dist <= 0) {
  dist = dist * -1;
  }
  
  print(dist);

}