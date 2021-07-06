import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Futer/data/base_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class BaseRequest {
  String _baseUrl;
  String get baseUrl => _baseUrl;

  BaseRequest(this._baseUrl);

  static const timeLimit = const Duration(seconds: 30);
  static http.Client _httpClient = http.Client();

  Future<BaseResponse> _parseHTTPResponse(String response) async {
    try {
      return BaseResponse.fromJson(
        json.decode(response) as Map<String, dynamic>
      );
    } catch (exception) {
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  Future<BaseResponse> get(String endpoint, {Map<String, dynamic> headers = const{}}) async {

    try {
      final response =
          await _httpClient.get(Uri(host: _baseUrl, path: endpoint), headers: headers).timeout(timeLimit);

      return await compute(_parseHTTPResponse, response.body);
    }on FormatException catch (exception) {
      // A format exception.
      return BaseResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return BaseResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return BaseResponse.systemError(message: exception.message);
    } catch (exception) {
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  Future<BaseResponse> post (String endpoint, dynamic data, {Map<String, dynamic> headers = const{}, Encoding encoding}) async {
    try {
      final response = await _httpClient
          .post(Uri(host: _baseUrl, path: endpoint), headers: headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);

      return await compute(_parseHTTPResponse, response.body);
    } on FormatException catch (exception) {
      // A format exception.
      return BaseResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return BaseResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return BaseResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  Future<BaseResponse> put(String endpoint, dynamic data, {Map<String, String> headers = const {}, Encoding encoding}) async {

    try {
      final response = await _httpClient
          .put(Uri(host: _baseUrl, path: endpoint), headers: headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);

      return await compute(_parseHTTPResponse, response.body);
    } on FormatException catch (exception) {
      // A format exception.
      return BaseResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return BaseResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return BaseResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  Future<BaseResponse> delete(String endpoint, dynamic data, {Map<String, String> headers = const {}}) async {

    try {
      final response =
      await _httpClient.delete(Uri(host: _baseUrl, path: endpoint), headers: headers).timeout(timeLimit);

      return await compute(_parseHTTPResponse, response.body);
    } on FormatException catch (exception) {
      // A format exception.
      return BaseResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return BaseResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return BaseResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return BaseResponse.systemError(message: exception.toString());
    }
  }

  Future<BaseResponse> patch(String endpoint, dynamic data, {Map<String, String> headers = const {}, Encoding encoding}) async {

    try {
      final response = await _httpClient
          .patch(Uri(host: _baseUrl, path: endpoint), headers: headers, body: json.encode(data), encoding: encoding)
          .timeout(timeLimit);

      return await compute(_parseHTTPResponse, response.body);
    } on FormatException catch (exception) {
      // A format exception.
      return BaseResponse.systemError(message: exception.message);
    } on TimeoutException catch (exception) {
      // A timeout occurred.
      return BaseResponse.systemError(message: exception.message);
    } on SocketException catch (exception) {
      // Socket exception
      return BaseResponse.systemError(message: exception.message);
    } catch (exception) {
      // Other exception
      return BaseResponse.systemError(message: exception.toString());
    }
  }
}