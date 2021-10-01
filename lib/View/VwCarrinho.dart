import 'dart:io';
import 'package:desafioframework/Controller/CarrinhoController.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/Util/Strings.dart';
import 'package:desafioframework/Util/TamanhoFontes.dart';
import 'package:desafioframework/Widget/Alerta.dart';
import 'package:desafioframework/Widget/CardCarrinho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class VwCarrinho extends StatefulWidget {
  @override
  _VwCarrinhoState createState() => _VwCarrinhoState();
}

class _VwCarrinhoState extends State<VwCarrinho> {
  var carrinhoController = GetIt.I.get<CarrinhoController>();

  Future<void> _pdfCheckout() async{
    String texto = "LISTA DE COMPRAS\n\n";
    for(int i=0; i < carrinhoController.listaItens.length; i++){
      texto += carrinhoController.listaItens[i].produto.idproduto.toString()+" - "+carrinhoController.listaItens[i].produto.nome+" = "+carrinhoController.listaItens[i].quantidade.toString()+"\n\n";
    }
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Container(
          child: pw.Text(
            texto,
            style: pw.TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
    String dir = (await getApplicationDocumentsDirectory()).path;
    final file = File('$dir/checkout.pdf');
    await file.writeAsBytes(await pdf.save());
    carrinhoController.fazerCheckout(file.path);
    Navigator.pushNamed(context, "/VwCheckout");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.corFundo,
      appBar: AppBar(
        leading: BackButton(
            color: Cores.corFundo,
        ),
        title: Text(
          Strings.tituloTelaCarrinho,
          style: TextStyle(
            fontSize: TamanhoFontes.grande(context),
            color: Cores.corFundo,
          ),
          overflow: TextOverflow.clip,
        ),
        centerTitle: true,
        backgroundColor: Cores.corPrimaria,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return carrinhoController.listaItens.length != 0 ?
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: carrinhoController.listaItens.length,
                itemBuilder: (context, index) {
                  return CardCarrinho(
                    item: carrinhoController.listaItens[index],
                    index: index,
                  );
                },
              )
              :
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Strings.labelCarrinhoVazio,
                        style: TextStyle(
                          fontSize: TamanhoFontes.extraGrande(context),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(carrinhoController.listaItens.length != 0){
            await _pdfCheckout();
          }
          else{
            Alerta.exibirAlert(context, Strings.tituloFalhaCheckout, Strings.subtituloFalhaCheckout);
          }
        },
        child: const Icon(
          MdiIcons.file,
          color: Cores.corFundo,
        ),
        backgroundColor: Cores.confirmacao,
      ),
    );
  }
}
