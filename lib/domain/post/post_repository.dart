import 'package:flutter_blog/controller/dto/CMRespdto.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공 ! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    print(cmRespDto.code);
    print(cmRespDto.msg);
    print(cmRespDto.data);

    // if(cmRespDto.code == 1) {
    //   List<Post> posts = cmRespDto.data.
    // }
  }
}