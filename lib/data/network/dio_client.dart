import 'package:build_context_provider/build_context_provider.dart';
import 'package:dio/dio.dart'
    show
        Dio,
        DioException,
        ErrorInterceptorHandler,
        QueuedInterceptorsWrapper,
        ResponseType;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../core/network/api_config.dart';
import '../../core/utils/shared_preference.dart';
import '../../di.dart';
import '../../widgets/snackbar.dart';
import 'dio_interceptor.dart';



class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.headers = ApiConfig.header
      // ..options.connectTimeout = ApiConfig.connectionTimeout
      // ..options.receiveTimeout = ApiConfig.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioInterceptor())
      ..interceptors.add(
        QueuedInterceptorsWrapper(
          onError: (DioException error, ErrorInterceptorHandler handler) async {
            print(error.response?.data);

            final errorMessage = _getErrorMessage(error.response?.data);
            if (error.response?.data?['errorcode'] == 401) {
              await removeSharedPreference('authToken');
              // globalStore.logout();
              // globalStore.navigatorKey.currentContext?.pushReplacementNamed("login");
            }
            if (error.response?.data?['errorcode'] != 0 && errorMessage.isNotEmpty) {
              customSnackbar(text: errorMessage, isError: true);
            } else if (error.response?.data?['errorcode'] == 0 && errorMessage.isNotEmpty) {
              customSnackbar(text: errorMessage, isError: false);
            }
            if (error.response?.statusCode == 401 || error.response?.statusCode == 404) {
              await removeSharedPreference('authToken');
              // globalStore.logout();
              // globalStore.navigatorKey.currentContext?.pushReplacementNamed("login");
              return;
            } else {
              return handler.next(error);
            }
          },
        ),
      );
  }

  String _getErrorMessage(Map<String, dynamic>? data) {
    final errorCode = data?['errorcode'];
    final errorMessage = data?['errormessage'];
    final message = data?['message'];
    if (errorCode == 422 && errorMessage is List) {
      return errorMessage.join('\n');
    }

    return errorMessage is String
        ? errorMessage
        : message is String
        ? message
        : '';
  }
}

// class DioClient {
//   final Dio dio;
//   DioClient(this.dio) {
//
//
//     dio
//       ..options.baseUrl = ApiConfig.baseUrl
//       ..options.headers = ApiConfig.header
//       ..options.connectTimeout = ApiConfig.connectionTimeout
//       ..options.receiveTimeout = ApiConfig.receiveTimeout
//       ..options.responseType = ResponseType.json
//       ..interceptors.add(DioInterceptor())
//     // ..interceptors.add(
//     //   PrettyDioLogger(
//     //     requestBody: true,
//     //   ),
//     // )
//       ..interceptors.add(
//         QueuedInterceptorsWrapper(
//           onError: (DioException error, ErrorInterceptorHandler handler) async {
//             print(error.response?.data);
//
//             final errorMessage = _getErrorMessage(error.response?.data);
//             if (error.response?.data['errorcode'] == 401) {
//               await  removeSharedPreference('authToken');
//               globalStore.logout();
//               globalStore.navigatorKey.currentContext
//                   ?.pushReplacementNamed("login");
//             }
//             if (error.response?.data['errorcode'] != 0) {
//               customSnackbar(text: errorMessage, isError: true);
//             } else {
//               customSnackbar(text: errorMessage, isError: false);
//             }
//             if (error.response?.statusCode == 401 ||
//                 error.response?.statusCode == 404) {
//               // BuildContextProvider()((context) {
//               //   context.pushNamed('login');
//               // });
//             }
//
//             else {
//               return handler.next(error);
//             }
//           },
//         ),
//       );
//   }
//   String _getErrorMessage(Map<String, dynamic> data) {
//     final errorCode = data['errorcode'];
//     final errorMessage = data['errormessage'];
//     final Message = data['message'];
//
//     if (errorCode == 422 && errorMessage is List) {
//       return errorMessage.join('\n');
//     }
//
//     return errorMessage is String ? errorMessage : Message;
//   }
// }
