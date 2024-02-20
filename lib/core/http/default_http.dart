import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as web;

import '../../global/result.dart';
import '../../repository/home_repository/model/weatherModel.dart';
import '../coroutine/coroutine.dart';
import '../coroutine/coroutine_params.dart';
import 'http.dart';

class DefaultHttp extends Http {
  final web.Client _client;
  final Coroutine _coroutine;

  DefaultHttp(this._client, this._coroutine);

  @override
  Future<Result<T?>> get<T extends ResponseModel>(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    var response = await _client
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 12));
    return _getParsedModel<T>(response);
  }

  Future<Result<T?>> _getParsedModel<T>(web.Response response) async {
    if (response.statusCode == 200) {
      var parser = _getParser<T>();
      if (parser != null) {
        if (T == GlobalAPIReponse) {
          return Result.value(GlobalAPIReponse(response.body) as T?);
        } else {
          if (kIsWeb) {
            return Result.value(parser(response.body));
          } else {
            return Result.value(
              await _coroutine.send(
                WithOneParam(
                  parser,
                  response.body,
                ),
              ) as T?,
            );
          }
        }
      } else {
        return Result.error(
          ErrorResult(100, "Unable to decode the response as ${T.runtimeType}"),
        );
      }
    } else {
      return Result.error(
        ErrorResult(response.statusCode, response.reasonPhrase),
      );
    }
  }

  Function(String)? _getParser<T>() {
    if (T == WeatherModel) {
      return weatherModelFromJson;
    }
    return null;
  }

  @override
  Future<Result<T?>> getList<T extends List<ResponseModel>?>(Uri url,
      {Map<String, String>? headers}) async {
    var response = await _client.get(url, headers: headers);
    return _getParsedModel<T>(response);
  }

  @override
  Future<Result> post<T extends ResponseModel>(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      var response = await _client.post(url,
          headers: headers, body: body, encoding: encoding);
      return _getParsedModel<T>(response);
    } catch (e) {
      return Result.error(ErrorResult(404, "Page not found ${e.runtimeType}"));
    }
  }

  @override
  Future<Result> patch(Uri url, {Object? body}) async {
    try {
      var response = await _client.patch(url, body: body);
      if (response.statusCode == 200) {
        return Result.value(response.body);
      } else {
        return Result.error(ErrorResult(response.statusCode,
            "Something went wrong ${response.runtimeType}"));
      }
    } catch (e) {
      return Result.error(ErrorResult(404, "Page not found ${e.runtimeType}"));
    }
  }

  @override
  Future<Result> delete(Uri url,
      {Map<String, String>? headers, Object? body}) async {
    try {
      var response = await _client.delete(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return Result.value(response.body);
      } else {
        return Result.value(response.body);
      }
    } catch (e) {
      return Result.error(ErrorResult(404, "Page not found ${e.runtimeType}"));
    }
  }

  @override
  Future<Result> put<T extends ResponseModel>(Uri url,
      {data, Map<String, String>? headers}) async {
    try {
      var response = await _client.put(url, body: data);

      if (response.statusCode == 200) {
        return Result.value(response);
      } else {
        return Result.error(ErrorResult(response.statusCode,
            "Something went wrong ${response.runtimeType}"));
      }
    } catch (e) {
      return Result.error(ErrorResult(404, "Page not found ${e.runtimeType}"));
    }
  }

  @override
  Future<Result> postList<T extends List<ResponseModel>>(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      var response = await _client.post(url, headers: headers, body: body);
      return _getParsedModel<T>(response);
    } catch (e) {
      return Result.error(ErrorResult(404, "Page not found ${e.runtimeType}"));
    }
  }
}
