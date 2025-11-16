import 'package:flutter/material.dart';
import 'src/app/my_app.dart';
import 'src/services/favorite_service.dart';

/// Entry point of the training project.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoriteService.init();
  runApp(const MyApp());
}
