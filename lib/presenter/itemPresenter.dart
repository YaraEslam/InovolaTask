
import 'package:inovola_task/network/ItemRepository.dart';
import 'package:inovola_task/network/model/item_model.dart';

import 'dependency_injection.dart';

abstract class ItemListViewContract {
  void onLoadItemComplete(Item items);
  void onLoadItemError();
}

class ItemListPresenter {
  ItemListViewContract _view;
  ItemRepository _repository;

  ItemListPresenter(this._view) {
    _repository = new Injector().itemRepository;
  }

  void loadItem() {
    _repository
        .fetchItem()
        .then((c) => _view.onLoadItemComplete(c))
        .catchError((onError) => _view.onLoadItemError());
  }
}
