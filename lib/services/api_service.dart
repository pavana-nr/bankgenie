import 'dart:convert';
import 'dart:io';

import 'package:bankgenie/utils/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/login_model/login_model.dart';
import '../models/office_model/office.dart';
import '../utils/constants.dart';

class RestClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: EndPoints.BASE_URL, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "Banqin-Platform-TenantId": "default"
    }),
  );

  Future<LoginModel> login(userName, password) async {
    LoginModel? user;
    var params = {"username": userName, "password": password};
    try {
      Response userData = await dio.post(
        EndPoints.GET_AUTH,
        data: jsonEncode(params),
      );
      user = LoginModel.fromJson(userData.data);
    } on DioError catch (e) {
      parseDioError(e);
    }
    return user!;
  }

  Future<List<Office>?> getOffices() async {
    List<Office>? offices;
    try {
      Response officeData = await dio.get(
        EndPoints.GET_OFFICES,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: "Basic ${Constants.AUTH_KEEY}"
        }),
      );
      offices =
          List<Office>.from(officeData.data.map((x) => Office.fromJson(x)));
    } on DioError catch (e) {
      parseDioError(e);
    } catch (e) {
      _onError(e);
    }
    return offices;
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

  void _onError(Object e) {
    debugPrint(e.toString());
  }
}
