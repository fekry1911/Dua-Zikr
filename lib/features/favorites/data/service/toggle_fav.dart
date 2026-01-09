import 'dart:convert';
import 'package:dua_zekr/features/favorites/data/models/fav_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../hadeeths_of_category/data/models/hadith_model.dart';
import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';

class FavoritesLocalService {
  final SharedPreferences prefs;

  FavoritesLocalService(this.prefs);

  static const _key = "favorite_hadeeths";

  /// Get all favorites
  List<Hadith> getFavorites() {
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    final List decoded = json.decode(jsonString);
    return decoded.map((e) => Hadith.fromJson(e)).toList();
  }

  /// Toggle favorite
  Future<void> toggleFavorite(Hadith hadeeth) async {
    final list = getFavorites();

    final index = list.indexWhere((e) => e.id == hadeeth.id);

    if (index != -1) {
      list.removeAt(index);
    } else {
      list.add(hadeeth);
    }

    await prefs.setString(
      _key,
      jsonEncode(list.map((e) => e.toJson()).toList()),
    );
  }

  /// Check if favorite
  bool isFavorite(String id) {
    final list = getFavorites();
    return list.any((e) => e.id == id);
  }

  /// Clear all favorites
  Future<void> clearFavorites() async {
    await prefs.remove(_key);
  }
}
