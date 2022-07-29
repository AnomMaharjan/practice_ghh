import 'package:dio/dio.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/models/profile.dart';
import 'package:get_hay/utils/dio_logging_interceptors.dart';

class ProfileAPI {
  final Dio _dio = Dio();
  final String _baseUrl = BASE_URL;

  ProfileAPI() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  Future<List<Profile>> getProfile() async {
    final String apiUrl = "/api/profile";
    try {
      final response = await this._dio.get(apiUrl);

      if (response.statusCode == 200) {
        print('Data received');
        return Profile.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<Profile> updateProfile(
      {String firstName,
      String lastName,
      String email,
      String phoneNumber}) async {
    print("datas $firstName$lastName$email$phoneNumber");
    try {
      final response = await this._dio.put(
        "/api/profile/",
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "phone": phoneNumber,
          "email": email,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        print("Successfully profile updated: ${response.data}");
        return Profile.fromJson(response.data);
      } else {
        print("Error in profile update: ${response.statusCode}");
      }
    } on DioError catch (error) {
      print("Error in profile update: ${error.response.data}");
      print("Error in profile update: $error");
    }
    return null;
  }
}
