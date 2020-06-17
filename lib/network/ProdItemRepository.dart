import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inovola_task/network/model/item_model.dart';

import 'ItemRepository.dart';

class ProdItemRepository implements ItemRepository {
  String itemUrl =
      "https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34";

  @override
  Future<Item> fetchItem() async {
    final response = await http.get(itemUrl);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      Item item = new Item.fromMap(jsonResponse);
      return item;
    }
  }
}
