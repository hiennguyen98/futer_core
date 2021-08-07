
import 'package:Futer/configs/app_configs.dart';
import 'package:Futer/data/base_request.dart';
import 'package:Futer/data/base_response.dart';
import 'package:Futer/data/endpoints/app_endpoints.dart';
import 'package:Futer/data/repository/repository_utils.dart';
import 'package:Futer/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class Repository {
  Repository._internal();

  static final Repository _instance = Repository._internal();

  factory Repository() => _instance;

  String _domain = APIConfig[AppConfig.APP_ENVIRONMENT];

  BaseRequest _baseRequest = BaseRequest(APIConfig[AppConfig.APP_ENVIRONMENT]);

  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();

  static final RepositoryUtils _repositoryUtils = RepositoryUtils();

  Future<BaseResponse> refreshToken({@required Map<String, dynamic> data}) async {
    String endpoint = _domain + Endpoints.REFRESHER_TOKEN;
    return _baseRequest.post(endpoint, data).then((BaseResponse baseResponse) async {
      if(baseResponse.code == 200) {
        _sharedPreferenceHelper.saveAuthToken(baseResponse.data['apiToken']);
      }
      return baseResponse;
    });
  }

  Future<BaseResponse> loginNormal ({@required Map<String, dynamic> data}) async {
    String endpoint = _domain + Endpoints.LOGIN;
    return _baseRequest.post(endpoint, data);
  }

  Future<BaseResponse> register ({@required Map<String, dynamic> data}) async {
    String endpoint = _domain + Endpoints.REGISTER;
    return _baseRequest.post(endpoint, data);
  }

}