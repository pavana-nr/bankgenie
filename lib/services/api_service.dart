import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/Office_model/offices.dart';
import '../models/login_model/login_model.dart';

class RestClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://banqindev.eastus.cloudapp.azure.com:8080',
    ),
  );
  Future<LoginModel> login(userName, password) async {
    LoginModel? user;
    var params = {"username": userName, "password": password};
    try {
      Response userData = await dio.post(
        '/banqin-provider/api/v1/authentication',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Banqin-Platform-TenantId": "default"
        }),
        data: jsonEncode(params),
      );
      user = LoginModel.fromJson(userData.data);
    } on DioError catch (e) {
      parseDioError(e);
    }
    return user!;
  }

  Future<List<dynamic>> getoffice() async {
    List<dynamic>? offices;
    try {
      Response officeData = await dio.get(
        '/banqin-provider/api/v1/offices',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Banqin-Platform-TenantId": "default",
          HttpHeaders.authorizationHeader: "Basic YWRtaW46cGFzc3dvcmQ="
        }),
      );
      debugPrint('Offices List: $officeData');
      offices =
          officeData.data.map((office) => Offices.fromJson(office)).toList();
    } on DioError catch (e) {
      parseDioError(e);
    }
    return offices!;
  }

  void parseDioError(DioError e) {
    if (e.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      debugPrint('Error sending request!');
      debugPrint(e.message);
    }
  }
}
