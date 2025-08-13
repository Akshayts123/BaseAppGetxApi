import 'dart:async';

import 'package:flutter/services.dart';

class SmsAutoFill {
  static SmsAutoFill? _singleton;
  static const MethodChannel _channel = MethodChannel('sms_autofill');
  final StreamController<String> _code = StreamController.broadcast();

  factory SmsAutoFill() => _singleton ??= SmsAutoFill._();

  SmsAutoFill._() {
    _channel.setMethodCallHandler(_didReceive);
  }

  Future<void> _didReceive(MethodCall method) async {
    if (method.method == 'smscode') {
      _code.add(method.arguments);
    }
  }

  Stream<String> get code => _code.stream;

  Future<String?> get hint async {
    final String? hint = await _channel.invokeMethod('requestPhoneHint');
    return hint;
  }

  Future<void> listenForCode({String smsCodeRegexPattern = '\\d{4,6}'}) async {
    await _channel.invokeMethod('listenForCode',
        <String, String>{'smsCodeRegexPattern': smsCodeRegexPattern});
  }

  Future<void> unregisterListener() async {
    await _channel.invokeMethod('unregisterListener');
  }

  Future<String> get getAppSignature async {
    final String? appSignature = await _channel.invokeMethod('getAppSignature');
    return appSignature ?? '';
  }
}

mixin CodeAutoFill {
  final SmsAutoFill _autoFill = SmsAutoFill();
  String? code;
  StreamSubscription? _subscription;

  void listenForCode({String? smsCodeRegexPattern}) {
    _subscription = _autoFill.code.listen((code) {
      this.code = code;
      codeUpdated();
    });
    (smsCodeRegexPattern == null)
        ? _autoFill.listenForCode()
        : _autoFill.listenForCode(smsCodeRegexPattern: smsCodeRegexPattern);
  }

  Future<void> cancel() async {
    return _subscription?.cancel();
  }

  Future<void> unregisterListener() {
    return _autoFill.unregisterListener();
  }

  void codeUpdated();
}
