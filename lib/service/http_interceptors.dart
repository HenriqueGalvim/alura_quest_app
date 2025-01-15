import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class HttpInterceptors extends InterceptorContract {
  Logger logger = Logger();
  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    logger.d(
        "Requisição para ${request.url}\nCabeçalhos: ${request.headers}");
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    logger.d('----- Response -----');
    logger.d('Code: ${response.statusCode}');
    if (response is Response) {
          logger.d(
        "Cabeçalhos: ${response.headers}\nCorpo: ${response.body}");
    }
    return response;
  }
}
