// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contas {
  final String id;
  final String nome;
  final double valor;
  final DateTime data;

  Contas({
    required this.id,
    required this.nome,
    required this.valor,
    required this.data,
  });
}

List<Contas> listacontas = [
  Contas(id: "id1", nome: "nome", valor: 250.50, data: DateTime.now())
];

valortotal() {
  double valorSoma = 0;
  for (int i = 0; i < listacontas.length; i++) {
    valorSoma += listacontas[i].valor;
  }
  return valorSoma;
}
