import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'dart:async';

enum ApiState { initial, loading, failure, success }

mixin BaseController {
  Rx<ApiState> apiStatus = ApiState.initial.obs;
  Rx<String> errorMessage = "".obs;
  var apiState = ApiState.initial.obs;

  // Function to check failure or success for Boolean responses
  void _checkFailureOrSuccess(Either<String, bool> failureOrSuccess) {
    failureOrSuccess.fold(
          (String failure) {
        apiStatus.value = ApiState.failure;
        errorMessage.value = failure;
      },
          (bool success) {


            apiStatus.value = ApiState.success;
      },
    );
  }

  // Function to check failure or success for generic data responses
  void _checkFailureOrSuccessWithData<T>(Either<String, T> failureOrSuccess) {
    failureOrSuccess.fold(
          (String failure) {
        apiStatus.value = ApiState.failure;
        errorMessage.value = failure;
      },
          (T success) {
        apiStatus.value = ApiState.success;
      },
    );
  }

  // Template for handling API operations with a timeout
  Future<void> _apiOperationTemplate(Future<Either<String, bool>> apiCallback, {Duration timeout = const Duration(seconds: 30)}) async {
    apiStatus.value = ApiState.loading;
    try {
      Either<String, bool> failureOrSuccess = await apiCallback.timeout(timeout);
      _checkFailureOrSuccess(failureOrSuccess);
      print(":::::::::::::::::::::::::::ssss");
    } catch (e) {
      if (e is TimeoutException) {
        apiStatus.value = ApiState.initial; // Reset state on timeout
        errorMessage.value = "Operation timed out";
      } else {
        errorMessage.value = "Unexpected error: ${e.toString()}";
      }
    }
  }

  // Template for handling API operations with data and a timeout
  Future<Either<String, T>> _apiOperationTemplateWithData<T>(Future<Either<String, T>> apiCallback, {Duration timeout = const Duration(seconds: 30)}) async {
    apiStatus.value = ApiState.loading;
    try {
      Either<String, T> failureOrSuccess = await apiCallback.timeout(timeout);
      _checkFailureOrSuccessWithData(failureOrSuccess);
      return failureOrSuccess;
    } catch (e) {
      if (e is TimeoutException) {
        apiStatus.value = ApiState.initial; // Reset state on timeout
        errorMessage.value = "Operation timed out";
      } else {
        errorMessage.value = "Unexpected error: ${e.toString()}";
      }
      return Left("Operation failed");
    }
  }

  // API operation methods
  void createItem(Future<Either<String, bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback, timeout: Duration(seconds: 30));
  }

  Future<Either<String, T>> createItemWithData<T>(Future<Either<String, T>> apiCallback) async {
    return await _apiOperationTemplateWithData(apiCallback, timeout: Duration(seconds: 30));
  }

  void updateItem(Future<Either<String, bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback, timeout: Duration(seconds: 30));
  }

  void deleteItem(Future<Either<String, bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback, timeout: Duration(seconds: 30));
  }

  // Reset to initial state if needed
  void resetState() {
    apiStatus.value = ApiState.initial;
  }

  void setApiState(ApiState state) {
    apiState.value = state;
  }

  // Automatically reset if still in loading state after a delay
  void setupGlobalReset() {
    ever(apiStatus, (state) {
      if (state == ApiState.loading) {
        Future.delayed(Duration(seconds: 30), () {
          if (apiStatus.value == ApiState.loading) {
            resetState();
            errorMessage.value = "Operation did not complete in time";
          }
        });
      }
    });
  }
}
