import 'package:cart_test/models/carrinho.dart';
import 'package:cart_test/models/item_carrinho.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CarrinhoDeCompras carrinho;

  setUp(() {
    carrinho = CarrinhoDeCompras();
  });

  test("Deve inicializar com carrinho vazio", () {
    expect(carrinho.itens, isEmpty);
    expect(carrinho.calcularSubtotal(), 0.0);
  });

  test("Deve adicionar items no carrinho com sucesso", () {
    final item = ItemCarrinho(nome: "Chocolate", preco: 12.5);

    carrinho.adicionarItem(item);

    expect(carrinho.itens.length, equals(1));
    expect(carrinho.itens.first.nome, equals("Chocolate"));
    expect(carrinho.calcularSubtotal(), 12.5);
  });

  test("Deve remover item pelo nome", () {
    final item = ItemCarrinho(nome: "Chocolate", preco: 12.5);
    final item2 = ItemCarrinho(nome: "Joia", preco: 25000);

    carrinho.adicionarItem(item);
    carrinho.adicionarItem(item2);

    carrinho.removerItem("Chocolate");

    expect(carrinho.itens.length, equals(1));
    expect(carrinho.itens.first.nome, equals("Joia"));
  });
}
