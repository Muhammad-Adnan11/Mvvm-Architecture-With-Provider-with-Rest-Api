import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/app_exception.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  static const Duration _timeoutDuration = Duration(seconds: 20);
  final headers = {
    "Content-Type": "Applicaton/json",
    "accepte": "application/json",
  };
 // -------------------- Generic GET ----------------------
 @override
  Future getAllFunction(String url, {String? token})async {
    // TODO: implement getAllFunction
    try{
    final response = await http.get(Uri.parse(url),headers:headers).timeout(_timeoutDuration);
      return response;
    }on NoInternetException{
      print( 'No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    }on BadRequestException{
      print('invild request.');
    }
    catch(e){
 throw Exception('error is --------------->${e}');
    }
    throw UnimplementedError();
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
      return response;
    }on NoInternetException{
      print( 'No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    }on BadRequestException{
      print('invild request.');
    }
     catch (e) {
      throw Exception('error is --------------->${e}');
      debugPrint(e.toString());
    }
    // TODO: implement postAllFunction
    throw UnimplementedError();
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
      return response;
    }on NoInternetException{
      print('No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    } on BadRequestException{
      print('invild request.');
    }
    catch (e) {
      throw Exception('error is --------------->${e}');
      debugPrint(e.toString());
    }
    // TODO: implement putAllFunction
    throw UnimplementedError();
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
      return response;
    }on NoInternetException{
      print('No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    }on BadRequestException{
      print('invild request.');
    }
     catch (e) {
      throw Exception('error is --------------->${e}');
      debugPrint(e.toString());
    }
    // TODO: implement patchAllFunction
    throw UnimplementedError();
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
      return response;
    }on NoInternetException{
      print('No internet connection, please try again later');
    }on TimeoutRequest{
      print('Request timed out. Please try again.');
    }on UnauthorisedException{
      print('Unuthorized request.');
    }on BadRequestException{
      print('invild request.');
       print('invild request.');
        print('invild request.');
         print('invild request.');
    }
     catch (e) {
      throw Exception('error is --------------->${e}');
      debugPrint(e.toString());
    }
    // TODO: implement deleteAllFunction
    throw UnimplementedError();
  }

  ///////  End //////

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
          'Error accorded while communicating with server ${response.statusCode}',
        );
    }
  }
}
