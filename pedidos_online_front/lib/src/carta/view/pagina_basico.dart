import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedidos_online_front/src/carta/view/item_label.dart';
import 'package:pedidos_online_front/src/carta/view/title_section.dart';

// ignore: camel_case_types
class basico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFe8e8e8),
        appBar: AppBar(
          title: Text('Pedidos Online'),
          backgroundColor: Color(0xFF30475E),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    width: 900,
                    height: 1000,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TituloSection(
                          titulo: "Bebidas",
                          descripcion: "Bien frescas",
                        ),
                        Expanded(child: _crearGridView()),
                        TituloSection(
                          titulo: "Bebidas",
                          descripcion: "Bien frescas",
                        ),
                        Expanded(child: _crearGridView()),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

// Creo el GridView para retornar en el Scaffold

Widget _crearGridView() {
  return Container(
      width: 800,
      color: Colors.black26,
      child: GridView.count(
          mainAxisSpacing: 1,
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          childAspectRatio: 3,
          shrinkWrap: true,
          children: [
            //aqui se pone la lista para mostrar en el gridiview
            ItemLabel(
              description: "Amargo,con una lagrima de vaca",
              name: "Cafe con leche",
              price: "5",
            ),
            ItemLabel(
              description: "Suave e intenza",
              name: "Cerveza",
              price: "20",
            ),
            ItemLabel(
              description: "Jugito recien exprimido",
              name: "Jugo de Naranja",
              price: "10",
            ),
            ItemLabel(
              description: "Rico en proteinas",
              name: "batido con yogurt",
              price: "10",
            ),
            ItemLabel(
              description: "suave y espumoso",
              name: "Vino Fino",
              price: "45",
            ),
          ])
      //
      );
}
