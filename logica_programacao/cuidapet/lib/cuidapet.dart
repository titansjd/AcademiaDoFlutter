import 'dart:io';

void main() {
  String enderecoLoja = 'Rua X ';
  int numeroLoja = 666;
  String nomeCliente = '';

  // print(
  //     'Sejam bem-vindos a loja Cuidapet! Em breve teremos um sistema de autoatendimento \n ');

  // print('Endereco $enderecoLoja, $numeroLoja');

  print('Informe o seu nome');

  nomeCliente = stdin.readLineSync() ?? '';

  print('Prezado(a), $nomeCliente. Seja muito bem-vindo à nossa loja.\n');

  print('Oferecemos em nossa loja produtos e serviços para seu PET.\n\n'
      'Para venda de produtos, procure o colaborador Junior e, para serviços '
      'como banho ou tosa, procure o colaborador Neto.\n\n'
      'Obrigado e esperamos que tenha uma ótima experiência em nossa loja.\n\n\n');
}
