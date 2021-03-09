import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:item_repository/item_repository.dart';
import 'package:pedidos_online_front/src/carta/model/item_carta.dart';
import 'package:pedidos_online_front/src/carta/model/section_carta.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc(ItemRepository itemRepository)
      : assert(itemRepository != null),
        _itemRepository = itemRepository,
        super(ItemsState(ItemsObtainedStatus.none));

  final ItemRepository _itemRepository;

  @override
  Stream<ItemsState> mapEventToState(
    ItemsEvent event,
  ) async* {
    if (event is ItemsRequested) {
      yield state.copyWith(status: ItemsObtainedStatus.loading);
      yield* _mapEventRequestedToState(event, state);
    }
  }

  ///When [event] is triggered, call the api and obtain all the items and sections.
  ///Join the 2 list into one, and return the [state] with that.
  ///
  /// Cuando se dispara al [event] ItemsRequested, se llama a la api obteniendo todos los items y sections.
  /// Luego unimos las 2 listas en una, y retornamos el [state] con la lista.
  Stream<ItemsState> _mapEventRequestedToState(
      ItemsRequested event, ItemsState state) async* {
    List<Section> sections;
    List<Item> items;

    try {
      sections = await _itemRepository.getAllSections();
      items = await _itemRepository.getAllItems();
    } on Exception catch (_) {
      yield state.copyWith(status: ItemsObtainedStatus.failure);
    }

    List<SectionCarta> section_carta = List<SectionCarta>();

    //Unimos la dos listas, dejando de lado los items que no matcheen con una section
    //TODO: ver que pingo es     el error que ttira si le sacamos el siguiente if.
    if (sections != null) {
      sections.forEach((element) {
        List<Item> itemsFiltered;

        //Preguntamos que tipo de section es, para filtrar bien los items correspondientes
        if(element.type == 1){
          //Filtramos los items de la section y los que tengan el array de prices en != null
          itemsFiltered = items
              .where((x) => x.section == element.name && x.prices != null && x.price == null).toList();
        }else{
          //Filtramos los items de la section y los que tengan el price en != null
          itemsFiltered = items
              .where((x) => x.section == element.name && x.prices == null && x.price != null).toList();
        }

        //Creamos una SectionCarta con los items dentro
        section_carta
          .add(
            SectionCarta(
              element.name,
              element.image,
              element.type,
              element.categories,
              itemsFiltered.map((e) => ItemCarta(e.name, e.description, e.price, e.image, e.prices)).toList()
            )
          );

      });
    }
    yield state.copyWith(
        status: ItemsObtainedStatus.success, sections: section_carta);
  }
}
