import 'package:inovola_task/network/ItemRepository.dart';
import 'package:inovola_task/network/ProdItemRepository.dart';

enum Flavor { PROD, MOCK }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ItemRepository get itemRepository {
    switch (_flavor) {
      case Flavor.PROD:
        return new ProdItemRepository();
      default:
        return new ProdItemRepository();
    }
  }
}
