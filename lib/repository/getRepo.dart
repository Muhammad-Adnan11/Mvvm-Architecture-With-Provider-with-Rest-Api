import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/data/network/network_api_services.dart';

class Getrepo {
  final    _services = NetworkApiServices();


  Future <dynamic> getITem(String url, {String? token, dynamic body, })async{
    try{
      final apiResponse = _services.allGetFunctions(url, token);

      return  apiResponse;

    }catch(e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}