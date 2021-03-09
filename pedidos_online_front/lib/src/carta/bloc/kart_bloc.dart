import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pedidos_online_front/src/carta/model/item_kart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

part 'kart_event.dart';
part 'kart_state.dart';

class KartBloc extends Bloc<KartEvent, KartState> {
  KartBloc() : super(KartState());

  @override
  Stream<KartState> mapEventToState(
    KartEvent event,
  ) async* {
    if(event is KartAdding){
      yield _mapKartAddingToState(event);
    }else if(event is KartRemoving) {
      yield _mapKartRemovingToState(event);
    }else if(event is KartBuying){
      yield* _mapKartBuyingToState(event);
    }
  }


  KartState _mapKartAddingToState(KartAdding event){
    String strPice = event.price.replaceAll('\$', '');
    int price = int.parse(strPice);

    ItemKart item = ItemKart(event.name, price, event.categorie, event.quantity);

    List<ItemKart> list = List.from(state.items ?? []);
    if(list != null && list.length > 0){
      int indexOfSame = list.indexWhere((element) => element.name == item.name && element.category == item.category);
      if(indexOfSame != -1) {
        ///Significa que ya existe el item en el carrito
        ///Hay que sumarle el [item.quantity]
        list[indexOfSame] = list[indexOfSame].addingQuantity(item.quantity);
      }else{
        ///No existe en el carrito, por lo tanto agregamos uno nuevo
        ///
        list.add(item);
      }

    }else{
      list = List.from([item]);
    }


    return state.copyWith(items: list);
  }

  KartState _mapKartRemovingToState(KartRemoving event){
    List<ItemKart> list = List.from(state.items ?? []);
    if(event.isAll){
      list.removeWhere((element) => element.name == event.name && element.category == event.category);
    }else{
      int indexOfSame = list.indexWhere((element) => element.name == event.name && element.category == event.category);

      if(list[indexOfSame].quantity == 1){
        list.removeAt(indexOfSame);
      }else{
        list[indexOfSame] = list[indexOfSame].addingQuantity(-1);
      }
    }

    return state.copyWith(items: list);
  }

  Stream<KartState> _mapKartBuyingToState(KartBuying event) async* {
    String mensaje = "";
    String numero = "+5492944614021";

    mensaje += "Diego puto\n";

    mensaje += "Lista: \n";

    event.list.forEach((element) {
      int cantidad = element.quantity;
      int precioTotal = element.price * element.quantity;
      String category = element.category;
      String nombre = element.name;
      mensaje += "$cantidad $nombre";

      if(category != null && category.isNotEmpty){
        mensaje += " $category";
      }

      mensaje += " = \$$precioTotal";

      mensaje += "\n";
    });

    if(event.address != null && event.address.isNotEmpty){
      RegExp reg = RegExp(r"[\s\w,.]{1,30}");
      if(!reg.hasMatch(event.address)){
        EasyLoading.showError("No se permiten caracteres espciales en la dirección");
        yield state;
        return;
      }

      mensaje += "Mandarlo a " + event.address + "\n";

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("address", event.address);
    }

    mensaje += "El total es \$" + event.total.toString();


    final Uri _urlToWhatsapp = Uri(
      scheme: "https",
      path: "wa.me/$numero",
      queryParameters: {
        "text" :  mensaje
      }
    );
    //TODO: Acá armar mensaje
    //Averigur sobre URLEncoded
    //https://wa.me/+5492966676495?text=quierocomprartalcosa

    if(await canLaunch(_urlToWhatsapp.toString())){
      await launch(_urlToWhatsapp.toString());
    } else {
      EasyLoading.showError("No se pudo enviar el mensaje");
    }


    yield state;
  }

}
