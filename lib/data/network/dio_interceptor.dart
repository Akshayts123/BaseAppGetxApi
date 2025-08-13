

import 'dart:developer';
import 'package:build_context_provider/build_context_provider.dart';
import 'package:dio/dio.dart'  ;
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:get/get.dart' as iget;
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/shared_preference.dart';
import '../../di.dart';
import '../../main.dart';
import '../../widgets/snackbar.dart';
import '../controllers/base_controller.dart';
import 'dio_exception.dart';


class DioInterceptor extends Interceptor {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );
  bool hasErrorOccurred = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i('====================START====================');
    logger.i('HTTP method => ${options.method}');
    logger.i('Request => ${options.baseUrl}${options.path}${options.queryParameters}');
    logger.i('Header  => ${options.headers}');

    String? token = getIt<SharedPreferences>().getString('authToken');

    // String? token = await getSharedPrefrence('authToken');
    double? user_longitude =  await getSharedPrefrenceDouble("long-set");
    double? user_latitude =  await getSharedPrefrenceDouble("lat-set");

    // String? serviceCode = stateVariableController.serviceCode.value;
    // String? serviceCode = await getSharedPrefrence('service-code');
    log("Token+++++++++++++++++++++ : $token");
    // print("<<<<<<@@<<<<<<<<$serviceCode>>>>>>>>@@>>>>>>");
    if (token !=null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Accept'] = 'application/json';
      // options.headers['service-code'] = serviceCode;
      print("iiiiiieieieieieieieie${user_longitude.toString()}");
      print("iiiiiieieieieieieieie${user_latitude.toString()}");
    } else {
      // Add serviceCode, user_longitude, and user_latitude if token is not available
      // options.headers['service-code'] = serviceCode;
      if (user_longitude != null) {
        options.headers['user-longitude'] = user_longitude.toString();
      }
      if (user_latitude != null) {
        options.headers['user-latitude'] = user_latitude.toString();
      }
    }

    logger.f('Updated Header => ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    logger.e(options.method); // Debug log
    logger.e('Error: ${err.error}, Message: ${err.message}');
    DioExceptions dioError = DioExceptions.fromDioError(err);
    String errorMessage = dioError.toString();
    String errorMessagetitle = dioError.message.toString();
    // Show error dialog only if it has not been shown before
    // if (!hasErrorOccurred) {
    //   // showErrorDialog(errorMessagetitle, errorMessage);
    //   hasErrorOccurred = true; // Set flag to true so the dialog is not shown again
    // }

    // if (err.response?.statusCode == 302) {
    //   // logger.e('Redirection Error: Please check if the URL or authorization is correct.');
    //   final context = AppContext.context;
    //   customSnackbar(context: context!, text: "error", isError: true);
    // }
    // if (err.response?.data['errorcode'] != 0) {
    //   // logger.e('API Failure: Please check if the URL or authorization is correct.');
    //   // final context = AppContext.context;
    //   customSnackbar( text: err.response?.data['errormessage']??'Unknown error' , isError: true);
    // }
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('Response => StatusCode: ${response.statusCode}'); // Debug log
    logger.d('Response => Body: ${response.data}');

    final responseData = response.data;

    if (response.statusCode == ApiState.success) {
      customSnackbar( text: 'Success' , isError: false);
      hasErrorOccurred = false; // Reset the error flag after a successful response
    }
      if (response.statusCode == ApiState.failure) {
      customSnackbar( text: "Failure" , isError: true);
    }

    return super.onResponse(response, handler);
  }
  // void showErrorDialog(String errormsg , String errorMessage) {
  //     showDialog(
  //       context: globalStore.navigatorKey.currentContext!,
  //       useRootNavigator: true, // Use the root navigator for dialog display
  //       routeSettings: RouteSettings(name: 'errorDialog'), // Set route settings (for navigation purposes, if needed)
  //       builder: (BuildContext context) {
  //         print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<H>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //         return RetryDialog(
  //           // title2: errormsg,
  //           title: errorMessage,
  //           onRetryPressed: () {
  //             // Close the dialog via root navigator
  //           },
  //         );
  //       },
  //     );
  // }
}
