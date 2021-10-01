import 'package:mobx/mobx.dart';
part 'Produto.g.dart';

class Produto extends ProdutoBase with _$Produto{

  @observable
  String idproduto;

  @observable
  String nome;

  @observable
  String imagem;

  Produto(this.idproduto, this.nome, this.imagem) : super(idproduto, nome, imagem);
}

abstract class ProdutoBase with Store {

  ProdutoBase(this.idproduto, this.nome, this.imagem);

  @observable
  String idproduto;

  @observable
  String nome;

  @observable
  String imagem;

  @action
  setIdproduto(String value) {
    idproduto = value;
  }

  @action
  setNome(String value) {
    nome = value;
  }

  @action
  setImagem(String value) {
    imagem = value;
  }
}