import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/pages/pagina_basico.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'basico',
      routes:{
        'basico': (BuildContext context )=> basico(),
      }
    );
  }
}
