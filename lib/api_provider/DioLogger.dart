import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
class DioLogger{
  static Logger log = Logger('unique logger');
  static void onSend(String tag, RequestOptions options){
    log.info('$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}');
    log.info('$tag - Request Headers : [${options.headers}]');
    log.info('$tag - Request Data : ${options.queryParameters.toString()}');
    log.info('$tag - Request Data : ${options.data.toString()}');
  }
  static void onSuccess(String tag, Response response){
    log.info('$tag - Response Path : [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path} Request Data : ${response.requestOptions.data.toString()}');
    log.info('$tag - Response statusCode : ${response.statusCode}');
    log.info('$tag - Response data : ${response.data.toString()}');
  }
  static void onError(String tag, DioError error){
    if(null != error.response){
      log.info('$tag - Error Path : [${error.response!.requestOptions.method}] ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path} Request Data : ${error.response!.requestOptions.data.toString()}');
      log.info('$tag - Error statusCode : ${error.response!.statusCode}');
      log.info('$tag - Error data : ${null != error.response!.data ? error.response!.data.toString() : ''}');
    }
    log.info('$tag - Error Message : ${error.message}');
  }
}