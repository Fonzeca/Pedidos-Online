import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/view/item_label.dart';
import 'package:pedidos_online_front/src/carta/view/title_section.dart';

// ignore: camel_case_types
class MenuView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    context.read<ItemsBloc>().add(ItemsRequested());


    return BlocListener<ItemsBloc, ItemsState>(
      listener: (context, state) {
        switch(state.status){
          case ItemsObtainedStatus.loading:
          case ItemsObtainedStatus.none:
            //Aparece el loading
            break;
          case ItemsObtainedStatus.success:
            //Desaparece el loading
            break;
          case ItemsObtainedStatus.failure:
            //Toast fail
            break;
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
        ),
      ),
    );
  }
}

// Creo el GridView para retornar en el Scaffold
Widget _crearGridView() {
  return Container(
      width: 800,
      height: double.infinity,
      color: Colors.black26,
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
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
              description: "Suave e intensa",
              name: "Cerveza",
              price: "20",
            ),
            ItemLabel(
              description: "Juguito recien exprimido",
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
            ItemLabel(
              description: "Rico en proteinas",
              name: "batido con yogurt",
              price: "10",
            ),
            ItemLabel(
              description: "Rico en proteinas",
              name: "batido con yogurt",
              price: "10",
            ),
            ItemLabel(
              description: "Rico en proteinas",
              name: "batido con yogurt",
              price: "10",
            ),
            ItemLabel(
              description: "Rico en proteinas",
              name: "batido con yogurt",
              price: "10",
            ),
          ])
      //
      );
}
