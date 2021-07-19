import 'package:flutter/foundation.dart';

class ItemsProvider extends ChangeNotifier {
  List _itemsData = [];

  List get getItemData => _itemsData;

  void addItems(String value) {
    _itemsData.add({'title': value, 'count': 0});
    notifyListeners();
  }

  void incrementCount(int index) {
    _itemsData[index]['count']++;
    notifyListeners();
  }
}
