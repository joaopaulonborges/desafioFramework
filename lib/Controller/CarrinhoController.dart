import 'package:desafioframework/Model/Item.dart';
import 'package:desafioframework/Model/Produto.dart';
import 'package:mobx/mobx.dart';
part 'CarrinhoController.g.dart';

class CarrinhoController = CarrinhoControllerBase with _$CarrinhoController;

abstract class CarrinhoControllerBase with Store {

  @observable
  ObservableList<Item> listaItens = new List<Item>().asObservable();

  @observable
  String checkoutPath;

  @action
  adicionarItem(Produto produto, int quantidade){
    final index = listaItens.indexWhere((element) => element.produto.idproduto == produto.idproduto);
    if(index >= 0){
      listaItens[index] = new Item(produto, quantidade);
    }
    else{
      listaItens.add(new Item(produto, quantidade));
    }
  }

  @action
  removerItem(Produto produto){
    final index = listaItens.indexWhere((element) => element.produto.idproduto == produto.idproduto);
    if(index >= 0){
      listaItens.removeAt(index);
    }
  }

  @action
  fazerCheckout(String value){
    checkoutPath = value;
  }
}