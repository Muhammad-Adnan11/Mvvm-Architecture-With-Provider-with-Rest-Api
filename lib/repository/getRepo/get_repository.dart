import 'package:mvvm_architecture_with_provider_with_rest_api/data/network/network_api_services.dart';
import 'package:mvvm_architecture_with_provider_with_rest_api/utils/constants/app_urls/app_urls.dart';

class GetRepository{
final networkApiServices = NetworkApiServices();
 Future<dynamic> putFunction(dynamic data) async {
    try {
      final reponse = networkApiServices.putAllFunction(
        AppUrls.loginUrl,
       body: data,
      );
      print("Response------>$reponse");
    } catch (e) {
      print("Response--->$e");
    }
  }
}