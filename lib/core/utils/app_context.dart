import 'package:flutter/cupertino.dart';

// class AppContext {
//   static BuildContext? _context;
//   static set context(BuildContext? context) {
//     _context = context;
//   }
//   static BuildContext? get context => _context;
// }

// class AppContext {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   static BuildContext? get context => navigatorKey.currentContext;
// }
class ContextManager {
  static BuildContext? currentContext;

  static void setContext(BuildContext context) {
    currentContext = context;
  }

  static BuildContext? getContext() {
    return currentContext;
  }
}