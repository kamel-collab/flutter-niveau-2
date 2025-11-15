import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String key = 'favorites';

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<List<String>> getFavorites() async {
    final prefs = await _prefs;
    return prefs.getStringList(key) ?? [];
  }

  static Future<bool> isFavorite(String item) async {
    final list = await getFavorites();
    return list.contains(item);
  }

  static Future<void> addFavorite(String item) async {
    final prefs = await _prefs;
    final list = prefs.getStringList(key) ?? [];
    if (!list.contains(item)) {
      list.add(item);
      await prefs.setStringList(key, list);
    }
  }

  static Future<void> removeFavorite(String item) async {
    final prefs = await _prefs;
    final list = prefs.getStringList(key) ?? [];
    list.remove(item);
    await prefs.setStringList(key, list);
  }
}
