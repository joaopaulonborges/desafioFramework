import 'package:mobx/mobx.dart';
import 'package:desafioframework/Model/Produto.dart';
part 'Item.g.dart';

class Item extends ItemBase with _$Item{

  @observable
  Produto produto;

  @observable
  int quantidade;

  Item(this.produto, this.quantidade) : super(produto, quantidade);
}

abstract class ItemBase with Store {

  ItemBase(this.produto, this.quantidade);

  @observable
  Produto produto;

  @observable
  int quantidade;

  @action
  setProduto(Produto value) {
    produto = value;
  }

  @action
  setQuantidade(int value) {
    quantidade = value;
  }
}