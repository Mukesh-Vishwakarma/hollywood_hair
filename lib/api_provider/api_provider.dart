import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/model/faq_model.dart';
import 'package:hollywood_hair/model/get_address_by_id.dart';
import 'package:hollywood_hair/model/get_all_address_model.dart';
import 'package:hollywood_hair/model/get_all_product_list_model.dart';
import 'package:hollywood_hair/model/product_by_id_model.dart';
import 'package:hollywood_hair/model/shopify_model/add_cart_model.dart';
import 'package:hollywood_hair/model/shopify_model/category_model.dart';
import 'package:hollywood_hair/model/shopify_model/customer_details_model.dart';
import 'package:hollywood_hair/model/shopify_model/get_cart_model.dart';
import 'package:hollywood_hair/model/shopify_model/loginModel.dart';
import 'package:hollywood_hair/model/shopify_model/signUp_model.dart';
import 'package:hollywood_hair/model/static_model.dart';
import 'package:hollywood_hair/model/user_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'DioLogger.dart';
import 'api_constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Dio _dio = Dio();
  DioError? _dioError;

  ApiProvider.shopify() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = shopifyUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {
        'Content-Type': 'application/json',
        'X-Shopify-Access-Token': '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'
      };
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        // failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  ApiProvider.shopifyWithToken() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = shopifyTokenUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      var accessToken = GetStorage().read(AppConstants.tokenShopify);
      print("Tokennnn>>> $accessToken");

      options.headers = {
        'Content-Type': 'application/json',
        'X-Shopify-Access-Token': "f9605f50addfe070acbc1a29120df7c5",
      'Cookie': '_cmp_a=%7B%22purposes%22%3A%7B%22a%22%3Atrue%2C%22p%22%3Atrue%2C%22m%22%3Atrue%2C%22t%22%3Atrue%7D%2C%22display_banner%22%3Afalse%2C%22merchant_geo%22%3A%22PL%22%2C%22sale_of_data_region%22%3Afalse%7D; _landing_page=%2Fchallenge; _orig_referrer=https%3A%2F%2Fa02f54.myshopify.com%2Faccount%2Flogin; _s=10154eff-7a3d-4450-9487-34c35d758918; _shopify_s=10154eff-7a3d-4450-9487-34c35d758918; _shopify_y=55d20969-bb2f-452c-af14-3b6a534445e8; _y=55d20969-bb2f-452c-af14-3b6a534445e8; cart=c1-b87097211a235e2411e139ab9ec3a80a; cart_sig=16f089842cba97e59415870fe28b5c27; cart_ts=1694151593; localization=PL; secure_customer_sig='
      };
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        // failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  ApiProvider.shopifyStorefront() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = shopifyStorefrontUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {
        // 'Content-Type': 'application/json',
        //X-Shopify-Storefront-Access-Token:ba3363d79cbeb3554927636e9ee5ea1b
        'X-Shopify-Storefront-Access-Token': 'ba3363d79cbeb3554927636e9ee5ea1b'
      };
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        // failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  ApiProvider.shopifyCustomer() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = shopifyCustomerUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {
        'Content-Type': 'application/jsona',
        'X-Shopify-Customer-Access-Token': 'de77aba9e1c2bcd05b9e3075266f4e7f'
      };
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        // failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {'Content-Type': 'application/json'};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      if (_checkSocketException(error)) {
        // failedToast('Internet connection failed');
      }
      return handler.next(error);
    }));
  }

  // for token
  ApiProvider.baseWithToken() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      String accessToken = GetStorage().read(AppConstants.accessToken);
      options.headers = {'Content-Type': 'application/json'};
      options.headers = {'token': accessToken};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      return handler.next(error);
    }));
  }

