import 'package:dio/dio.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/models/product.dart';
import 'package:get_hay/utils/dio_logging_interceptors.dart';

class ProductAPI {
  final Dio _dio = new Dio();
  final String _baseUrl = BASE_URL;

  ProductAPI() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  Future<List<Product>> getProducts() async {
    final String apiUrl = '/api/products/';
    try {
      print('getwishlist');
      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return Product.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Product API Error');
      print(error);
    }
    return null;
  }

  // Future<List<Product>> searchProduct(String value) async {
  //   try {
  //     print("/api/products/?search=$value");
  //     final response = await _dio.get(
  //       '/api/products/?search=$value',
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     print("response for search product${response.data}");
  //     return Product.mapArray(response.data);
  //   } catch (e) {
  //     print("search product error $e");
  //   }
  //   return null;
  // }

  Future<List<Product>> filterProducts({
    String searchText,
    int distance,
    String ordering,
    List<int> categories,
    bool showDeliveryOnly,
    double latitude,
    double longitude,
  }) async {
    Map<String, dynamic> filterQueryParams = {
      'search': searchText,
      'distance': distance.toString(),
      'ordering': ordering,
      'category': categories.map((e) => e.toString()).toList(),
      'latitude': latitude,
      'longitude': longitude,
    };

    if (showDeliveryOnly == true) {
      filterQueryParams['will_deliver'] = 1;
      // filterQueryParams['latitude'] = latitude;
      // filterQueryParams['longitude'] = longitude;
    }

    // var uri = Uri(
    //   path: '/api/products/',
    //   queryParameters: filterQueryParams,
    // );

    try {
      print("/api/products/");
      final response = await _dio.get(
        '/api/products/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: filterQueryParams,
      );
      print("response for search product${response.data}");
      return Product.mapArray(response.data);
    } catch (e) {
      print("search product error $e");
    }
    return null;
  }
}
