import 'package:flutter/foundation.dart';
import '../model/movie_model.dart';

class FavouiteViewModel with ChangeNotifier {
  final List<Results> _favItemList = [];
  List<Results> get favItemList => _favItemList;

  void addFavItem(Results value) {
    if (kDebugMode) {
      print('value: $value');
    }
    _favItemList.add(value);
    notifyListeners();
  }

  void removeFavItem(Results value) {
    _favItemList.removeWhere((item) => item.episodeId == value.episodeId);
    notifyListeners();
  }
}
