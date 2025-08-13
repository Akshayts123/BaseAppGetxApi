

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/config.dart';
import 'core/config/locator.dart';
import 'main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Config.initialize(Environments.local);
  await dotenv.load(fileName: "keys.env");
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove('skip_login');
  runApp( MyApp());
}
