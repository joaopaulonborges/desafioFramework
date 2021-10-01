import 'package:desafioframework/Controller/CarrinhoController.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/Util/Strings.dart';
import 'package:desafioframework/Util/TamanhoFontes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:get_it/get_it.dart';

class VwCheckoutPdf extends StatelessWidget {
  var carrinhoController = GetIt.I.get<CarrinhoController>();

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Cores.corFundo,
        ),
        title: Text(
          Strings.tituloTelaCheckout,
          style: TextStyle(
            fontSize: TamanhoFontes.grande(context),
            color: Cores.corFundo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Cores.corPrimaria,
        elevation: 10.0,
      ),
      path: carrinhoController.checkoutPath,
    );
  }
}
