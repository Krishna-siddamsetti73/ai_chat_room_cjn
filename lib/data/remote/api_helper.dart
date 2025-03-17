import 'dart:convert';
import 'dart:io';
import 'package:ai_chat_room/data/remote/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> getApi({
    required String url,
    bool isHeaderRequired = true,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyParams,
  }) async {
    var uri = Uri.parse(url);

    try {
      headers ??= {};
      if (isHeaderRequired) {
        headers["apikey"] = "987654321";
      }

      var res = await http.get(uri, headers: headers);

      print("Response Code: ${res.statusCode}");
      print("Response Body: ${res.body}");

      return returnJsonResponse(res);
    } on SocketException catch (e) {
      throw FetchDataException(errorMsg: e.toString());
    }
  }

  dynamic returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            errorMsg:
                "Error occurred while communicating with server with status code ${response.statusCode}");
    }
  }
}
