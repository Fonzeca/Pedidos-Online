import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pedidos_online_front/src/carta/model/item_kart.dart';

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
      yield _mapKartBuyingToState(event);
    }
  }


  KartState _mapKartAddingToState(KartAdding event){
    String strPice = event.price.replaceAll('\$', '');
    int price = int.parse(strPice);

    ItemKart item = ItemKart(event.name, price, event.categorie, event.quantity);

    List<ItemKart> list = List.from(state.items ?? []);
    if(list != null && list.length > 0){
      int indexOfSame = list.indexWhere((element) => element.name == item.name);
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
      list.removeWhere((element) => element.name == event.name);
    }else{
      int indexOfSame = list.indexWhere((element) => element.name == event.name);

      if(list[indexOfSame].quantity == 1){
        list.removeAt(indexOfSame);
      }else{
        list[indexOfSame] = list[indexOfSame].addingQuantity(-1);
      }
    }

    return state.copyWith(items: list);
  }

  KartState _mapKartBuyingToState(KartBuying event) {

    //TODO: Acá armar mensaje
    //Averigur sobre URLEncoded
    //https://wa.me/+5492966676495?text=quierocomprartalcosa

    return state.copyWith(items: []);
  }

}
