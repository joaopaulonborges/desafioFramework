import 'package:desafioframework/View/VwCarrinho.dart';
import 'package:desafioframework/View/VwCheckoutPdf.dart';
import 'package:desafioframework/View/VwHome.dart';
import 'package:desafioframework/View/VwLogin.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Fluro {
  static FluroRouter router = FluroRouter();
  static Handler vwLoginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => VwLogin());
  static Handler vwHomeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => VwHome());
  static Handler vwCarrinhoHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => VwCarrinho());
  static Handler vwCheckoutoHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => VwCheckoutPdf());

  static void setupRouter() {
    router.define('/VwLogin', handler: vwLoginHandler, transitionType: TransitionType.fadeIn);
    router.define('/VwHome', handler: vwHomeHandler, transitionType: TransitionType.fadeIn);
    router.define('/VwCarrinho', handler: vwCarrinhoHandler, transitionType: TransitionType.fadeIn);
    router.define('/VwCheckout', handler: vwCheckoutoHandler, transitionType: TransitionType.fadeIn);
  }
}