
import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pedidos_online_front/src/carta/bloc/items_bloc.dart';
import 'package:pedidos_online_front/src/carta/bloc/kart_bloc.dart';
import 'package:pedidos_online_front/src/carta/model/item_carta.dart';
import 'package:pedidos_online_front/src/carta/model/item_kart.dart';
import 'package:pedidos_online_front/src/carta/model/section_carta.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/details_view.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/widgets/custom_labeled_radio.dart';
import 'package:pedidos_online_front/src/carta/view/menu_v2/widgets/kart_dialog.dart';
import 'package:responsive_scaffold/templates/layout/scaffold.dart';
import 'package:responsive_scaffold/templates/list/responsive_list.dart';

import 'configuration.dart';

class MenuView2 extends StatelessWidget{

  List<SectionCarta> sections;
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(-1);

  double kDesktopBreakpoint;

  String appBarTitleSection = appBarTitle;

  //---------------------------------------------
  // Esqueleto

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listener: (context, state) {
        switch (state.status) {
          case ItemsObtainedStatus.loading:
          case ItemsObtainedStatus.none:
          //Aparece el loading
            EasyLoading.show(status: 'cargando...');
            break;
          case ItemsObtainedStatus.success:
          //Desaparece el loading
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            EasyLoading.showSuccess("Success!");
            break;
          case ItemsObtainedStatus.failure:
          //Toast fail
            EasyLoading.showError("Failure!");
            break;
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: BlocBuilder<ItemsBloc, ItemsState>(
          builder: (context, state) {
            switch(state.status){
              case ItemsObtainedStatus.loading:
              case ItemsObtainedStatus.none:
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(Icons.auto_awesome,size: 48),
                );
                break;
              case ItemsObtainedStatus.success:
                sections = state.sections;
                return _buildScaffold();
                break;
              case ItemsObtainedStatus.failure:
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Icon(Icons.sentiment_very_dissatisfied,size: 48),
                );
                break;
              default:
                return Container();
                break;
            }
          },
        ),
      ),
    );
  }

  ///Esqueleto de la carta
  Widget _buildScaffold(){
    ResponsiveScaffold scaffold = ResponsiveScaffold(
      title: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) => buildTitle(),
      ),
      drawer: Drawer(
        child: buildDrawer()
      ),
      body: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          if(value == -1){
            return buildHome();
          }
          return Container(
            child: _menu(value)
          );
        },
      ),
    );

    kDesktopBreakpoint = scaffold.kDesktopBreakpoint;
    return scaffold;
  }

  //Drawer

  Widget buildDrawer(){
    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: sections.length + 1,
        itemBuilder: (context, index) {
          if(index == 0){
            return buildDrawerHeader();
          }
          return buildSectionsOnDrawer(context, index - 1);
        },
      ),
    );
  }

  Widget buildDrawerHeader(){
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: ExactAssetImage(
              uriImageDrawer
          ),
          fit: BoxFit.none
        )
      ),
    );
  }

  Widget buildSectionsOnDrawer(BuildContext context, int index){
    return ListTile(
      hoverColor: itemHoverColorDrawer,
      focusColor: itemHoverColorDrawer,
      title: Text(sections[index].name),
      onTap: () => clickSections(context, index),
    );
  }

  void clickSections(BuildContext context, int index){
    valueNotifier.value = index;
    appBarTitleSection = sections[index].name;
    if(MediaQuery.of(context).size.width < kDesktopBreakpoint){
      Navigator.of(context).pop();
    }
  }

  //Bar and home

  Widget buildTitle(){
    return Text(appBarTitleSection);
  }

  Widget buildHome(){
    return BlocBuilder<KartBloc, KartState>(
      builder: (context, snapshot) {
        return Container(
          color: backgroundColor,
          child: Center(
            child: Text("Home"),
          ),
        );
      }
    );
  }

  //Menu y details

  Widget _menu(int indexSection){
    return ResponsiveListScaffold.builder(
      backgroundColor: backgroundColor,
      floatingActionButton: buildFloatingButton(),
      itemCount: sections[indexSection].items.length,
      tabletFlexDetailView: 2,
      detailBuilder: (context, index, tablet) => DetailsScreen(
        body: DetailsView(
          isTablet: tablet,
          item: sections[indexSection].items[index],
          sectionCategories: sections[indexSection].categories,
        )
      ),
      tabletItemNotSelected: Container(
          color: Colors.green
      ),
      itemBuilder: (context, index) => buildItemsOnSection(context, index, indexSection),
    );
  }

  Widget buildItemsOnSection(BuildContext context, int index, int indexSection){
    ItemCarta item = sections[indexSection].items[index];
    return Card(
      margin: EdgeInsets.all(7),
      child: Builder(
        builder: (context) {

          Widget title = Container(
              child: AutoSizeText(item.name,)
          );

          Widget subtitle = Container(
            child: Opacity(
                opacity: 0.7,
                child: AutoSizeText(item.description)
            ),
          );

          Widget leading = null;

          Widget trailing = null;

          if(item.prices != null){
            trailing = Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.prices[0]),
                      Opacity(opacity: 0.5, child: Text(sections[indexSection].categories[0]))
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.prices[1]),
                      Opacity(opacity: 0.5, child: Text(sections[indexSection].categories[1]))
                    ],
                  )
                ],
              ),
            );
          }else{
            trailing = Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.price),
                ],
              ),
            );
          }


          if(item.image != null && item.image != ''){
            leading = Image(
              image: AssetImage(item.image),
            );
          }

          return ListTile(
            title: title,
            leading: leading,
            subtitle: subtitle,
            trailing: trailing,
            isThreeLine: true,
          );
        },
      ),
    );
  }

  DetailsScreen buildDetailsScreenOnItemSelected(BuildContext context, int index, bool tablet, int indexSection){
    ItemCarta item = sections[indexSection].items[index];

    Widget options = null;

    int indexOfSelected = 0;

    if(item.prices != null && item.prices.isNotEmpty){
      List<Widget> radioButtons = item.prices.map((e) =>
        LabeledRadio(
          value: item.prices.indexOf(e),
          groupValue: indexOfSelected,
          onChanged: (value) {
            indexOfSelected = value;
          },
          padding: EdgeInsets.all(0),
          label: sections[indexSection].categories[item.prices.indexOf(e)],
        )

      ).toList();

      options = Column(
        children: radioButtons,
      );
    }

    Widget content = Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.name),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(item.description)
          ),
          SizedBox(height: 50,),
          options ?? SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => clickBuy(context, item),
                child: Text("Comprar"),
              ),
              ElevatedButton(
                onPressed: () => clickAddToKart(context, item),
                child: Text("Agregar al carrito"),
              )
            ],
          )
        ],
      ),
    );

    if(tablet){
      return DetailsScreen(
        body: Container(
          color: backgroundColor,
          child: Center(
            child: Card(
              margin: EdgeInsets.all(12),
              child: content
            ),
          ),
        ),
      );
    }

    return DetailsScreen(
      body: Container(
        child: content,
      ),
    );
  }

  void clickAddToKart(BuildContext context, ItemCarta item){
    BlocProvider.of<KartBloc>(context).add(KartAdding(name: item.name, price: item.price, quantity: 1));
  }

  void clickBuy(BuildContext context, ItemCarta item){
    BlocProvider.of<KartBloc>(context).add(KartAdding(name: item.name, price: item.price, quantity: 1));
    showDialog(
      context: context,
      builder: (context) => DialogKart(),
    );
  }

  //FloatingButton

  Widget buildFloatingButton(){
    return BlocBuilder<KartBloc, KartState>(
      builder: (context, state) {
        Badge badge = null;
        if(state.items != null && state.items.isNotEmpty){
          int count = 0;
          state.items.forEach((element) {count += element.quantity;});

          badge = Badge(
              badgeContent: Text(count.toString()),
              position: BadgePosition.topStart(top: -25),
              animationType: BadgeAnimationType.scale,
              animationDuration: Duration(milliseconds: 50),
              padding: EdgeInsets.all(5.5),
              child: Icon(Icons.shopping_cart)
          );

        }

        return FloatingActionButton(
          child: badge ?? Icon(Icons.shopping_cart),
          onPressed: () {
            clickKartButton(context);
          },
        );
      },
    );
  }

  void clickKartButton(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => DialogKart(),
    );
  }

}