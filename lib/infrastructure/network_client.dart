import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/main.dart';

class NetworkClient {
  final _dio = Dio();

  Future<Response> createGetRequest(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      Response res = await _dio.get(url, data: data);
      // if (devMode) res.toString().log("resGet $url ->");
      if (devMode) {
        _dio.interceptors.add(PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,

          /// requestHeader: true,
          responseBody: true,
          compact: true,
          //  responseHeader: true,
          logPrint: (object) {
            object.toString().log("Res ${url.split("v1")[1]}");
          },
        ));
      }
      return res;
    } catch (e) {
      // if (devMode)
        e.toString().log("Get ERROR $url ->");
      rethrow;
    }
  }

  Future<Response> createPostRequest({
    required String url,
    required dynamic data,
  }) async {
    if (devMode) data.toString().log("postBody $url ->");
    try {
      Response res = await _dio.post(
        url,
        data: data,
        // options: Options()
      );
      if (devMode) {
        _dio.interceptors.add(PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,

          /// requestHeader: true,
          responseBody: true,
          compact: true,
          //  responseHeader: true,
          logPrint: (object) {
            object.toString().log("Res ${url.split("v1")[1]}");
          },
        ));
      }
      if (devMode) res.toString().log("postRes $url ->");

      return res;
    } catch (e) {
      if (devMode) e.toString().log("postERROR $url ->");

      rethrow;
    }
  }

  Future<Response> createPutRequest({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    if (devMode) data.toString().log("putBody $url ->");
    try {
      // Response res = await _dio.get(url);
      Response res = await _dio.put(url, data: data);
      if (devMode) {
        _dio.interceptors.add(PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,

          /// requestHeader: true,
          responseBody: true,
          compact: true,
          //  responseHeader: true,
          logPrint: (object) {
            object.toString().log("Res ${url.split("v1")[1]}");
          },
        ));
      }
      if (devMode) res.toString().log("putRes $url ->");
      return res;
    } catch (e) {
      if (devMode) e.toString().log("putERROR $url ->");
      rethrow;
    }
  }
}
