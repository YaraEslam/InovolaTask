import 'model/item_model.dart';

abstract class ItemRepository {
  Future<Item> fetchItem();
}