// for multipart
  ApiProvider.baseWithMultipart() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      String accessToken = GetStorage().read(AppConstants.accessToken);
      options.headers = {'Content-Type': 'multipart/form-data'};
      options.headers = {'x-access-token': accessToken};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      return handler.next(error);
    }));
  }

  //**** resgistretion

  Future funRegister(FormData params) async {
    try {
      print("response of signup >>>${params}");
      Response response = await _dio.post(strGetRegister, data: params);
      print("response of signup >>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  Future funLogin(FormData params) async {
    try {
      print("response of login >>>${params}");
      Response response = await _dio.post(strGetEmailLogin, data: params);
      print("response of login >>>${response.data!}");
      return UserModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** otp login

  Future funLoginOtp(FormData params) async {
    try {
      print("response of otp login >>>${params}");
      Response response = await _dio.post(strGetOtpLogin, data: params);
      print("response of otp login >>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** otp verification

  Future funOtpVerification(FormData params) async {
    try {
      print("response of Otp Verification >>>${params}");
      Response response = await _dio.post(strGetOtpVerify, data: params);
      print("response of Otp Verification >>>${response.data!}");
      return UserModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** get profile

  Future funGetProfile(FormData params) async {
    try {
      print("response of get profile >>>${params}");
      Response response = await _dio.post(strGetProfileDetails, data: params);
      print("response of get profile >>>${response.data!}");
      return UserModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** update profile

  Future funUpdateProfile(FormData params) async {
    try {
      print("response of update profile >>>${params}");
      Response response =
          await _dio.post(strUpdateProfileDetails, data: params);
      print("response of update profile >>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** new password

  Future funNewPassword(FormData params) async {
    try {
      print("response of change  password Customer>>>${params}");
      Response response = await _dio.post(strNewPassword, data: params);
      print("response of change  password Customer>>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //*****get all address

  Future funGetAllAddress(FormData params) async {
    try {
      print("response of get all address  >>>${params}");
      Response response = await _dio.post(strGetAllAddress, data: params);
      print("response of get all address  >>>${response.data!}");
      return GetAllAddressModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** add address

  Future funAddAddress(FormData params) async {
    try {
      print("response of add address >>>$params");
      Response response = await _dio.post(strAddAddress, data: params);
      print("response of add address  >>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** update address

  Future funUpdateAddress(FormData params) async {
    try {
      print("response of update address >>>$params");
      Response response = await _dio.post(strUpdateAddress, data: params);
      print("response of update address  >>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** get  address by id

  Future funGetAddressById(FormData params) async {
    try {
      print("response of get  address by id>>>$params");
      Response response = await _dio.post(strGetAddressByID, data: params);
      print("response of get  address by id>>>${response.data!}");
      return GetAddressByIdModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** delete address

  Future funDeleteAddress(FormData params) async {
    try {
      print("response of delete address>>>$params");
      Response response = await _dio.post(strDeleteAddress, data: params);
      print("response of delete address>>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** faq

  Future funFaq(FormData params) async {
    try {
      print("response of faq>>>$params");
      Response response = await _dio.post(strGetStaticPage, data: params);
      print("response of faq>>>${response.data!}");
      return FaqModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** static page

  Future funStaticPage(FormData params) async {
    try {
      print("response of static page>>>$params");
      Response response = await _dio.post(strGetStaticPage, data: params);
      print("response of static page>>>${response.data!}");
      return StaticModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** change password

  Future funChangePassword(FormData params) async {
    try {
      print("response of static page>>>$params");
      Response response = await _dio.post(strChangePassword, data: params);
      print("response of static page>>>${response.data!}");
      return BaseModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** get all product

  Future funGetAllProduct(FormData params) async {
    try {
      Response response = await _dio.post(strGetProductList, data: params);
      print("response of get all product>>>${response.data!}");
      return GetAllProductModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  // ****************************** shopify Api *************************************

  //**** SignUp api*****

  Future funSignUpShopify(params) async {
    try {
      print("response of SignUp shopify >>>${params}");
      Response response =
          await _dio.post(loginShopify, data: jsonEncode(params));
      print("response of SignUp shopify  >>>${response.data!}");
      return SignUpModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //**** Login api*****

  Future funLoginShopify(params) async {
    try {
      print("response of login shopify >>>${params}");
      Response response =
          await _dio.post(loginShopify, data: jsonEncode(params));
      print("response of login shopify  >>>${response.data!}");
      return LoginModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //********* getCustomerDetails

  Future funCustomerDetailsShopify(params) async {
    try {
      print("response of get Customer Details  shopify >>>${params}");
      Response response =
          await _dio.post(loginShopify, data: jsonEncode(params));
      print("response of get Customer Details shopify  >>>${response.data!}");
      return CustomerDetailsModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** Categories

  Future funCategoriesApi() async {
    try {
      Response response = await _dio.get(categoryShopify);
      print("response of Categories list>>>${response.data!}");
      return CategoryModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** product list shop

  Future funProductListShopify(product) async {
    try {
      Response response =
          await _dio.get('api/2023-07/collections/$product/products.json');
      print("response of Collections >>>${response.data!}");
      return GetAllProductModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //***** product deatils shop

  Future funProductDetailsShopify(product) async {
    try {
      //products/8655016329551.json
      Response response = await _dio.get('api/2023-07/products/$product.json');
      print("response of Collections >>>${response.data!}");
      return ProductDetailsModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //  &&&&& Add to cart

  Future funAddToCart(FormData params) async {
    try {
      Response response = await _dio.post(addCartShopify, data: params);
      print("response of add to cart >>>${response.data!}");
      return AddCartModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  //  ******** Get  to cart  **********

  Future funGetToCart() async {
    try {
      Response response = await _dio.get(getCartShopify);
      print("response of get cart list >>>${response.data!}");
      return GetCartModel.fromJson(response.data!);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }
}

bool _checkSocketException(DioError err) {
  return err.type == DioErrorType.unknown &&
      err.error != null &&
      err.error is SocketException;
}
