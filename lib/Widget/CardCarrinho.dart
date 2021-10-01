import 'package:desafioframework/Controller/CarrinhoController.dart';
import 'package:desafioframework/Model/Item.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/Util/Strings.dart';
import 'package:desafioframework/Util/TamanhoFontes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class CardCarrinho extends StatefulWidget {
  final Item item;
  final int index;
  CardCarrinho({Key key, this.item, this.index}) : super(key: key);

  @override
  _CardCarrinhoState createState() => _CardCarrinhoState();
}

class _CardCarrinhoState extends State<CardCarrinho> {
  var carrinhoController = GetIt.I.get<CarrinhoController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Cores.corFundo,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.widget.item.produto.idproduto,
                      style: TextStyle(
                        fontSize: TamanhoFontes.media(context),
                        color: Cores.corFontePrimaria,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Image(image: AssetImage("assets/"+this.widget.item.produto.imagem), height: 40, width: 30),
                flex: 2,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.widget.item.produto.nome,
                      style: TextStyle(
                        fontSize: TamanhoFontes.pequena(context),
                        color: Cores.corFontePrimaria,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Cores.corPrimaria,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if(carrinhoController.listaItens[this.widget.index].quantidade > 1){
                                carrinhoController.listaItens[this.widget.index].quantidade = carrinhoController.listaItens[this.widget.index].quantidade-1;
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Cores.corFundo,
                              size: 16,
                            ),
                          ),
                          Container(
                            width: 20.0,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Cores.corFundo,
                            ),
                            child: Text(
                              carrinhoController.listaItens[this.widget.index].quantidade.toString(),
                              style: TextStyle(
                                color: Cores.corFontePrimaria,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if(carrinhoController.listaItens[this.widget.index].quantidade < 9){
                                carrinhoController.listaItens[this.widget.index].quantidade = carrinhoController.listaItens[this.widget.index].quantidade+1;
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.add,
                              color: Cores.corFundo,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                flex: 5,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: RaisedButton(
                    textColor: Cores.corFundo,
                    color: Cores.rejeicao,
                    child: Text(
                      Strings.labelProdutoRemover,
                      style: TextStyle(
                        fontSize: TamanhoFontes.micro(context),
                      ),
                    ),
                    onPressed: () async {
                      carrinhoController.removerItem(carrinhoController.listaItens[this.widget.index].produto);
                      Fluttertoast.showToast(
                        msg: Strings.labelProdutoRemovido,
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                  ),
                ),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}