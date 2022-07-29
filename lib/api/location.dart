import 'package:dio/dio.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/models/profile.dart';
import 'package:get_hay/utils/dio_logging_interceptors.dart';

class LocationAPI {
  final Dio _dio = new Dio();
  final String _baseUrl = BASE_URL;

  LocationAPI() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  Future<Profile> location({double latitude, double longitude}) async {
    try {
      final response = await _dio.put(
        '/api/profile/location',
        data: {
          "latitude": latitude,
          "longitude": longitude,
        },
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 200) {
        print("response of location ${response.data}");
        return Profile.fromJson(response.data);
      } else {
        print("api error ${response.statusCode}");
      }
    } catch (error) {
      print("location fetch error $error");
    }
    return null;
  }
}
