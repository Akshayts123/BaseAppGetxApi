
import 'dart:convert';

import 'package:dio/dio.dart' ;
import 'package:get/get.dart' as iget;
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/snackbar.dart';
import 'dio_exception.dart';
import '../../core/network/app_extension.dart';


abstract mixin class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethodTemplate(Future<Response<dynamic>> apiCallback) async {
    final Response<dynamic> response = await apiCallback;
    if (response.statusCode.success) {
      customSnackbar(text: 'Success', isError: false);
      final errorMessage = response.data['errormessage'] ?? '';
      if (response.data['errorcode'] != 0) {
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: true);
      } else {
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: false);
      }
      return true;
    } else {
      customSnackbar(text: 'Failure', isError: true);
      if (response.data['errorcode'] != 0) {

        final errorMessage = response.data['errormessage'] ?? '';
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: true);
      }
      throw DioExceptions();
    }
  }

  Future<T> _makePostRequestWithReturnType<T>(Future<Response<dynamic>> apiCallback) async {
    final Response<dynamic> response = await apiCallback;
    if (response.statusCode.success) {
      final errorMessage = response.data['errormessage'] ?? '';
      if (response.data['errorcode'] != 0) {
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: true);
      } else {
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: false);
      }
      return response.data;
    } else {
      if (response.data['errorcode'] != 0) {
        final errorMessage = response.data['errormessage'] ?? '';
        if (errorMessage.isNotEmpty) customSnackbar(text: errorMessage, isError: true);
      }
      throw DioExceptions();
    }
  }

  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<T> makePostRequestWithReturnType<T>(Future<Response<dynamic>> apiCallback) async {
    return _makePostRequestWithReturnType(apiCallback);
  }

  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<bool> makePatchRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  Future<List<T>> makeGetRequest<T>(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response<dynamic> response = await apiCallback;
    if (response.statusCode.success) {
      if (response.data is List) {
        return List<T>.from(
          (response.data as List).map((item) => getJsonCallback(item as Map<String, dynamic>)),
        );
      } else if (response.data['data'] is Map) {
        return [getJsonCallback(response.data['data'] as Map<String, dynamic>)];
      } else {
        throw Exception("Unexpected response format");
      }
    } else {
      throw Exception(response.statusMessage ?? 'Unknown error occurred');
    }
  }



  Future<List<T>> makeGetRequestWithoutData<T>(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response<dynamic> response = await apiCallback;
    if (response.statusCode.success) {
      if (response.data is List) {
        return List<T>.from(
          (response.data as List).map((item) => getJsonCallback(item as Map<String, dynamic>)),
        );
      } else if (response.data is Map) {
        return [getJsonCallback(response.data as Map<String, dynamic>)];
      } else {
        throw Exception("Unexpected response format");
      }
    } else {
      throw Exception(response.statusMessage ?? 'Unknown error occurred');
    }
  }
}



