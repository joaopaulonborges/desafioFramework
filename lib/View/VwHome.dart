import 'package:desafioframework/Controller/HomeController.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/Util/Strings.dart';
import 'package:desafioframework/Util/TamanhoFontes.dart';
import 'package:desafioframework/Widget/CardProduto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VwHome extends StatefulWidget {
  @override
  _VwHomeState createState() => _VwHomeState();
}

class _VwHomeState extends State<VwHome> {
  var homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.carregarProdutos();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.corFundo,
      appBar: AppBar(
        title: Text(
          Strings.tituloApp,
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
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: homeController.listaProdutos.length,
                itemBuilder: (context, index) {
                  return CardProduto(
                    produto: homeController.listaProdutos[index],
                    index: index,
                  );
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/VwCarrinho");
        },
        child: const Icon(
          MdiIcons.cart,
          color: Cores.corFundo,
        ),
        backgroundColor: Cores.confirmacao,
      ),
    );
  }
}
