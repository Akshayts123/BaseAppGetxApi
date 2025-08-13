import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_base_app/repository/comment/comment_repository/comment_repository.dart';
import 'package:getx_base_app/view_model/comment/comment_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/api/comment/comment_api.dart';
import 'data/network/dio_client.dart';


final getIt = GetIt.instance;

Future<void> initInject(prefs) async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  ///////////////////API CALL//////////////////
  getIt.registerLazySingleton<CommentApi>(
          () => CommentApi(dioClient: getIt<DioClient>()));

  getIt.registerLazySingleton<CommentRepository>(
        () => CommentRepository(commentApi: getIt<CommentApi>()),
  );

  getIt.registerFactory(
        () => CommentController(commentRepository: getIt<CommentRepository>()),
  );
}
