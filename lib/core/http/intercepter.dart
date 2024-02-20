// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class Interceptor extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    if (kDebugMode) {
      debugPrint("REQUEST URL ----> ${request.url}");
      return request.send();
    }
    return request.send();
  }
}
