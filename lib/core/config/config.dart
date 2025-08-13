// import 'package:firebase_core/firebase_core.dart';

enum Environments { local, test, prod }

class Config {
  late Environments environment;

  static Config? _instance;

  static Config get instance => _instance!;

  static void initialize(Environments env) async {
    _instance ??= Config._(env);
  }

  Config._(Environments env) {
    environment = env;
  }

  bool get logOneSignal {
    switch (environment) {
      case Environments.prod:
        return false;
      default:
        return true;
    }
  }

  bool get logApiCalls {
    switch (environment) {
      case Environments.prod:
        return false;
      default:
        return true;
    }
  }

  bool get logHttpHeaders {
    switch (environment) {
      case Environments.prod:
        return false;
      default:
        return true;
    }
  }

  String get baseUrl {
    switch (environment) {
      case Environments.local:
        return '';
      case Environments.test:
        return '';
      case Environments.prod:
        return '';
    }
  }

  String get paymentKey {
    switch (environment) {
      case Environments.local:
        return '';
      case Environments.test:
        return '';
      case Environments.prod:
        return '';
    }
  }

  String get mapKey {
    switch (environment) {
      case Environments.local:
        return '';
      case Environments.test:
        return '';
      case Environments.prod:
        return '';
    }
  }
}
