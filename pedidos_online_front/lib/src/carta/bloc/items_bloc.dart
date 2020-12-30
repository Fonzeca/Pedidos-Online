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
      state.copyWith(status: ItemsObtainedStatus.failure);
    }

    List<SectionCarta> section_carta = List<SectionCarta>();

    //Unimos la dos listas, dejando de lado los items que no matcheen con una section
    sections.forEach((element) {
      var itemsFiltered = items
          .where((x) => x.section == element.name)
          .map((e) => ItemCarta(e.name, e.description, e.price, e.image));

      section_carta
          .add(SectionCarta(element.name, element.image, itemsFiltered));
    });

    yield state.copyWith(
        status: ItemsObtainedStatus.success, sections: section_carta);
  }
}
