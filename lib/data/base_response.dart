import 'package:Futer/utils/AppLogger.dart';

class ResponseCode {
  /// Code server Error
  static const int SUCCESS = 0;
  static const int API_TOKEN_EXPIRED = 6;
  static const int REFRESH_TOKEN_EXPIRED = 9;
  static const int SYSTEM_ERROR = 10;
}

class BaseResponse<T> {
  int code;
  String message;
  T data;

  BaseResponse({this.code, this.data, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    AppLogger.log('json response $json');
    if(json == null) return BaseResponse.systemError();
    try{
      if(json['code'] == null) throw("json response format incorrect!");
      return BaseResponse(
        code: json['code'] as int,
        message: json['message'],
        data: json['data']
      );
    }
    catch (exception) {
      AppLogger.log('Response parse: ' + exception.toString());
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  factory BaseResponse.systemError({String message}) {
    return BaseResponse(code: ResponseCode.SYSTEM_ERROR, message: message);
  }
}
