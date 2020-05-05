
import 'package:dio/dio.dart';
import 'package:yodas_knowledge/shared/constants.dart';
import 'package:yodas_knowledge/shared/custom_dio/custo_interceptor.dart';

class CustomDio extends Dio {

  CustomDio() {
    options.baseUrl = BASE_URL;
    interceptors.add(CustomInterceptor());
  }

}