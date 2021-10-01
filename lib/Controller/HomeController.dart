import 'package:desafioframework/Model/Produto.dart';
import 'package:mobx/mobx.dart';
part 'HomeController.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  @observable
  List<Produto> listaProdutos = new List<Produto>();

  @observable
  List<Produto> listaPesquisaProdutos = new List<Produto>();

  @action
  carregarProdutos() {
    listaProdutos.add(new Produto("1", "MAÇA NACIONAL", "maca.png"));
    listaProdutos.add(new Produto("2", "BANANA PRATA", "banana.png"));
    listaProdutos.add(new Produto("3", "LARANJA LIMA", "laranja.png"));
    listaProdutos.add(new Produto("4", "PÊRA", "pera.png"));
    listaProdutos.add(new Produto("5", "ABACAXI", "abacaxi.png"));
    listaProdutos.add(new Produto("6", "MANGA", "manga.png"));
    listaPesquisaProdutos.addAll(listaProdutos);
  }

  @action
  pesquisarProduto(String value) {
    List<Produto> lista = new List<Produto>();
    if (value != "") {
      for (var i in listaProdutos) {
        if (i.nome.contains(value) || i.nome.contains(value.toUpperCase())) {
          lista.add(i);
        }
      }
      listaPesquisaProdutos = lista;
    }
    else {
      listaPesquisaProdutos = listaProdutos;
    }
  }
}