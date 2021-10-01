import 'package:desafioframework/Model/Produto.dart';
import 'package:mobx/mobx.dart';
part 'HomeController.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  @observable
  ObservableList<Produto> listaProdutos = new List<Produto>().asObservable();

  @observable
  ObservableList<Produto> listaPesquisaProdutos = new List<Produto>().asObservable();

  @action
  carregarProdutos() {
    listaProdutos.add(new Produto("1", "Maça Nacional", "maca.png"));
    listaProdutos.add(new Produto("2", "Banana Prata", "banana.png"));
    listaProdutos.add(new Produto("3", "Laranja Lima", "laranja.png"));
    listaProdutos.add(new Produto("4", "Pêra", "pera.png"));
    listaProdutos.add(new Produto("5", "Abacaxi", "abacaxi.png"));
    listaProdutos.add(new Produto("6", "Manga", "manga.png"));
  }

  @action
  pesquisarProduto(String value) {

  }
}