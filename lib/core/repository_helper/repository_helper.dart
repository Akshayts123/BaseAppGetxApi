import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import '../../data/network/dio_exception.dart';


mixin RepositoryHelper<T> {
  Future<Either<String, List<T>>> checkItemsFailOrSuccess(
      Future<List<T>> apiCallback,
      ) async {
    try {
      final List<T> items = await apiCallback;
      return Right(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }

  Future<Either<String, bool>> checkItemFailOrSuccess(
      Future<bool> apiCallback,
      ) async {
    try {
      await apiCallback;
      return const Right(true);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }

  Future<Either<String, T>> checkItemFailOrSuccessWithData<T>(
      Future<T> apiCallback,
      ) async {
    try {
     final data =   await apiCallback;
      return  right(data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }
}
