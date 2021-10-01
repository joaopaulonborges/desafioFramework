// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarrinhoController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoController on CarrinhoControllerBase, Store {
  final _$listaItensAtom = Atom(name: 'CarrinhoControllerBase.listaItens');

  @override
  ObservableList<Item> get listaItens {
    _$listaItensAtom.reportRead();
    return super.listaItens;
  }

  @override
  set listaItens(ObservableList<Item> value) {
    _$listaItensAtom.reportWrite(value, super.listaItens, () {
      super.listaItens = value;
    });
  }

  final _$CarrinhoControllerBaseActionController =
      ActionController(name: 'CarrinhoControllerBase');

  @override
  dynamic adicionarItem(Produto produto, int quantidade) {
    final _$actionInfo = _$CarrinhoControllerBaseActionController.startAction(
        name: 'CarrinhoControllerBase.adicionarItem');
    try {
      return super.adicionarItem(produto, quantidade);
    } finally {
      _$CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removerItem(Produto produto) {
    final _$actionInfo = _$CarrinhoControllerBaseActionController.startAction(
        name: 'CarrinhoControllerBase.removerItem');
    try {
      return super.removerItem(produto);
    } finally {
      _$CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaItens: ${listaItens}
    ''';
  }
}
