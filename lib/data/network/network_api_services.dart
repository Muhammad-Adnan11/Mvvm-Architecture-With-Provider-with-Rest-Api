import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/app_exception.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  static const Duration _timeoutDuration = Duration(seconds: 20);
  final headers = {
    "Content-Type": "applicaton/json",
    "Accepte": "application/json",
  };
 // -------------------- Generic GET ----------------------
 @override
  Future getAllFunction(String url, {String? token})async {
    try{
    final response = await http.get(Uri.parse(url),headers:headers).timeout(_timeoutDuration);
      return returnResponse(response);
    }on SocketException{
      throw NoInternetException('No internet connection, please try again later');
    }on TimeoutException{
      throw FetchDataException('Network Request time out.');
    }
    catch(e){
      throw Exception('error is --------------->${e}');
    }
  }
  // -------------------- Generic POST --------------------
  @override
  Future postAllFunction(String url, {String? token,dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ).timeout(_timeoutDuration);
      return returnResponse(response);
    }on SocketException{
      throw NoInternetException('No internet connection, please try again later');
    }on TimeoutException{
      throw FetchDataException('Network Request time out.');
    }
     catch (e) {
      throw Exception('error is --------------->${e}');
    }
  }

  // -------------------- Generic PUT ---------------------
  @override
  Future putAllFunction(String url, {String? token, body}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ).timeout(_timeoutDuration);
      return returnResponse(response);
    }on SocketException{
      throw NoInternetException('No internet connection, please try again later');
    }on TimeoutException{
      throw FetchDataException('Network Request time out.');
    }
    catch (e) {
      throw Exception('error is --------------->${e}');
    }
  }

  // -------------------- Generic PATCH ---------------------
  @override
  Future patchAllFunction(String url, {String? token, body}) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ).timeout(_timeoutDuration);
      return returnResponse(response);
    }on SocketException{
      throw NoInternetException('No internet connection, please try again later');
    }on TimeoutException{
      throw FetchDataException('Network Request time out.');
    }catch (e) {
      throw Exception('error is --------------->${e}');
    }
  }

  // -------------------- Generic DELETE ------------------
  @override
  Future deleteAllFunction(String url, {String? token, body}) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      ).timeout(_timeoutDuration);
      return returnResponse(response);
    }
    on NoInternetException{
      print('No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    }on BadRequestException{
      print('invild request.');
    }catch (e) {
      throw Exception('error is --------------->${e}');
    }
  }

  ///////  End //////

 dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    // SUCCESS CASES: Yahan data return hoga
    case 200:
    case 201:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    // CLIENT ERROR CASES: Yahan Exception throw hogi
    case 400:
      // Server se aaya error message nikaal kar exception mein bhejein
      throw BadRequestException(response.body.toString());
    
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());

    case 404:
      throw FetchDataException('Server not found: 404');

    // SERVER ERROR CASES
    case 500:
      throw FetchDataException('Internal Server Error: 500');

    default:
      throw FetchDataException(
        'Error occurred while communicating with server with status code: ${response.statusCode}',
      );
  }
}
}
