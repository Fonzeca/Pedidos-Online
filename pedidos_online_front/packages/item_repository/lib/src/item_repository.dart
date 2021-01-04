
import 'dart:convert';

import '../item_repository.dart';
import 'package:http/http.dart' as http;

import 'client/mindia_http_client.dart';


class ItemRepository{

  final client = MindiaHttpClient(http.Client());
  final String IpServer = "http://vps-1791261-x.dattaweb.com";
  final String Port = "4596";

  Future<List<Item>> getAllItems() async{
    String endpoint = "/item/list";

    //var response = await client.get(IpServer + ":" + Port + endpoint);

    //print("getAllItems/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    //if(response.statusCode != 200) throw new Exception ("No se pudo conectar.");

    await new Future.delayed(const Duration(seconds: 2));

    var harcode = "[{\"name\":\"Hamburguesa Completa\",\"description\":\"Jamon, queso, tomate, lechuga, huevo y papas\",\"section\":\"Hamburguesas\",\"price\":\"\$400\",\"image\":\"imagen\"},{\"name\":\"Hamburguesa Americana\",\"description\":\"Panceta, cheddar, tomate, lechuga, cebolla, pepinillos y papas\",\"section\":\"Hamburguesas\",\"price\":\"\$450\",\"image\":\"imagen\"},{\"name\":\"De Lomo Completo\",\"description\":\"Jamón, queso, tomate, lechuga, huevo y papas\",\"section\":\"Sandwiches\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"Hamburguesa Simple\",\"description\":\"Jamon, queso y papas\",\"section\":\"Hamburguesas\",\"price\":\"\$350\",\"image\":\"imagen\"},{\"name\":\"De Lomo Completo\",\"description\":\"Jamón, queso, tomate, lechuga, huevo y papas\",\"section\":\"Sandwiches\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"De Milanesa Completo\",\"description\":\"Jamón, queso, tomate, lechuga, huevo y papas\",\"section\":\"Sandwiches\",\"price\":\"\$450\",\"image\":\"imagen\"},{\"name\":\"Papas clásicas\",\"description\":\"\",\"section\":\"Papas\",\"price\":\"\$280\",\"image\":\"imagen\"},{\"name\":\"Papas rústicas\",\"description\":\"\",\"section\":\"Papas\",\"price\":\"\$280\",\"image\":\"imagen\"},{\"name\":\"Papas ciboulette\",\"description\":\"Queso y ciboulette\",\"section\":\"Papas\",\"price\":\"\$300\",\"image\":\"imagen\"},{\"name\":\"Papas cheddar\",\"description\":\"Cheddar, panceta y verdeo\",\"section\":\"Papas\",\"price\":\"\$350\",\"image\":\"imagen\"},{\"name\":\"Muzzarella mediana\",\"description\":\"Muzzarella y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$260\",\"image\":\"imagen\"},{\"name\":\"Muzzarella grande\",\"description\":\"Muzzarella y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$450\",\"image\":\"imagen\"},{\"name\":\"Especial grande\",\"description\":\"Muzzarella, jamón, morrón y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$490\",\"image\":\"imagen\"},{\"name\":\"Especial mediana\",\"description\":\"Muzzarella, jamón, morrón y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$270\",\"image\":\"imagen\"},{\"name\":\"Napolitana mediana\",\"description\":\"Muzzarella, tomate y ajo (opcional sin ajo)\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Napolitana grande\",\"description\":\"Muzzarella, tomate y ajo (opcional sin ajo)\",\"section\":\"Pizzas\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"Roquefort grande\",\"description\":\"Muzzarella, roquefort y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"Roquefort mediana\",\"description\":\"Muzzarella, roquefort y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Calabreza mediana\",\"description\":\"Muzzarella, calabreza, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Calabreza grande\",\"description\":\"Muzzarella, calabreza, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"Española grande\",\"description\":\"Muzzarella, cantimpalo, pimentón, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$550\",\"image\":\"imagen\"},{\"name\":\"Española mediana\",\"description\":\"Muzzarella, cantimpalo, pimentón, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Fugazeta mediana\",\"description\":\"Muzzarella, jamón, cebolla y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Fugazeta grande\",\"description\":\"Muzzarella, jamón, cebolla y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$450\",\"image\":\"imagen\"},{\"name\":\"Margarita grande\",\"description\":\"Muzzarella, tomate trozado y hojas de albahaca\",\"section\":\"Pizzas\",\"price\":\"\$500\",\"image\":\"imagen\"},{\"name\":\"Margarita mediana\",\"description\":\"Muzzarella, tomate trozado y hojas de albahaca\",\"section\":\"Pizzas\",\"price\":\"\$290\",\"image\":\"imagen\"},{\"name\":\"Serrana mediana\",\"description\":\"Muzzarella, jamón crudo y rúcula\",\"section\":\"Pizzas\",\"price\":\"\$350\",\"image\":\"imagen\"},{\"name\":\"Serrana grande\",\"description\":\"Muzzarella, jamón crudo y rúcula\",\"section\":\"Pizzas\",\"price\":\"\$650\",\"image\":\"imagen\"},{\"name\":\"PRAGA grande\",\"description\":\"Muzzarella, panceta, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$590\",\"image\":\"imagen\"},{\"name\":\"PRAGA mediana\",\"description\":\"Muzzarella, panceta, verdeo y aceitunas\",\"section\":\"Pizzas\",\"price\":\"\$320\",\"image\":\"imagen\"}]";

    var jsonData = json.decode(harcode);
    List<Item> items = [];
    for(var i in jsonData){
      Item item = Item.fromJson(i);
      items.add(item);
    }
    return items;
  }

  Future<List<Item>> getItemsBySection(String section) async{
    String endpoint = "items/listBySection";
    String params = "?section"+section;

    var response = await client.get(IpServer + ":" + Port + endpoint + params);

    print("getItemsBySection/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    if(response.statusCode != 200){
      throw new Exception("No se pudo conectar.");
    }

    var jsonData = json.decode(response.body);
    List<Item> items = [];
    for(var i in jsonData){
      Item item = Item.fromJson(i);
      items.add(item);
    }
    return items;
  }

  Future<List<Section>> getAllSections() async{
    String endpoint = "/section/list";

    //var response = await client.get(IpServer + ":" + Port + endpoint);

    //print("getAllSections/ Status: " + response.statusCode.toString() + " Body: " + response.body);

    //if(response.statusCode != 200) throw new Exception ("No se pudo conectar.");

    var hardcode = "[{\"name\":\"Hamburguesas\",\"image\":\"imagen\"},{\"name\":\"Pizzas\",\"image\":\"imagen\"},{\"name\":\"Sandwiches\",\"image\":\"imagen\"},{\"name\":\"Papas\",\"image\":\"imagen\"}]";

    var jsonData = json.decode(hardcode);
    List<Section> sections = [];
    for(var s in jsonData){
      Section section = Section.fromJson(s);
      sections.add(section);
    }
    return sections;
  }
}