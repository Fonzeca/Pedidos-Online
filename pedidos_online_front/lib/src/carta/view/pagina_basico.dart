import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/carta/view/item_label.dart';
import 'package:pedidos_online_front/src/carta/view/title_section.dart';

// ignore: camel_case_types
class basico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe8e8e8),
        appBar: AppBar(
          title: Text('Pedidos Online'),
          backgroundColor: Color(0xFF30475E),
        ),
        body: Column(children: <Widget>[
          TituloSection(
            titulo: "Tituloazo",
            descripcion: "Descripcion",
          ),
          Column(
            children: [
              ItemLabel(
                name: "PRUEBA",
                description: "Esta es una descripcion ",
                price: "45",
              ),
            ],
          ),
          Row(
            children: [
              Image(
                image: NetworkImage(
                    'https://www.diarioviral.net/wp-content/uploads/2020/03/flat550x550075f.u1iouio.jpg'),
                height: 150,
              ),
            ],
          ),
        ]));
  }
}
