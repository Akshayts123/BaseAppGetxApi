import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_app/gen/models/comment/comment_model.dart';
import '../../core/utils/media_query.dart';
import '../../core/utils/spinkit_indicator.dart';
import '../../di.dart';
import '../../view_model/comment/comment_controller.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AutomaticKeepAliveClientMixin {

  final CommentController _controller = getIt<CommentController>();

  @override
  void initState() {
    _controller.getUserComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final mediaQuery = MediaQueryUtil(context);
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),

            _controller.obx(
                  (state) => ListView.builder(
                shrinkWrap: true,
                itemCount: state?.length,
                itemBuilder: (_, index) {
                  comment_model? comment = state![index];
                  return Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFFcad1e2),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(comment.name??'', ),
                                    IconButton(
                                      splashRadius: 25,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),onPressed: () {
                                        _controller.commentRepository.createComment(comment);
                                    },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.redAccent,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(comment.body??'')
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              onLoading: const SpinKitIndicator(type: SpinKitType.circle),
              onError: (error) => Text( "!error!"),
              onEmpty: const Text( "No comment!"),
        
            ),
          ],
        ),
      ),
    );
  }

  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF556080),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            const Icon(Icons.info, color: Color(0xFF2f87e8)),
            const SizedBox(width: 10),
            Text(message, style: const TextStyle(color: Colors.white))
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}

