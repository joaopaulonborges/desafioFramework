import 'package:desafioframework/Controller/LoginController.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/Util/Strings.dart';
import 'package:desafioframework/Util/TamanhoFontes.dart';
import 'package:desafioframework/Util/TamanhoTela.dart';
import 'package:desafioframework/Widget/Alerta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class VwLogin extends StatefulWidget {
  @override
  _VwLoginState createState() => _VwLoginState();
}

class _VwLoginState extends State<VwLogin> {
  var loginController = GetIt.I.get<LoginController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool _senhaVisivel;

  @override
  void initState() {
    super.initState();
    _senhaVisivel = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    Strings.tituloTelaLogin,
                    style: TextStyle(
                      color: Cores.corPrimaria,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    Strings.subTituloTelaLogin,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Strings.labelLoginEmail,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: _senhaVisivel,
                    controller: senhaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Strings.labelLoginSenha,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaVisivel ?
                          Icons.visibility
                          : Icons.visibility_off,
                          color: Cores.corPrimaria,
                        ),
                        onPressed: () {
                          setState(() {
                            _senhaVisivel = !_senhaVisivel;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Observer(builder: (_){
                  return loginController.loading ?
                    Container(
                      height: 50,
                      width: TamanhoTela.height(context, 0.8),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Cores.corPrimaria),
                          strokeWidth: 5,
                        ),
                      ),
                    )
                    : Container(
                      height: 50,
                      width: TamanhoTela.height(context, 0.8),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Cores.corFundo,
                        color: Cores.corPrimaria,
                        child: Text(
                          Strings.labelLoginBotao,
                          style: TextStyle(
                            fontSize: TamanhoFontes.grande(context),
                          ),
                        ),
                        onPressed: () async {
                          loginController.alterarLoading(true);
                          await Future.delayed(Duration(seconds: 2));
                          loginController.fazerLogin(emailController.text, senhaController.text);
                          if(loginController.logado){
                            loginController.alterarLoading(false);
                            Navigator.pushReplacementNamed(context, '/VwHome');
                          }
                          else{
                            Alerta.exibirAlert(context, Strings.tituloFalhaLogin, Strings.subtituloFalhaLogin);
                            loginController.alterarLoading(false);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
