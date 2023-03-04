import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init(); 
  await GetStorage.init();
  runApp(const QuranApp());
}
