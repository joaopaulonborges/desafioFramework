// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Item on ItemBase, Store {
  final _$produtoAtom = Atom(name: 'ItemBase.produto');

  @override
  Produto get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(Produto value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  final _$quantidadeAtom = Atom(name: 'ItemBase.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$ItemBaseActionController = ActionController(name: 'ItemBase');

  @override
  dynamic setProduto(Produto value) {
    final _$actionInfo =
        _$ItemBaseActionController.startAction(name: 'ItemBase.setProduto');
    try {
      return super.setProduto(value);
    } finally {
      _$ItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantidade(int value) {
    final _$actionInfo =
        _$ItemBaseActionController.startAction(name: 'ItemBase.setQuantidade');
    try {
      return super.setQuantidade(value);
    } finally {
      _$ItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produto: ${produto},
quantidade: ${quantidade}
    ''';
  }
}
