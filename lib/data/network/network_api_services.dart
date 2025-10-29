import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;



class NetworkApiServices extends BaseApiServices {
  final headers= {
    "Content-Type": "Applicaton/json",
    "accepte": "application/json"
  };
 
  @override
  Future getApi(String url, String? token, body)async {
  
  }

Future<dynamic> allGetFunctions(String url, dynamic requestBody)async{

  

  try{
final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(requestBody) );

return response;
  }catch(e){
    debugPrint(e.toString());
  }

}

}