// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$listaProdutosAtom = Atom(name: 'HomeControllerBase.listaProdutos');

  @override
  List<Produto> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(List<Produto> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  final _$listaPesquisaProdutosAtom =
      Atom(name: 'HomeControllerBase.listaPesquisaProdutos');

  @override
  List<Produto> get listaPesquisaProdutos {
    _$listaPesquisaProdutosAtom.reportRead();
    return super.listaPesquisaProdutos;
  }

  @override
  set listaPesquisaProdutos(List<Produto> value) {
    _$listaPesquisaProdutosAtom.reportWrite(value, super.listaPesquisaProdutos,
        () {
      super.listaPesquisaProdutos = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic carregarProdutos() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.carregarProdutos');
    try {
      return super.carregarProdutos();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pesquisarProduto(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.pesquisarProduto');
    try {
      return super.pesquisarProduto(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos},
listaPesquisaProdutos: ${listaPesquisaProdutos}
    ''';
  }
}
