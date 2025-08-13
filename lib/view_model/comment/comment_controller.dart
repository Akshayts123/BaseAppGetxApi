
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../data/controllers/base_controller.dart';
import '../../gen/models/comment/comment_model.dart';
import '../../repository/comment/comment_repository/comment_repository.dart';

class CommentController extends GetxController with StateMixin<List<comment_model>>, BaseController {
  final CommentRepository commentRepository;

  CommentController({required this.commentRepository});

  void createComment(comment_model comment) {
    createItem(commentRepository.createComment(comment));
  }

  void deleteComment(comment_model comment) {
    deleteItem(commentRepository.deleteComment(comment));
  }

  Future<void> getUserComments() async {
    change(null, status: RxStatus.loading());
    final Either<String, List<comment_model>> failureOrSuccess =
    (await commentRepository.getComments());

    failureOrSuccess.fold(
          (String failure) {
        change(null, status: RxStatus.error(failure));
      },
          (List<comment_model> comments) {
        if (comments.isEmpty) {
          change(null, status: RxStatus.empty());
          return true;
        } else {
          change(comments, status: RxStatus.success());
        }
      },
    );
  }
}
