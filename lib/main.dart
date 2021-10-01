import 'package:desafioframework/Controller/CarrinhoController.dart';
import 'package:desafioframework/Controller/HomeController.dart';
import 'package:desafioframework/Controller/LoginController.dart';
import 'package:desafioframework/Repository/Fluro.dart';
import 'package:desafioframework/Util/Cores.dart';
import 'package:desafioframework/View/VwSplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

const MaterialColor materialColor = const MaterialColor(
  Cores.primariaHex,
  const <int, Color>{
    50: Cores.corPrimaria,
    100: Cores.corPrimaria,
    200: Cores.corPrimaria,
    300: Cores.corPrimaria,
    400: Cores.corPrimaria,
    500: Cores.corPrimaria,
    600: Cores.corPrimaria,
    700: Cores.corPrimaria,
    800: Cores.corPrimaria,
    900: Cores.corPrimaria,
  },
);

final ThemeData tema = ThemeData(primaryColor: Cores.corPrimaria, accentColor: Cores.corAccet, fontFamily: 'Poppins');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fluro.setupRouter();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<CarrinhoController>(CarrinhoController());
  runApp(
    MaterialApp(
      color: Cores.corFundo,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      home: VwSplashScreen(),
      theme: tema,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Fluro.router.generator,
    ),
  );
}

//flutter pub run build_runner build