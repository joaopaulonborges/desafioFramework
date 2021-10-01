import 'package:desafioframework/Util/Cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VwSplashScreen extends StatefulWidget {
  @override
  _VwSplashScreenState createState() => _VwSplashScreenState();
}

class _VwSplashScreenState extends State<VwSplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacementNamed(context, '/VwLogin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Cores.corPrimariaClara,
            Cores.corPrimaria,
            Cores.corAccet,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          MdiIcons.cart,
          size: 150,
          color: Cores.corFundo
        ),
      ),
    );
  }
}