
class CMRespDto {
  final int? code; // final = 반드시 초기화
  final String? msg;
  final dynamic data;

  CMRespDto({
    this.code,
    this.msg,
    this.data,
  });

  // 통신을 위해서 json 데이터 처럼 생긴 문자열 {"id":1} => Dart 오브젝트

  CMRespDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
