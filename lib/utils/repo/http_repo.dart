import 'package:dio/dio.dart';

enum HttpMethods { get, post, delete, put }

class HttpRepo {
  Future<dynamic> callRequest(
      {required HttpMethods requestType,
      dynamic data,
      required String methodName,
      Map<String, dynamic> queryParameters = const {}}) async {
    const baseURl = "https://khansaa.com";
    final dioClient = Dio()
      ..options = BaseOptions(
        baseUrl: baseURl,
        followRedirects: false,
        validateStatus: (status) => true,
      );
    Response response;

    switch (requestType) {
      case HttpMethods.get:
        response = await dioClient.get(methodName,
            queryParameters: queryParameters,
            options: Options(contentType: Headers.jsonContentType));

        break;
      case HttpMethods.post:
        response = await dioClient.post(methodName,
            data: data,
            queryParameters: queryParameters,
            options: Options(contentType: Headers.jsonContentType));

        break;
      case HttpMethods.delete:
        response = await dioClient.delete(methodName,
            data: data,
            queryParameters: queryParameters,
            options: Options(contentType: Headers.jsonContentType));

        break;
      case HttpMethods.put:
        response = await dioClient.put(methodName,
            data: data,
            queryParameters: queryParameters,
            options: Options(contentType: Headers.jsonContentType));
    
    }
    return response.data;
  }
}
