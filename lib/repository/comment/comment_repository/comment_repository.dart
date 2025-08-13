import 'package:dartz/dartz.dart';
import '../../../data/api/comment/comment_api.dart';
import '../../../gen/models/comment/comment_model.dart';
import '../../../core/repository_helper/repository_helper.dart';

class CommentRepository with RepositoryHelper<comment_model> {
  final CommentApi commentApi;

  CommentRepository({required this.commentApi});

  Future<Either<String, bool>> createComment(comment_model comment) async {
    return checkItemFailOrSuccess(commentApi.createComment(comment));
  }

  Future<Either<String, bool>> deleteComment(comment_model comment) async {
    return checkItemFailOrSuccess(commentApi.deleteComment(comment));
  }

  Future<Either<String, List<comment_model>>> getComments() async {
    return checkItemsFailOrSuccess(commentApi.getComments());
  }
}
