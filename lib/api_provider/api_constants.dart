import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
String tag = 'api_provider';


const baseUrl = 'https://designoweb.co/hollywoodhair/api/';
const shopifyUrl = 'https://a02f54.myshopify.com/admin/';
const shopifyTokenUrl = 'https://a02f54.myshopify.com/';
//https://a02f54.myshopify.com/api/2023-07/graphql.json
const shopifyStorefrontUrl = 'https://a02f54.myshopify.com/api/2023-07/';
const shopifyCustomerUrl = 'https://a02f54.myshopify.com/';


const String strGetRegister = 'user-signup';
const String strGetOtpLogin = 'otp-login';
const String strGetOtpVerify = 'otpverify';
const String strGetEmailLogin = 'email-login';
const String strGetProfileDetails = 'get-profile-details';
const String strUpdateProfileDetails = 'update-profile-details';
const String strNewPassword = 'change-password';
const String strGetAllAddress = 'get-all-address';
const String strAddAddress = 'add-address';
const String strGetAddressByID = 'get-address';
const String strDeleteAddress = 'delete-address';
const String strUpdateAddress = 'update-address';
const String strGetStaticPage = 'get-site-setting';
const String strChangePassword = 'change-customer-password';
const String strGetProductList = 'getProductList';
const String strGetProductByID = 'getProductById';


//shopify end points

const String loginShopify = 'graphql.json';
const String userDetailsShopify = 'customers.json';
const String addCartShopify = 'cart/add.json';
const String categoryShopify = 'custom_collections.json';
const String getCartShopify = 'cart.json';




handleException(error,stacktrace,DioError dioError){
  debugPrint("Exception occurred: $error stackTrace: $stacktrace");
  if (dioError.response!.statusCode == 401) {
    throwIfNoSuccess("unauthorized".tr);
  } else if (dioError.response!.statusCode == 500) {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("server_error".tr);
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  } else {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("something_went_wrong".tr);
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  }
}

void throwIfNoSuccess(String response) {
  throw HttpException(response);
}