import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../base/model/base_model.dart';
import '../../base/viewmodel/base_view_model.dart';

class NetworkManager extends BaseNetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  Dio? _dio;

  BuildContext? context;
  String? language;
  String? url;

  NetworkManager._init() {
    url = BASE_URL;
    final baseOptions = BaseOptions(
      baseUrl: BASE_URL,
    );
    _dio = Dio(baseOptions);
  }

  Future dioGet(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio!.get(path, queryParameters: queryParameters);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  Future dioPost<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.post(path, data: model);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  Future dioPut<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.put(path, data: model);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  Future dioDelete(String path) async {
    final response = await _dio!.delete(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  @override
  void setContext(BuildContext buildContext) {
    context = buildContext;
  }
}
