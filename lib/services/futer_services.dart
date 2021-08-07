
import 'package:Futer/data/base_response.dart';
import 'package:Futer/data/repository/repository.dart';
import 'package:Futer/services/index.dart';

class FuterService extends BaseServices {

  Repository _repository = Repository();

  FuterService._internal();

  static final FuterService _instance = FuterService._internal();

  factory FuterService() => _instance;

  @override
  Future<BaseResponse> loginNormal({Map<String, dynamic> data}) {
    return _repository.loginNormal(data: data);
  }

  @override
  Future<BaseResponse> refreshToken({Map<String, dynamic> data}) {
    return _repository.refreshToken(data: data);
  }

  @override
  Future<BaseResponse> register({Map<String, dynamic> data}) {
    return _repository.register(data: data);
  }
}