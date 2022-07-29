import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/models/user.dart';

class AuthAPI {
  final Dio _dio = new Dio();
  final String _baseUrl = BASE_URL;

  AuthAPI() {
    _dio.options.baseUrl = _baseUrl;
  }

  Future<User> login(
      {@required String username, @required String password}) async {
    final String apiUrl = '/api/login/';
    try {
      final response = await this._dio.post(apiUrl, data: {
        'username': username,
        'password': password,
      } );
      print(response);

      if (response.statusCode == 200) {
        print('Duhluhlhi');
        print(response.data);

        return User.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Login API Error');
      print(error);
    }
    return null;
  }
}
