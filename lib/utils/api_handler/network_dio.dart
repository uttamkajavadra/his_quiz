// // The best way to handle network requests in Flutter
// // Applications frequently need to perform POST and GET and other HTTP requests.
// // Flutter provides an http package that supports making HTTP requests.

// // HTTP methods: GET, POST, PATCH, PUT, DELETE

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:his_quiz/config/api_string.dart';
// import 'package:his_quiz/config/local_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class HttpHandler {
//   static String baseURL = APIString.baseURL;

//   static Future<Map<String, String>> _getHeaders() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? token = prefs.getString(
//       LocalStorage.token,
//     );
//     log("Token -- '$token'");
//     return {
//       'Content-type': 'application/json',
//       'Accept': 'application/json',
//       if (token != null) 'Authorization': 'Bearer $token',
//     };
//   }

//   static Future<Map<String, dynamic>> formDataMethod(
//       {required String url,
//       Map<String, String>? body,
//       String? imagePath,
//       String? apiMethod,
//       List<String>? imageList,
//       String? imageKey}) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? token = prefs.getString(
//       LocalStorage.token,
//     );
//     var request = http.MultipartRequest(
//       (apiMethod ?? "POST").toUpperCase(),
//       Uri.parse(
//         "$baseURL$url",
//       ),
//     );
//     log("POST FORM DATA URL ----  $request");
//     request.headers.addAll(
//       {
//         if (token != null) 'Authorization': 'Bearer $token',
//         'Content-Type':
//             'multipart/form-data; boundary=<calculated when request is sent>'
//       },
//     );

//     log("FORM DATA BODY :-  $body");

//     if (imagePath != null) {
//       log("image -- $imagePath");
//       request.files.add(
//         await http.MultipartFile.fromPath('$imageKey', imagePath),
//       );
//     }
//     if (imageList != null) {
//       for (var element in imageList) {
//         request.files.add(
//           await http.MultipartFile.fromPath('$imageKey', element),
//         );
//       }
//     }
//     if (body != null) {
//       request.fields.addAll(body);
//     }
//     var response = await request.send();
//     var responseData = await response.stream.toBytes();
//     String responseString = String.fromCharCodes(responseData);
//     log("RESPONSE = $responseString");
//     log("RESPONSE CODE = ${response.statusCode}");

//     if (response.statusCode == 200) {
//       var data = json.decode(
//         responseString,
//       );
//       Map<String, dynamic> returnRes = {
//         'body': data,
//         'error': null,
//       };
//       return returnRes;
//     } else {
//       Map<String, dynamic> returnRes = {
//         'body': null,
//         'error': responseString,
//       };
//       log('Something went wrong');
//       return returnRes;
//     }
//   }

//   static Future<Map<String, dynamic>> getHttpMethod({
//     @required String? url,
//     bool isMockUrl = false,
//   }) async {
//     var header = await _getHeaders();

//     log("Get URL -- '$baseURL$url'");
//     log("Get Data -- 'null'");
//     http.Response response = await http.get(
//       Uri.parse(isMockUrl ? "$url" : "$baseURL$url"),
//       headers: header,
//     );
//     var res = handler(response);
//     return res;
//   }

//   static Future<Map<String, dynamic>> postHttpMethod({
//     @required String? url,
//     Map<String, dynamic>? data,
//   }) async {
//     var header = await _getHeaders();
//     log("Post URL -- '$baseURL$url'");
//     log("Post Data -- '$data'");
//     http.Response response = await http.post(
//       Uri.parse("$baseURL$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     var res = handler(response);
//     return res;
//   }

//   static Future<Map<String, dynamic>> patchHttpMethod({
//     @required String? url,
//     Map<String, dynamic>? data,
//   }) async {
//     var header = await _getHeaders();
//     log("Patch URL -- '$baseURL$url'");
//     log("Patch Data -- '$data'");
//     http.Response response = await http.patch(
//       Uri.parse("$baseURL$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     var res = handler(response);
//     return res;
//   }

