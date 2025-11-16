import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {
  static const String key = 'favorites';

  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static List<String> getFavorites() {
    return _instance?.getStringList(key) ?? [];
  }

  static bool isFavorite(String item) {
    return getFavorites().contains(item);
  }

  static Future<void> addFavorite(String item) async {
    final list = getFavorites();
    if (!list.contains(item)) {
      list.add(item);
      await _instance?.setStringList(key, list);
    }
  }

  static Future<void> removeFavorite(String item) async {
    final list = getFavorites();
    list.remove(item);
    await _instance?.setStringList(key, list);
  }
}
