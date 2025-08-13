// ignore_for_file: unused_import

// import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/config.dart';
import 'core/config/locator.dart';
import 'di.dart';
import 'main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Config.initialize(Environments.prod);
  // await requestStoragePermission();
  // await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 100));
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await initInject(prefs);
  await dotenv.load(fileName: "keys.env");
  // await Upgrader.clearSavedSettings();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove('skip_login');
  runApp( MyApp());
}