//   static Future<Map<String, dynamic>> putHttpMethod({
//     @required String? url,
//     Map<String, dynamic>? data,
//   }) async {
//     var header = await _getHeaders();
//     log("Put URL -- '$baseURL$url'");
//     log("Put Data -- '$data'");
//     http.Response response = await http.put(
//       Uri.parse("$baseURL$url"),
//       headers: header,
//       body: data == null ? null : jsonEncode(data),
//     );
//     var res = handler(response);
//     return res;
//   }

//   static Future<Map<String, dynamic>> deleteHttpMethod({
//     @required String? url,
//   }) async {
//     var header = await _getHeaders();
//     log("Delete URL -- '$baseURL$url'");
//     http.Response response =
//         await http.delete(Uri.parse("$baseURL$url"), headers: header);
//     var res = handler(response);
//     return res;
//   }

//   static Map<String, dynamic> handler(http.Response response) {
//     log("Delete Response Code -- '${response.statusCode}'");
//     log("Delete Response -- '${response.body}'");
//     if (response.statusCode == 200) {
//       return {
//         'body': jsonDecode(response.body),
//         'headers': response.headers,
//         'error': null,
//       };
//     } else {
//       return {
//         'body': response.body,
//         'headers': response.headers,
//         'error': "${response.statusCode}",
//       };
//     }
//   }
// }

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:his_quiz/config/api_string.dart';
import 'package:his_quiz/config/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHandler {
  static String baseURL = APIString.baseURL;
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: baseURL,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          contentType: 'application/json',
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      // Add interceptors for logging
      _dio!.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
    return _dio!;
  }

  static Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LocalStorage.token);
    log("Token -- '$token'");
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Map<String, dynamic>> formDataMethod({
    required String url,
    Map<String, String>? body,
    String? imagePath,
    String? apiMethod = 'POST',
    List<String>? imageList,
    String? imageKey,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString(LocalStorage.token);

      FormData formData = FormData();

      // Add text fields
      if (body != null) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value));
        });
      }

      // Add single image
      if (imagePath != null && imageKey != null) {
        formData.files.add(
          MapEntry(
            imageKey,
            await MultipartFile.fromFile(imagePath),
          ),
        );
      }

      // Add multiple images
      if (imageList != null && imageKey != null) {
        for (var path in imageList) {
          formData.files.add(
            MapEntry(
              imageKey,
              await MultipartFile.fromFile(path),
            ),
          );
        }
      }

      final options = Options(
        method: apiMethod,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      );

      final response = await dio.request(
        url,
        data: formData,
        options: options,
      );

      return {
        'body': response.data,
        'error': null,
      };
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      return {
        'body': null,
        'error': e.response?.data ?? e.message,
      };
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({
    @required String? url,
    bool isMockUrl = false,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.get(
        isMockUrl ? url! : url!,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> postHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.post(
        url!,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> patchHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.patch(
        url!,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> putHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.put(
        url!,
        data: data,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> deleteHttpMethod({
    @required String? url,
  }) async {
    try {
      final headers = await _getHeaders();
      final response = await dio.delete(
        url!,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Map<String, dynamic> _handleResponse(Response response) {
    log("Response Code -- '${response.statusCode}'");
    log("Response -- '${response.data}'");

    if (response.statusCode == 200) {
      return {
        'body': response.data,
        'headers': response.headers.map,
        'error': null,
      };
    } else {
      return {
        'body': response.data,
        'headers': response.headers.map,
        'error': "${response.statusCode}",
      };
    }
  }

  static Map<String, dynamic> _handleError(DioException e) {
    log("Error: ${e.message}");
    return {
      'body': e.response?.data,
      'headers': e.response?.headers.map,
      'error': e.response?.statusCode?.toString() ?? e.message,
    };
  }
}
