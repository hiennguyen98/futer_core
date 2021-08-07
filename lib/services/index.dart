
import 'package:Futer/data/base_response.dart';
import 'package:flutter/material.dart';

abstract class BaseServices {
  Future<BaseResponse> refreshToken ({@required Map<String, dynamic> data});

  Future<BaseResponse> loginNormal ({@required Map<String, dynamic> data});

  Future<BaseResponse> register ({@required Map<String, dynamic> data});

}

class AppService extends BaseServices{
  AppService._internal();

  static final AppService _instance = AppService._internal();

  factory AppService() => _instance;

  BaseServices _apiService;

  @override
  Future<BaseResponse> loginNormal({Map<String, dynamic> data}) {
    return _apiService.loginNormal(data: data);
  }

  @override
  Future<BaseResponse> refreshToken({Map<String, dynamic> data}) {
    return _apiService.refreshToken(data: data);
  }

  @override
  Future<BaseResponse> register({Map<String, dynamic> data}) {
    return _apiService.register(data: data);
  }

}