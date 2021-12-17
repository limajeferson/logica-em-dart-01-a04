import 'dart:async';
import 'dart:io';
import 'dart:convert';

void caixa(int value) {
  // Escreva seu programa a partir daqui

  /* criando o valor inteiro -> reserva de notas de 5 <- para poder identificar
  quando os valores terminarem em 3 ou 1, ele gerar uma nota reserva de 5 
  e subtrair do montante value */

  int r5 = 0;

  /* criando o valor inteiro -> notas de 5 <- antecipadamente para o caso da 
  reserva ainda precisar de refazer o calculo, exemplo, para emitir 21 reais, 
  inclui uma nota de 5 na reserva e vai emitir 16, ele ira imprimir uma nota de
  10, e ira faltar 6, ele ira imprimir uma nota de 5, para faltar 1, ai entra a 
  reserva, ele ira ver a reserva com 1 nota extra, adicionara ao value apos ter 
  impresso a ultima de 5, quando for imprimir a de 2, sairam tres notas de 2 */

  int n5 = 0;
  
  if (value % 5 == 1 || value % 5 == 3) { // se o resto de value / 5 for 3 ou 1
    value -= 5; // subtrair 5 do value
    r5++; // adicionar 1 cedula a reserva
  }

  int n100 = value ~/ 100; // adicionar parte inteira em notas de 100
  value %= 100; // atualizar value sera o restante apos retirar as notas de 100
  int n50 = value ~/ 50; // adicionar parte inteira em notas de 50
  value %= 50; // atualizar value sera o restante apos retirar as notas de 50
  int n20 = value ~/ 20; // adicionar parte inteira em notas de 20
  value %= 20; // atualizar value sera o restante apos retirar as notas de 20
  int n10 = value ~/ 10; // adicionar parte inteira em notas de 10
  value %= 10; // atualizar value sera o restante apos retirar as notas de 10

  if (r5 > 0) { // se tiver notas na reserva
    n5 = value ~/ 5; // adicionar parte inteira em notas de 5
    n5 += r5; // e somar o valor da reserva (pode ser n5++ a r5 sempre sera 1)
  } else { // se nao tiver notas na reserva
    n5 = value ~/ 5; // apenas adicionar parte inteira em notas de 5
  }

  value %= 5; // atualizar value sera o restante apos retirar as notas de 5

  /* caso agora value seja 3 ou 1 haveria um erro porque emitiria uma cedula
  de 2 e restaria 1 ou nada emitiria, por isso, se o novo value for 3 ou 1
  ira subtrair uma cedula das notas de 5 e ira adicionar ao value, importante 
  fazer isso depois de passar pelo n5 para nao se tornar redundante, assim 
  sendo 3+5 serao 4 notas de 2, ou 1+5 serao 3 notas de 2 */

  if (value == 3 || value == 1) {
    n5--;
    value += 5;
  }

  int n2 = value ~/ 2; // adicionar parte inteira em notas de 2
  value %= 2; // value sera ZERO

  var text = ''; // criando variavel a ser impressa (pode ser dynamic)

  if (n100 > 0) { // se ha notas de 100 adicionar em text o Script abaixo
    text += '$n100 de 100';
  }

  if (n50 > 0) { // se ha notas de 50 adicionar em text o Script abaixo
    if (text == '') { // se estiver vazio incluir sem virgula espaco
      text += '$n50 de 50';
    } else {
      text += ', $n50 de 50';
    }
  }

  if (n20 > 0) { // se ha notas de 20 adicionar em text o Script abaixo
    if (text == '') { // se estiver vazio incluir sem virgula espaco
      text += '$n20 de 20';
    } else {
      text += ', $n20 de 20';
    }
  }

  if (n10 > 0) { // se ha notas de 10 adicionar em text o Script abaixo
    if (text == '') { // se estiver vazio incluir sem virgula espaco
      text += '$n10 de 10';
    } else {
      text += ', $n10 de 10';
    }
  }

  if (n5 > 0) { // se ha notas de 5 adicionar em text o Script abaixo
    if (text == '') { // se estiver vazio incluir sem virgula espaco
      text += '$n5 de 5';
    } else {
      text += ', $n5 de 5';
    }
  }

  if (n2 > 0) { // se ha notas de 2 adicionar em text o Script abaixo
    if (text == '') { // se estiver vazio incluir sem virgula espaco
      text += '$n2 de 2';
    } else {
      text += ', $n2 de 2';
    }
  }

  print(text);
}

// Nao deletar
void main() => readLine().listen(processLine);

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void processLine(String line) => caixa(int.parse(line.split(' ').first));
