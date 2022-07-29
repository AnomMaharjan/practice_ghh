import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_hay/injector/injector.dart';
import 'package:get_hay/models/Product_details_models.dart';
import 'package:get_hay/models/Species.dart';
import 'package:get_hay/models/addCategory.dart';
import 'package:get_hay/models/addSpecies.dart';
import 'package:get_hay/models/cart_model.dart';
import 'package:get_hay/models/categories.dart';
import 'package:get_hay/models/login.dart';
import 'package:get_hay/models/myProductionCut.dart';
import 'package:get_hay/models/my_products_model.dart';
import 'package:get_hay/models/orderDelveryStatusModel.dart';
import 'package:get_hay/models/order_model.dart';

import 'package:get_hay/models/received_order_model.dart';
import 'package:get_hay/models/shipping_address_model.dart';
import 'package:get_hay/models/wishlist.dart';
import 'package:get_hay/models/profile.dart';
import 'package:get_hay/storage/sharedprefences/shared_preferences_manager.dart';
import 'package:get_hay/utils/dio_logging_interceptors.dart';
import 'package:get_hay/config.dart';

class ApiAuthProvider {
  final Dio _dio = new Dio();
  // final String _baseUrl = 'http://119.8.174.175';
  final String _baseUrl = BASE_URL;

  ApiAuthProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }

  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  Future<Login> loginUser(Map loginBody) async {
    try {
      final response = await _dio.post(
        '/api/login/',
        data: loginBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return Login.fromJson(response.data);
    } catch (error) {
      print("login error $error");
      return null;
    }
  }

  Future<Login> registerUser(Map loginBody) async {
    try {
      final response = await _dio.post(
        '/api/register/',
        data: loginBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return Login.fromJson(response.data);
    } catch (error) {
      print("login error $error");
      return null;
    }
  }

  Future<ProductDetails> getProductDetails(String index) async {
    try {
      print(
          'accessToken: ${_sharedPreferencesManager.getString(SharedPreferencesManager.keyAccessToken)}');
      print('getAllUsers');
      final response = await _dio.get(
        '/api/my/products/$index/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      return ProductDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return null;
    }
  }

  ///My products api call
  Future<List<MyProducts>> getMyProducts() async {
    try {
      print('get my products');
      final response = await _dio.get(
        '/api/my/products/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return MyProducts.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('MY products API Error');
      print(error);
    }
    return null;
  }

  Future<List<MyReceivedOrder>> getMyReceivedOrder() async {
    try {
      print('get my received orders');
      final response = await _dio.get(
        '/api/received-orders/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data received');
        return MyReceivedOrder.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('MY received order API Error $error');
      print(error);
    }
    return null;
  }

  changeStatus(String status, int id) async {
    try {
      final response = await _dio.put(
        '/api/order/$id/status',
        data: {'status': status},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      print("response status ${response.statusCode}");
      if (response.statusCode == 200) {
        print("response ${response.data["status"]}");

        return response.data["status"];
      }
    } catch (error) {
      print("Change Status error $error");
      return null;
    }
    return null;
  }

  Future<List<WishlistProduct>> getWishListProducts() async {
    try {
      print('getwishlist');
      final response = await _dio.get(
        '/api/wishlists/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return WishlistProduct.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  Future<List<OrderList>> getOrderList() async {
    try {
      print('get order');
      final response = await _dio.get(
        '/api/orders/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return OrderList.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Order API Error');
      print(error);
    }
    return null;
  }

  addToWishList(int id) async {
    try {
      print('add to wish list');
      final response = await _dio.get(
        '/api/wishlist/$id/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        // Get.snackbar("Successfully Added to wish list", "");
        return true;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  deleteWishList(int id) async {
    try {
      print('add to cart list');
      final response = await _dio.get(
        '/api/wishlist/$id/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Successfully deleted from wishlist!',
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.red[400],
            gravity: ToastGravity.TOP);
        return true;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
      return false;
    }
    return null;
  }

  Future<List<Categories>> getCategories() async {
    try {
      print('getwishlist');
      final response = await _dio.get(
        '/api/categories',
        options: Options(
          headers: {
            'requirestoken': false,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return Categories.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  Future<List<MyProductionCut>> getMyProductionCut() async {
    try {
      print('get Myproductioncut');
      final response = await _dio.get(
        '/api/my/production-cuts/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return MyProductionCut.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  Future<AddCategory> addNewAddCategory(Map categoryId) async {
    try {
      final response = await _dio.post(
        '/api/my/category/',
        data: categoryId,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 201) {
        return AddCategory.fromJson(response.data);
      }
    } catch (error) {
      print("placing order error $error");
    }
    return null;
  }

  Future<List<Species>> getSpecies() async {
    try {
      print('getSpecies');
      final response = await _dio.get(
        '/api/my/species/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Species recieved');
        return Species.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  orderDeliveryStatus(bool deliverStatus, int id, String date) async {
    try {
      final response = await _dio.put(
        '/api/order/$id/delivery',
        data: {
          "is_delivered": deliverStatus,
          "delivered_date": date,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      print("response status ${response.statusCode}");
      if (response.statusCode == 200) {
        print("response ${response.data["is_delivered"]}");

        return response.data["is_delivered"];
      }
    } catch (error) {
      print("Change Status error $error");
      return null;
    }
    return null;
  }

  Future<List<OrderDeliveryStatus>> getOrderDeliverStatus() async {
    try {
      print('orderDliveryStatus');
      final response = await _dio.get(
        '/api/order/3/delivery/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Status recieved');
        return OrderDeliveryStatus.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('no status response');
      print(error);
    }
    return null;
  }

  Future<AddSpecies> addNewSpecies(Map speciesId) async {
    try {
      final response = await _dio.post(
        '/api/my/species/',
        data: speciesId,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 201) {
        return AddSpecies.fromJson(response.data);
      }
    } catch (error) {
      print("placing order error $error");
    }
    return null;
  }

  Future<MyProductionCut> addMyProductionCut(Map productionId) async {
    try {
      final response = await _dio.post(
        '/api/my/production-cuts/',
        data: productionId,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 201) {
        return MyProductionCut.fromJson(response.data);
      }
    } catch (error) {
      print("placing order error $error");
    }
    return null;
  }

  Future<CartList> getCartListProducts() async {
    try {
      print('getCartItem');
      final response = await _dio.get(
        '/api/cart/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');

        var cartList = CartList.mapArray(response.data);
        if (cartList.length > 0) {
          return cartList[0];
        }
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }

  addToCart(int quantity, int id) async {
    try {
      final response = await _dio.post(
        '/api/cart/$id/',
        data: {"quantity": quantity},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(
            msg: 'Product does not exist',
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.red[400],
            gravity: ToastGravity.TOP);
      }

      return Login.fromJson(response.data);
    } catch (error) {
      print("add to cart error $error");
      return null;
    }
  }

  deleteCartItem(int id) async {
    try {
      final response = await _dio.delete(
        '/api/cart/$id/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 204) {
        return true;
      }
    } catch (error) {
      print("login error $error");
      return false;
    }
  }

  deleteProductItem(int id) async {
    try {
      final response = await _dio.delete(
        '/api/my/products/$id/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 204) {
        return true;
      }
    } catch (error) {
      print("login error $error");
      return false;
    }
  }

  Future<List<ShippingAddress>> getShippingAddress() async {
    try {
      print('getShipping address');
      final response = await _dio.get(
        '/api/shipping-address/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return ShippingAddress.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('ShippingAddress API Error');
      print(error);
    }
    return null;
  }

  placeOrder(Map addressPk) async {
    try {
      final response = await _dio.post(
        '/api/orders/',
        data: addressPk,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      print("add shipping address error $error");
    }
    return false;
  }

  Future<ShippingAddress> addNewShippingAddress(Map shippingId) async {
    try {
      final response = await _dio.post(
        '/api/shipping-address/',
        data: shippingId,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'requirestoken': true,
          },
        ),
      );
      if (response.statusCode == 201) {
        return ShippingAddress.fromJson(response.data);
      }
    } catch (error) {
      print("placing order error $error");
    }
    return null;
  }

  Future<Profile> getProfile() async {
    try {
      print(
          'accessToken: ${_sharedPreferencesManager.getString(SharedPreferencesManager.keyAccessToken)}');
      print('getAllUsers');
      final response = await _dio.get(
        '/api/profile/',
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      print(response.data);
      return Profile.fromJson(response.data);
    } catch (error, stacktrace) {
      _printError(error, stacktrace);
      return null;
    }
  }

  createProduct(myProduct) async {
    try {
      final response = await _dio.post(
        '/api/my/products/',
        data: myProduct,
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      print("status code ${response.statusCode}");
      print(" response ${response.data}");
      if (response.statusCode == 201) {
        return true;
      } else {
        print(response.data.toString());
      }
    } catch (error) {
      print("create product address error $error");
    }
  }

  updateProduct(myProduct, id) async {
    try {
      final response = await _dio.put(
        '/api/my/products/$id/',
        data: myProduct,
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );
      print("status code ${response.statusCode}");
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.data.toString());
      }
    } catch (error) {
      print("create product address error $error");
    }
    return null;
  }

//
}
