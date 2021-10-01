// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Produto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Produto on ProdutoBase, Store {
  final _$idprodutoAtom = Atom(name: 'ProdutoBase.idproduto');

  @override
  String get idproduto {
    _$idprodutoAtom.reportRead();
    return super.idproduto;
  }

  @override
  set idproduto(String value) {
    _$idprodutoAtom.reportWrite(value, super.idproduto, () {
      super.idproduto = value;
    });
  }

  final _$nomeAtom = Atom(name: 'ProdutoBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$imagemAtom = Atom(name: 'ProdutoBase.imagem');

  @override
  String get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  final _$ProdutoBaseActionController = ActionController(name: 'ProdutoBase');

  @override
  dynamic setIdproduto(String value) {
    final _$actionInfo = _$ProdutoBaseActionController.startAction(
        name: 'ProdutoBase.setIdproduto');
    try {
      return super.setIdproduto(value);
    } finally {
      _$ProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String value) {
    final _$actionInfo =
        _$ProdutoBaseActionController.startAction(name: 'ProdutoBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$ProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImagem(String value) {
    final _$actionInfo = _$ProdutoBaseActionController.startAction(
        name: 'ProdutoBase.setImagem');
    try {
      return super.setImagem(value);
    } finally {
      _$ProdutoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idproduto: ${idproduto},
nome: ${nome},
imagem: ${imagem}
    ''';
  }
}
