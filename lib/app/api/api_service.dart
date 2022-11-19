import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

class ApiService {
  http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  Future get(
    String url, {
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      return await client.get(Uri.parse(url)).then((res) {
        if (res.ok) {
          return onSuccess(res);
        } else {
          return Future.error("HTTP request failed: ${res.body.toString()}");
        }
      });
    } catch (e) {
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    }
  }

  Future post(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .post(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    }
  }

  Future postWithSingleImageUpload(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .post(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    }
  }

  Future put(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .put(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    }
  }

  Future delete(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      return await client
          .delete(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error("Non-200 error: ${res.body.toString()}");
        }
      });
    } catch (e) {
      onError("");
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    }
  }
}
