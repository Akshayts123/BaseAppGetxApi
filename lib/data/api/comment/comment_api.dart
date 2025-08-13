import '../../../core/network/api_config.dart';
import '../../../gen/models/comment/comment_model.dart';
import '../../network/api_helper.dart';
import '../../network/dio_client.dart';

class CommentApi with ApiHelper<comment_model> {
  final DioClient dioClient;

  CommentApi({required this.dioClient});

  Future<bool> createComment(comment_model comment) async {
    return await makePostRequest(dioClient.dio.post(ApiConfig.posts,));
  }

  Future<bool> deleteComment(comment_model comment) async {
    return await makeDeleteRequest(dioClient.dio.delete("${ApiConfig.comments}/${comment.id}"));
  }

  Future<List<comment_model>> getComments() async {
    // final queryParameters = {'post_id': "$postId"};

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.comments, ),
        comment_model.fromJson);
  }
}