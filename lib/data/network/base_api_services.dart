 abstract class  BaseApiServices {
    Future<dynamic> getApi(String url, String? token);
    Future<dynamic> postApi(String url, String? token, dynamic body);
    Future<dynamic> putApi(String url, String? token, dynamic body);
    Future<dynamic> patchApi(String url, String? token, dynamic body);
    Future<dynamic> deleteApi(String url, String? token, dynamic body); 
}